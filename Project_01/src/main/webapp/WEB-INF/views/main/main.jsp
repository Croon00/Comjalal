<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BOOTSTRAP and JQuery CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<title>index</title>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('#Carousel').carousel({
			interval : 5000
		})
	});
</script>

<style type="text/css">
body {
	padding-top: 20px;
}

.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	margin-top: 90px;
}

.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}

.carousel-indicators .active {
	background: #428bca;
}
</style>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- 게시판 리스트 -->
	 <div class="container" style="margin-top: 100px">
		<!-- 12칸의 길이를 반반 씩 나눔 -->

		<div class="row">

			<div class="col-lg-6" style="margin-top: 20px">

				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title">영상 게시판</h4>
						<!-- 테이블 -->
						<table class="table table-hover">
							<!-- 표의 제목 부분 -->
							<thead>
								<tr>
									<!-- w-25 : 가로길이 25% 정도를 차지하게 한다. -->
									<!-- d-none : 제거한다 -->
									<!-- d-xl-table-cell : 브라우저 길이에 따라 보이게 한다. -->
									<th class="text-center w-25">영상 번호</th>
									<th>제목</th>
								</tr>
							</thead>
							<!-- 표의 항목 부분 -->
							<tbody>
								<c:forEach var="video_obj" items="${list2}">
									<tr>
										<td class="text-center">${video_obj.video_idx }</td>
										<td><a href="${video_obj.video_url }">${video_obj.video_subject }</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>


			</div>

			<c:forEach var="video_obj" items="${list3}">
			<!-- 1:1 aspect ratio -->
			<div class="col-lg-6" style="margin-top: 20px">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe width="560" height="315" src="${video_obj.video_url }" 
					title="YouTube video player" 
					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	
	
	<div class="container" style="margin-top:100px">
		<!-- 12칸의 길이를 반반 씩 나눔 -->
		
		<div class="row">
		
		<c:forEach var="board_obj" items="${board_list }">
			
			<div class="col-lg-6" style="margin-top:20px">
			
			<div class="card shadow">
				<div class="card-body">
					<h4 class="card-title">${board_obj.board_name }</h4>
					<!-- 테이블 -->
					<table class="table table-hover">
						<!-- 표의 제목 부분 -->
						<thead>
							<tr>
								<!-- w-25 : 가로길이 25% 정도를 차지하게 한다. -->
								<!-- d-none : 제거한다 -->
								<!-- d-xl-table-cell : 브라우저 길이에 따라 보이게 한다. -->
								<th class="text-center w-25">글번호</th>
								<th>제목</th>
								<th class="text-center w-25 d-none d-xl-table-cell">작성 날짜</th>
							</tr>
						</thead>
						<!-- 표의 항목 부분 -->
						<tbody>
							<%-- 5번 반복한다. --%>
							<c:forEach var="content_obj" items="${top5_map[board_obj.board_name] }">
								<tr>
									<td class="text-center">${content_obj.content_idx }</td>
									<td><a href="board_read?content_board_idx=${content_obj.content_board_idx }&content_idx=${content_obj.content_idx}">${content_obj.content_subject }</a></td>
									<td class="text-center d-none d-xl-table-cell">${content_obj.content_date }</td>
								</tr>
							</c:forEach>
							
						</tbody>	
					</table>
					
					<div class="text-right">
						<a href="board_list?board_idx=${board_obj.board_idx }" class="btn btn-primary">더보기</a>
					</div>
				</div>
			</div>
			</div>
			
			
			</c:forEach>
			
			
		
		</div>
	
	</div>


	<div class="container" style="margin-top: 100px" >
		<h3>TOP3 제품</h3>
		<div class="row">
			<div class="col-lg-12">
				<div id="Carousel" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#Carousel" data-slide-to="0" class="active"></li>
						<li data-target="#Carousel" data-slide-to="1"></li>
						<li data-target="#Carousel" data-slide-to="2"></li>
						<li data-target="#Carousel" data-slide-to="3"></li>
						<li data-target="#Carousel" data-slide-to="4"></li>
						<li data-target="#Carousel" data-slide-to="5"></li>
					</ol>
					
					<!-- Carousel items -->
					<div class="carousel-inner">
						<div class="item active carousel-item">
							<div class="row">
								<div class="col-lg-4">
									<a href="http://localhost:12345/Project_01/product_read?product_notice_idx=1&product_idx=15" class="thumbnail">
									<img src="image/ryzen5600x.jpg" alt="Image" style="right:30px; max-width: 100%; min-height:400px;"></a>
									<p>Ryzen 5600X</p>
								</div>
								<div class="col-lg-4">
									<a href="#" class="thumbnail">
									<img src="image/Ryzen 5800X.jpg" alt="Image" style="right:30px; max-width: 100%; min-height:400px;"></a>
									<p>Ryzen 5800X</p>
								</div>
								<div class="col-lg-4">
									<a href="#" class="thumbnail">
									<img src="image/Intel i7.jpg" alt="Image" style="right:30px; max-width: 100%; min-height:400px;"></a>
									<p>Intel i7</p>		
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->
						<c:forEach var="product_board_obj" items="${product_board_list }">
						<div class="item carousel-item">
							<div class="row">
								<c:forEach var="product_obj" items="${top3_map[product_board_obj.product_board_name]}">
								<div class="col-lg-4">
									<a href="product_read?product_notice_idx=${product_obj.product_notice_idx }&product_idx=${product_obj.product_idx}" class="thumbnail">
									<img src="upload/${product_obj.product_file }" alt="Image" style="right:30px; max-width: 100%; min-height:400px;"></a>
									<p>${product_obj.product_name }</p>
								</div>
								</c:forEach>
							</div>
							<!--.row-->
						</div>
						</c:forEach>
						
					</div>
					<!--.carousel-inner-->
					<a data-slide="prev" href="#Carousel" class="left carousel-control">&#x2039;</a>
					<a data-slide="next" href="#Carousel"
						class="right carousel-control">&#x203A;</a>
				</div>
				<!--.Carousel-->
			</div>
		</div>
	</div>
	<!--.container-->
	
	<div>
	
	
	</div>

	<!-- 하단 정보 부분 -->
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>