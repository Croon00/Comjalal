<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<div class='container' style="margin-top: 20px; margin-bottom: 30px">

	<div class='row'>

		<div class='col-sm-3'></div>
		<div class='col-sm-6'>
			<div class='input-group'>
				<input type='text' id='search_id' name='search_id' class='form-control' />
				<div class='input-group-append'>
					<button type='button' class='btn btn-primary'>Search</button>
				</div>
			</div>
		</div>
		<div class='col-sm-3'></div>
	</div>
</div>



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
			
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 주요 부품 </a>
			<div class="dropdown-menu">
				<c:forEach var="pro" items="${top_proudct_menu_list }">
					<a href="board_product_list?product_board_idx=${pro.product_board_idx }" class="dropdown-item">${pro.product_board_name }</a>
				</c:forEach>
			</div>
				
			</li>
			

			<li class="nav-item"><a href="video_board_list_base" class="nav-link">영상게시판</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 커뮤니티 </a>
				<div class="dropdown-menu">
					<c:forEach var="obj" items="${top_menu_list }">	
						<a class="dropdown-item" href="board_list?board_idx=${obj.board_idx }">${obj.board_name }</a>
					</c:forEach>
				</div>
			
		</ul>
		<!-- 우측 메뉴 -->
		<ul class='navbar-nav ml-auto'>

			<c:choose>
				<%-- 유저가 로그인 상태라면 --%>
				<c:when test="${loginUserBean.check_login == true}" >
					<li class='nav-item'><a href='product_cart' class='nav-link'>장바구니</a>
					</li>
					<li class='nav-item'><a href='user_modify' class='nav-link'>정보수정</a>
					</li>
					<li class='nav-item'><a href='user_logout' class='nav-link'>로그아웃</a>
					</li>
					<li class='nav-item'><a href='user_logout' class='nav-link'>마이페이지</a>
					</li>
				</c:when>
				
					<%-- 관리자가 로그인 상태라면 --%>
				<c:when test="${loginAdminBean.check_login == true}" >
					<li class='nav-item'><a href='admin_management' class='nav-link'>관리자 페이지</a>
					</li>
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
