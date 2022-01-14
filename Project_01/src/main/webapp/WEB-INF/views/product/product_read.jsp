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

</head>
<style>
form {
	display: block;
	margin-top: 0em;
}
</style>
<body>

	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />





	<form name="fitem" method="post" style="margin: 0px;"
		enctype="multipart/form-data">

		<!-- 상단 타이틀 -->

			
			<table class="dotum" width="1160" cellpadding="0" cellspacing="0"
				border="0" align="center"
				style="padding-top: 20px; color: #4f4f4f; border-bottom: 1px solid #c8c8c8">


				<tbody>
					<tr valign="top">
						<td style="font-size: 28px" class="bold">${readProductBean.product_name }</td>
						
					</tr>
					
					<tr height="10">
						<td></td>
					</tr>
					<tr>
					</tr>
					<tr valign="top">
						<td style="font-size: 11px">
							<div style="width: 1150px; font-size: 11px">${readProductBean.product_text }</div>
						</td>
					</tr>
					<tr height="17">
						<td></td>
					</tr>
				</tbody>

			</table>
		</div>
		<div class="container">
			<!-- 상단 정보  -->
			<table class="dotum" width="1160" cellpadding="0" cellspacing="0"
				border="0" align="center" style="color: #151515">
				<tbody>
					<tr height="670">
						<td width="550">
							<div>
								<img src="upload/${readProductBean.product_file }"
									style="display: block;" width="550" height="550"
									onerror="this.src='https://ftp.one-pc.co.kr/img/no_image_131.gif';"
									alt="상품이미지">
							</div>
						</td>
						<td width="110"></td>
						<td width="500" valign="top">
							<table cellpadding="0" cellspacing="0"
								style="width: 100%; border-collapse: collapse; table-layout: fixed; margin-top: 25px">
								<tbody>
									<tr height="40">
										<td width="155">판매가</td>
										<td>
											<div style="float: left">${readProductBean.product_price }</div>
										</td>
									</tr>
									<tr height="40">
										<td>제조사</td>
										<td>${readProductBean.product_made }</td>
									</tr>
									<tr height="40">
										<td>제품코드</td>
										<td>${readProductBean.product_code }</td>
									</tr>
									<tr height="40">
										<td>택배정보</td>
										<td>택배 (평균 1.0일 : 결제 완료 후)</td>
									</tr>
									<tr height="40">
										<td>주문수량</td>
										<td><input type="text" value="1" id="ct_qty"
											name="ct_qty" onchange="count_check(this);"
											class="center dotum"
											style="width: 40px; height: 25px; vertical-align: bottom; position: absolute; margin-left: 30px; border: none; margin-top: 2px"
											onkeypress="if((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"
											maxlength="3" onkeyup="count_check(this);" autocomplete="Off">
											<img src="https://ftp.one-pc.co.kr/img/cnt_bg2.png"
											usemap="#MAP_BtnCnt0"> <map name="MAP_BtnCnt0">
												<area shape="rect" coords="72,0,97,28"
													href="javascript:count_change('PLUS');" onfocus="blur();"
													style="cursor: pointer;">
												<area shape="rect" coords="0,0,27,28"
													href="javascript:count_change('MINUS');" onfocus="blur();"
													style="cursor: pointer;">
											</map></td>
									</tr>
								</tbody>
							</table>

							<div
								style="margin-top: 17px; border-top: 1px solid #c8c8c8; border-bottom: 1px solid #c8c8c8; padding: 18px 0; color: #151515; font-size: 20px; font-family: 'nt-M'">
								<span>총 결제금액 : </span>
								<div style="float: right" class="bold">
									<span id="total_price">${readProductBean.product_price }</span>원
								</div>
							</div>

							<table cellpadding="0" cellspacing="0"
								style="width: 100%; border-collapse: collapse; table-layout: fixed; margin-top: 18px">
								<tbody>
									<tr>
										<td align="center"><a
											href="javascript:fitemcheck(document.fitem, 'cart_update');"><img
												src="https://ftp.one-pc.co.kr/img/nItem_cart_btn.png"
												alt="장바구니"></a></td>
										<td align="right"><a
											href="javascript:fitemcheck(document.fitem, 'direct_buy');"><img
												src="https://ftp.one-pc.co.kr/img/nItem_buy_btn.png"
												alt="바로구매"></a></td>


									</tr>

								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="form-group">
				
			</div>
		</div>

	</form>

	<form name="fitem2" method="post" style="margin: 0px;"
		enctype="multipart/form-data">
		<div style="width: 100%; margin: 10px 0px 10px 0px;" align="center">
			<div id="itemDeimg_container text-center"
				style="position: relative; margin-top: 21px">
				<p>
					<img src="upload/${readProductBean.product_file2 }" title="" alt="">
				</p>
				<grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration>
			</div>
		</div>
	</form>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>