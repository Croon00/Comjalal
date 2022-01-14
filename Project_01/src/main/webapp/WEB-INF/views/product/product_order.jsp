<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- BOOTSTRAP and JQuery CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

	function check_input(){
		
		// 사용자가 입력한 내용을 가져온다.
		var user_name = $("#user_name").val()
		var user_id = $("#user_id").val()
		var user_pw = $("#user_pw").val()
		var user_pw2 = $("#user_pw2").val()
		var user_postal_code = $("#user_postal_code").val()
		var user_addr1 = $("#user_addr1").val()
		var user_addr2 = $("#user_addr2").val()
		
		// 정규식
		// 한글만 허용하며 2~4글자까지.
		var name_pattern = /^[가-힣]{2,4}$/
		// 첫글자는 영문대소문자, 나머지는 영문대소 숫자, 4 ~ 20글자
		var id_pattern =  /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/
		// 최소 8글자이며 숫자,문자,특수문자가 최소 1개씩 있어야 한다.
		var pw_pattern =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
		
		if(name_pattern.test(user_name) == false){
			alert("사용자 이름은 한글 2~4글자만 허용합니다")
			// 입력한 칸을 비운다.
			$("#user_name").val('')
			// 포커스를 준다.
			$("#user_name").focus()
			return false
		}
		
		if(id_pattern.test(user_id) == false){
			alert("아이디는 영문으로시작하고 영문과 숫자, 4 ~ 20글자를 허용합니다")
			$("#user_id").val('')
			$("#user_id").focus()
			return false
		}
		
		if(chk1 == false) {
			alert("아이디 중복 확인을 해주세요")
			$("#user_id").focus()
			return false
		}
		
		if(pw_pattern.test(user_pw) == false){
			alert("비밀번호는 8글자 이상이며, 영문,숫자,특수문자를 포함해야 합니다")
			$("#user_pw").val('')
			$("#user_pw").focus()
			return false
		}
		
		if(pw_pattern.test(user_pw2) == false){
			alert("비밀번호는 8글자 이상이며, 영문,숫자,특수문자를 포함해야 합니다")
			$("#user_pw2").val('')
			$("#user_pw2").focus()
			return false
		}
		
		if(user_pw != user_pw2){
			alert('비밀번호가 일치하지 않습니다')
			$("#user_pw").val('')
			$("#user_pw2").val('')
			$("#user_pw").focus()
			return false
		}
		
		if(user_postal_code.length == 0){
			alert('주소를 검색해주세요')
			$("#user_postal_code").focus()
			return false
		}
		
		if(user_addr2.length == 0){
			alert('상세주소를 입력해주세요')
			$("#user_addr2").focus()
			return false
		}
		
	
		return true
	}
	
	$(document).ready(function(){
		  
		  var sum = 0;
		  
		 	$("input[name='itemnum']").each(function() {
		 	
			b1 = $("#money_" + this.value).text()
			
			
			sum = sum + parseInt(b1)
		
			});
		  	
			$('#buytemp_sum').text(sum)
			$("#buytemp_allsum").text(sum)
			
})

	
</script>	
</head>
<body>
	<div id="orderform_wrap" class="dotum">

		<style type="text/css">
.chk_img {
	background: url('https://ftp.one-pc.co.kr/img/check_radio_icon.png')
		no-repeat;
	background-position: 0px 0px;
	width: 25px;
	height: 25px;
	float: left
}

.chk_img_checked {
	background-position: 0px -30px
}

#cart_construct3 img {
	vertical-align: middle
}

#cart_construct3 a {
	color: inherit;
	text-decoration: none
}

.combi_sub {
	width: 100%;
	color: #4f4f4f
}

.combi_sub td {
	padding: 12px 20px;
	border-bottom: 1px solid #e9e9e9
}

.combi_sub tr:last-of-type td {
	border: 0
}

#cart_cell {
	width: 1160px
}
</style>
		<!-- 상단 메뉴 -->
		<c:import url="/WEB-INF/views/include/top_menu.jsp" />
		
		<%-- 다음 주소 --%>
		<c:import url="/WEB-INF/views/include/daum_address.jsp"/>
		
		<div class="container">
		<!-- 장바구니 form -->
		<form name="payment" method="post" action="product_payment_pro" style="padding: 0px;">
			
			<!-- 리스트 내용(상품명, 상품금액, 수량 등 표시) -->
			<div id="cart_construct2" class="dotum">
				<table width="1160" cellpadding="0" cellspacing="0" border="0"
					style="border-top: 1px solid #5d5d5d; border-bottom: 1px solid #c8c8c8; color: #151515"
					class="dotum bold">
					<tbody>
						<tr height="50" align="center">
							<td width="63">
								<!-- 상세보기 -->
							</td>
							<td width="690">상품명</td>
							<td width="127">상품금액</td>
							<td width="55">수량</td>
							<td width="123">주문금액</td>
							<td width="102">포인트</td>
						</tr>
					</tbody>
				</table>

			</div>

				<!-- 주문서 작성 리스트 시작 -->
				
				<div id="cart_cell" align="center">
					<table width="1160" cellpadding="0" cellspacing="0" border="0"
						class="bold" style="border-bottom: 1px solid #c8c8c8">
						<c:forEach var="obj" items="${buytemp_list}">
						<input type="hidden" name="itemnum" value="${obj.buytemp_idx }" disabled/>
						<input type="hidden" name="buytemp_product_idx" id="buytemp_product_idx_${obj.buytemp_idx }" value="${obj.buytemp_product_idx }" disabled/>
						<input type="hidden" name="buytemp_date" id="buytemp_date_${obj.buytemp_idx }" value="${obj.buytemp_date }" disabled/>
						<tbody>
							<tr height="90">
								<td width="63" align="right"><a
									href= product_read?product_notice_idx=${obj.buytemp_product_idx} class="font12" style="color: black"> <img
										src="https://ftp.one-pc.co.kr/img/orderform_detail_btn_img.png"
										alt="상품 상세보기">
								</a></td>
								<td width="690" align="center">
									<!--img-->
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tbody>
											<tr valign="center" id="count">
												<td width="110" align="center">
												<img src="upload/${obj.product_file }"
													style="border: 1px solid #c8c8c8"
													width="70" height="70/"></td>
												<td width="531"><a
													href="https://www.one-pc.co.kr/shop/item.php?it_id=5565681473"
													target="_blink" class="font12" style="color: black">
														${obj.product_name } </a></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="127" align="center">

									<div class="font12"
										style="display: table; width: 100%; color: #4f4f4f">
										<img src="https://ftp.one-pc.co.kr/img/card_icon.jpg"
											style="float: left; margin-top: -2px"><span
											id="ct_amount_0" style="float: right">${obj.product_price }원</span>
									</div>
								</td>
								<td width="55" align="center">
									<div class="center font12" id="od_num_${obj.buytemp_idx } style="font-weight: 400">${obj.buytemp_amount }</div>
								</td>
								<td width="123" align="center">
									<!--t price-->

									<span id="money_${obj.buytemp_idx }" style="color: #0b6bb0">${obj.money }</span>원
								</td>
								<td width="102" align="center">
									<div id="sell_point_0" class="font11 bold" style="">포인트 :
										0원</div>
								</td>
							</tr>
						
						</tbody>
						</c:forEach>
					</table>

					<!--  완제 기본상품 -->
					<input type="hidden" id="combi_np_opt" name="combi_np_opt[]"
						value="">
				</div>
				
				<!-- 주문서작성 상품 리스트 끝 -->
				<input type="hidden" name="send_cost" value=""> <input
					type="hidden" name="list_count" id="list_count" value="1">

				<!-- 합계 금액 -->


			<img src="https://ftp.one-pc.co.kr/img/nOrder_tit_2.png" alt="결제정보"
				style="margin-top: 30px">
			<table class="dotum bold" cellpadding="0" cellspacing="0"
				style="width: 1160px; height: 144px; background: url(https://ftp.one-pc.co.kr/img/order_info_bg.png) no-repeat 0 0; border-collapse: collapse; color: #151515; font-size: 16px; text-align: center; margin-top: 10px">
				<tbody>
					<tr height="68">
						<td width="267">상품금액</td>
						<td width="267">추가금액(배송비)</td>
						<td width="267">총 할인금액</td>
						<td>총 결제금액 <span id="LAY_TotalPoint" style="display: none">0원</span>
						</td>
					</tr>
					<tr style="font-size: 20px; font-family: 'nt-M'; font-weight: 400">
						<td><span id="buytemp_sum">${buytemp_sum}</span>원</td>
						<td><span id="parcel_price">0원</span></td>
						<td>- <span id="discount_price">0</span>원
						</td>
						<td style="font-weight: 700"><span id="buytemp_allsum">${buytemp_allsum}</span>원</td>
					</tr>
				</tbody>
			</table>
		
							<div class='form-group'style="margin-top:100px">
								<label for='ordered_name' >이름</label>
								<input type='text' id='ordered_name' name='ordered_name' class='form-control' />
							</div>
							
							<div class='form-group'>
								<label for='ordered_phone'>휴대폰 번호</label>
								<div class='input-group'>
									<input type='text' id='ordered_phone' name='ordered_phone' class='form-control'/>
									
								</div>
							</div>
							<div class='form-group'>
								<label for='ordered_email'>이메일 주소</label>
								<input type='text' id='ordered_email' name='ordered_email' class='form-control'/>
							</div>
							
							
							<div class='form-group'>
								<label for='ordered_postal_code'>주소</label>
								<div class='input-group'>
									<input type='text' id='ordered_postal_code' name='ordered_postal_code' class='form-control' readonly="readonly"/>
									<div class='input-group-append'>
										<button type='button' class='btn btn-primary' onclick='sample2_execDaumPostcode()'>주소검색</button>
									</div>
								</div>
							</div>
							
							
							<div class='form-group'>
								<input type='text' id='ordered_addr1' name='ordered_addr1' class='form-control' readonly="readonly"/>
							</div>
							
							<div class='form-group'>
								<input type='text' id='ordered_addr2' name='ordered_addr2' class='form-control'/>
							</div>
							
							<div class='form-group'>
								<label for='user_pw2'>주문시 요청사항</label>
								<input type='text' id='ordered_required' name='ordered_required' class='form-control'/>
							</div>
							
							<div class='form-group'>
								<div class='text-right'>
									<button type='submit' class='btn btn-primary'>결제확인</button>
									<a href='user_login' class='btn btn-info'>취소</a>
								</div>
							</div>
		</form>
		</div>
		
		
		
	</div>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>