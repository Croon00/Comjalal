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
	function add_cart(product_idx){
		
		var product_amount = $("#product_amount_" + product_idx).val()
		
		location.href = 'product_cart_pro?cart_product_idx=' + product_idx + '&amount=' + product_amount
	}
	</script>	


<style>
.list_repeat {
	list-style: none;
	padding-left: 0px;
}

.list_option_repeat {
	float: left;
	padding-right: 20px;
	padding-bottom: 20px;
}
</style>


</head>
<body>

	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">

		<div class='row'>

			<div class='col-sm-5'>
				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title">${productboardBean.product_board_name } 상세정보</h4>
						<div class="select_list">
							<c:forEach var="option_list_ul" begin="1" end="3">
								<ul class="list_repeat">
									<c:forEach var="option_list" begin="1" end="4">
										<li class="list_option_repeat"><select name="cars">
												<option selected>브랜드</option>
												<option value="volvo">ASUS</option>
												<option value="fiat">GIGABYTE</option>
												<option value="audi">MSI</option>
										</select></li>
									</c:forEach>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
				</div>
				<div class='col-sm-2'></div>
				<div class='col-sm-5'>
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">
								<a href="board_video_list">${productboardBean.product_board_name } 관련 영상</a>
							</h4>
							<div class="video_list">
								<c:forEach var="video_obj" items="${list3}">
								<div class="embed-responsive embed-responsive-16by9">
									<iframe width="560" height="315" 
									src="${video_obj.video_url }" 
									title="YouTube video player" frameborder="0" 
									allow="accelerometer; autoplay; clipboard-write; 
									encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								</c:forEach>
								<p style="text-align:center">최근 올라온 영상</p>
							</div>
						</div>
					</div>
				</div>

			
		</div>
	</div>
	
	<div class='container' style="margin-top: 20px;">

		<div class='row'>

			<div class='col-sm-4'></div>
			<div class='col-sm-6'>
				<form action="product_search_list_pro"class="form-inline md-form mr-auto mb-4" >
					<input class="form-control mr-sm-2" type="text" name="keyword" id="keyword"
						placeholder="상세정보 입력" aria-label="Search">
					<button class="btn btn-outline-warning btn-rounded btn-sm my-0" 
						type="submit">Search</button>
				</form>
			</div>
			<div class='col-sm-3'></div>
		</div>
	</div>
	
	<!-- 게시글 리스트 -->
	<div class="container">

		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">${productBean.product_name }</h4>
				<!-- 게시글 리스트 부분 -->
				<table class="table table-hover">

					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">상품</th>
							<th></th>
							<th class="text-center d-none d-md-table-cell">금액</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="obj" items="${product_list }">
							<tr>
								<td class="text-center d-none d-md-table-cell"
									style="width: 20%">
									<a href="product_read?product_notice_idx=${obj.product_notice_idx }&product_idx=${obj.product_idx}">
									<img src="upload/${obj.product_file }"
									alt="image" style="width: 100%" /></a></td>
								<td class="text-center d-none d-md-table-cell"
									style="width: 30%">
									<table style="width: 100%">
										<tbody>
											<tr>
												<td><a
													href="product_read?product_notice_idx=${obj.product_notice_idx }&product_idx=${obj.product_idx}"
													target="parent" style="font-weight: bold; font-size: 14px">
														${obj.product_name }</a></td>
											</tr>
											<tr height="10"></tr>
											<tr>
												<td><a
													href="product_read?product_notice_idx=${obj.product_notice_idx }&product_idx=${obj.product_idx}"
													target="parent" style="font-weight: bold; font-size: 11px">
														${obj.product_text }</a></td>
											</tr>
											<tr></tr>
										</tbody>

									</table>
								</td>
								<td class="text-center d-none d-md-table-cell"
									style="width: 10%; padding-top:65px">${obj.product_price }</td>

								<td class="text-center d-none d-md-table-cell"
									style="width: 40%">
			
										 <c:if test="${loginAdminBean.check_login == true }">
											<a href="product_delete?product_notice_idx=${obj.product_notice_idx }&product_idx=${obj.product_idx}">
											<img src="image/cart_del_btn.jpg">
											</a>
										</c:if>
										
										<input type='text'size="1" style="margin-top: 50px" id='product_amount_${obj.product_idx }'/>
									
										<img src="image/cart_btn.png" onclick="add_cart(${obj.product_idx})"/>
										
										 <a
											href="product_payment">
											<img src="image/buy_btn.png">
										</a>
								<td>
							</tr>
						</c:forEach>


					</tbody>
				</table>

				<!-- Pagination : 페이지 번호, PC 용 -->
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<li class="page-item">
						<a href="board_product_list?product_board_idx=${product_board_idx }&page=${prev }" class="page-link">이전</a>
						</li>

						<c:forEach begin="${page_start }" end="${page_end }" var="idx">
						<c:choose>
						<c:when test="${now_page == idx }">
						<li class="page-item active">
							<a href="board_product_list?product_board_idx=${product_board_idx }&page=${idx }" class="page-link">${idx }</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
							<a href="board_product_list?product_board_idx=${product_board_idx }&page=${idx }" class="page-link">${idx }</a>
						</li>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<li class="page-item">
						<a href="board_product_list?product_board_idx=${product_board_idx }&page=${next }" class="page-link">다음</a>
						</li>

					</ul>

				</div>

				<!-- pagination - mobile -->
				<div class='d-block d-md-none'>
					<ul class='pagination justify-content-center'>
						<li class='page-item'>
							<a href="board_product_list?product_board_idx=${product_board_idx }&page=${now_page - 1 }" class="page-link">이전</a>
						</li>
						<li class="page_item disabled">
							<a href="#" class="page-link">${now_page }</a>
						</li>
						<li class='page-item'>
							<a href="board_product_list?product_board_idx=${product_board_idx }&page=${now_page + 1 }" class="page-link">다음</a>
						</li>
					</ul>
				</div>
				
				<%--로그인을 했을때만 버튼을 노출시킨다 --%>
				<c:if test="${loginAdminBean.check_login == true }">
					<!-- 글쓰기 -->
					<div class="text-right">
						<a href="product_write?product_board_idx=${product_board_idx }&page=${now_page}" class="btn btn-primary">상품 등록</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>