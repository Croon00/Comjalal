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
</head>
<body>
	
<!-- 게시글 리스트 -->
	<div class="container" style="margin-top:100px">
		<div class="card shadow">
			<div class="card-body">
				<ul>
					<c:forEach var="obj_category" items="${l_category_list}">
					<li>
					${obj_category.l_category_name }
					</li>
					</c:forEach>
				</ul>
				
			</div>
			</div>
			</div>
</body>
</html>