<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	$(".div1").click(function(){
		$("#div1").load("product_write");
		});	
});


</script>	
</head>
<body>
		
<nav class='navbar bg-info navbar-dark navbar-expand-md shadow-lg'>

	<!-- 좌측 로고 -->
	<a class='navbar-brand' href='main'>컴잘알</a>
	<!-- 모바일 페이지일 경우 메뉴를 토글 시키는 버튼 -->
	<!-- data-target에 설정한 부분이 토글된다. -->
	<button class=navbar-toggler type='button' data-toggle='collapse'
		data-target='#navMenu'>
		<span class='navbar-toggler-icon'></span>
	</button>

	<!-- 메뉴 항목 -->
	<div id='navMenu' class='collapse navbar-collapse navbar-fixed-top'>
		<!-- 좌측 메뉴 -->
		<ul class='navbar-nav'>
			<li class="nav-item"><a href="l_category?l_category_idx=1" class="nav-link">상품 목록</a></li>
			<li class="nav-item"><a href="category_base" class="nav-link">상품 등록</a></li>
			<li class="nav-item"><a href="video_board_list_base" class="nav-link div3">회원 관리</a></li>
			<li class="nav-item"><a href="video_board_list_base" class="nav-link div4">게시판 관리</a></li>
			<li class="nav-item"><a href="video_board_write?&page=${now_page}" class="btn btn-primary">영상 등록</a>
			<li class="nav-item"><a href="video_board_list_base" class="nav-link div5">주문 상품 관리</a></li>
		</ul>
		<!-- 우측 메뉴 -->
		<ul class='navbar-nav ml-auto'>

			<c:choose>
					<%-- 관리자가 로그인 상태라면 --%>
				<c:when test="${loginAdminBean.check_login == true}" >
					<li class='nav-item'><a href='admin_logout' class='nav-link'>관리자 로그아웃</a>
					</li>
				</c:when>
				
				<%-- 로그인 상태가 아니라면 --%>
				<c:otherwise>
					<li class='nav-item'><a href='user_login' class='nav-link'>로그인</a>
					</li>
					<li class='nav-item'><a href='admin_login' class='nav-link'>관리자 로그인</a>
					</li>
					<li class='nav-item'><a href='user_join' class='nav-link'>회원가입</a>
					</li>
				</c:otherwise>
			</c:choose>


		</ul>
	</div>

</nav>

<div id=div1>

</div>



	

	
</body>
</html>