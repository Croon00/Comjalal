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
	
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script type="text/javascript" src="js/product_cart.js"></script>

</head>

<body>

	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<form name="orderF" id="orderF" action="product_order_pro">
	<!-- 게시글 리스트 -->
	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">장바구니</h4>
				<!-- 게시글 리스트 부분 -->
				
				<table class="table table-hover">

					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">
								<div class="form-check" style="padding-bottom:15px">
									<label class="form-check-label"> 
									<input type="checkbox" id="allCheck" name="allCheck" class="form-check-input check-all" value="" >
									</label>
								</div>
							</th>
							<th class="text-center d-none d-md-table-cell">상품명</th>
							<th class="text-center d-none d-md-table-cell">상품금액</th>
							<th class="text-center d-none d-md-table-cell">수량</th>
							<th class="text-center d-none d-md-table-cell">주문금액</th>
							<th class="text-center d-none d-md-table-cell">삭제</th>

						</tr>
					</thead>
					<c:forEach var="obj" items="${cart_list }" varStatus="st">
					<input type="hidden" name="product_price" id="product_price_${obj.cart_idx }" value="${obj.product_price }" disabled/>
					<tbody>
						<tr>
							<td class="text-center d-none d-md-table-cell">
								<div class="form-check" style="padding-top:15px">
									<label class="form-check-label"> 
									<input type="checkbox" class="form-check-input " name="opnum"  value="${obj.cart_idx }" onclick="itemSum()">
									</label>
								</div>
								<div>
								</div>
							</td>
							<td class="text-center d-none d-md-table-cell" style="width: 30%">
								<table style="width: 100%">
									<tbody>
										<tr>
											
											<td><img src="upload/${obj.product_file }"
												style="width: 100%; width: 70px; height: 70px; margin-right:30px;"> <a
												href="https://www.one-pc.co.kr/shop/item.php?it_id=5565686350"
												target="parent" style="font-weight: bold; font-size: 14px; 	">
													${obj.product_name }</a></td>
										</tr>
										<tr height="10"></tr>
										<tr></tr>
									</tbody>
								</table>
							</td>
							<td class="text-center d-none d-md-table-cell" style="padding-top:50px">
							<img src="image/sell_card.jpg" alt="sell"> ${obj.product_price }</원td>
							<td class="text-center d-none d-md-table-cell" style="padding-top:50px">
								<div class="num">
                           			 <div class="updown">
                                <input type="text" name="p_num_" id="p_num_${obj.cart_idx }" size="2" maxlength="4" value="${obj.amount }" readonly>
                                <input type="hidden" name="cart_product_idx" id="cart_product_idx${obj.cart_idx }" value="${obj.cart_product_idx }"/>
                                <span onclick="plus_cart(${obj.cart_idx}); itemSum();"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="minus_cart(${obj.cart_idx}); itemSum();"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                           			 </div>
                       			</div>
                       		</td>
							<td class="text-cefnter d-none d-md-table-cell" style="padding-top:50px">
							<span id="money_${obj.cart_idx }">${obj.money }</span>
							</td>
							<td class="text-center d-none d-md-table-cell" style="padding-top:50px">
							<img src="image/cart_del_btn.jpg" style="border:1px solid red" onclick="delete_cart(${obj.cart_idx})">
								
							</td>

						</tr>
					</tbody>
					</c:forEach>
				</table>
				
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 40px">
		<div class="card shadow">
			<div class="card-body">
				<table class="table table-hover" style="width: 100%; height: 144px">
					<thead>
						<tr height="68">
							<td width="267">상품금액</td>
							<td width="267">추가금액(배송비)</td>
							<td width="267">총 할인금액</td>
							<td>총 결제금액 <span id="LAU_TotalPoint" style="display: none">0</span>
							</td>
						</tr>
						</thead>
						<tbody>
						<tr style="font-size: 20px; font-family: nt-M; font-weight: 400;">
							<td><span id="cart_sum">${cart_sum}</span>원</td>
							<td><span>0</span>원</td>
							<td><span>0</span>원</td>
							<td style="font-weight: 700;"><span id="cart_allsum">${cart_allsum}</span>원<br></td>
						</tr>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	
	
	<div class="container text-center" style="margin-top: 40px">
		<div class="card shadow">
			<div class="card-body">
			
				<a href="javascript:;" onclick="form_check('selectdelete');">
				<img src="image/cart_selectDel_btn.png" class="fl" alt="선택상품 삭제">
				</a>
				
			
				<button type="button" onclick='checkForm()' style="padding:0px">
				<img src="image/cart_select_btn.png" style="width:100%">
				</button>
				
			</div>
		</div>
	</div>
	</form>

	<!-- 하단 메뉴 -->
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />


</body>
</html>