<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- BOOTSTRAP and JQuery CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<!-- 게시글 리스트 -->
	<div class="container">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">영상 게시판</h4>


				<!-- 게시글 리스트 부분 -->
				<table class="table table-hover">

					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">영상 종류</th>
							<th class="text-center d-none d-md-table-cell">영상/제목</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="obj" items="${video_list }">
						<tr>
							<td class="text-center d-none d-md-table-cell" style="width:20%">
							<c:if test="${loginAdminBean.check_login == true }">
								<a href="video_board_delete?video_notice_idx=${obj.video_notice_idx }&video_idx=${obj.video_idx}">
									<img src="image/cart_del_btn.jpg" style="margin-top: 200px; marign-left:50px; border:1px solid red"  >
								</a>
								
								<a href="video_board_modify?video_notice_idx=${obj.video_notice_idx }&video_idx=${obj.video_idx}">
									<img src="image/modify_1.jpg" style="margin-top: 200px; marign-left:50px" >
								</a>

						
							</c:if>
							<c:choose>
								<c:when test= "${obj.video_notice_idx == 1 }">
									<img src="image/cpu_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 2 }">
									<img src="image/mb_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 3 }">
									<img src="image/vga_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 4 }">
									<img src="image/ram_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 5 }">
									<img src="image/ssd_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 6 }">
									<img src="image/hdd_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 7 }">
									<img src="image/power_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 8 }">
									<img src="image/cooler_btn.jpg" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 9 }">
									<img src="image/case_btn.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
								<c:when test= "${obj.video_notice_idx == 10 }">
									<img src="image/moniter_btn2.png" class=bg-primary alt="btn" style="margin-top:200px">
								</c:when>
							</c:choose>
							
							<td class="text-center d-none d-md-table-cell" style="width:80%">
								<h3 style="text-align:center">${obj.video_subject }</h3>
								<div class="embed-responsive embed-responsive-16by9">
									<iframe width="560" height="315"
										src="${obj.video_url }"
										title="YouTube video player" frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen></iframe>
								</div>

						</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Pagination : 페이지 번호, PC 용 -->
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<li class="page-item">
						<a href="video_board_list?video_board_idx=${video_board_idx }&page=${prev }" class="page-link">이전</a>
						</li>

						<c:forEach begin="${page_start }" end="${page_end }" var="idx">
						<c:choose>
						<c:when test="${now_page == idx }">
						<li class="page-item active">
							<a href="video_board_list?video_board_idx=${video_board_idx }&page=${idx }" class="page-link">${idx }</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
							<a href="video_board_list?video_board_idx=${video_board_idx }&page=${idx }" class="page-link">${idx }</a>
						</li>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<li class="page-item">
						<a href="video_board_list?video_board_idx=${video_board_idx }&page=${next }" class="page-link">다음</a>
						</li>

					</ul>

				</div>

				<!-- pagination - mobile -->
				<div class='d-block d-md-none'>
					<ul class='pagination justify-content-center'>
						<li class='page-item'>
							<a href="video_board_list?video_board_idx=${video_board_idx }&page=${now_page - 1 }" class="page-link">이전</a>
						</li>
						<li class="page_item disabled">
							<a href="#" class="page-link">${now_page }</a>
						</li>
						<li class='page-item'>
							<a href="video_board_list?video_board_idx=${video_board_idx }&page=${now_page + 1 }" class="page-link">다음</a>
						</li>
					</ul>
				</div>
				
				
			</div>
		</div>
	</div>


</body>
</html>