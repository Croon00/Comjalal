<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<title>board/board_read.jsp</title>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<!-- row를 클래스에서 주면 12칸으로 나누어진다. -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_writer_nmmal">작성자</label>
							<input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="${readContentBean.content_writer_name }" disabled="disabled"/>
						</div>
						
						<div class="form-group">
							<label for="board__date">작성날짜</label>
							<input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="${readContentBean.content_date }" disabled="disabled"/>
						</div>
						
						<div class="form-group">
							<label for="board__subject">제목</label>
							<input type="text" id="board_subject" name="board_writer_name" class="form-control" value="${readContentBean.content_subject }" disabled="disabled"/>
						</div>
						
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" class="form-control"
									  rows="10" style="resize:none" disabled="disabled">${readContentBean.content_text }</textarea>
							
						</div>
						
						<c:if test="${readContentBean.content_file != null }">
						<div class="form-group">
							<label for="board_file">첨부이미지</label>
							<img src="upload/${readContentBean.content_file }" style="width:100%"/>
							
						</div>
						</c:if>
						
						<div class="form-group">
							<div class="text-right">
								<a href="board_list" class="btn btn-primary">목록보기</a>
								<c:if test="${loginUserBean.user_idx == readContentBean.content_writer_idx }">
								<a href="board_modify?content_board_idx=${readContentBean.content_board_idx }&content_idx=${readContentBean.content_idx}" class="btn btn-info">수정하기</a>
								<a href="board_delete?content_board_idx=${readContentBean.content_board_idx }&content_idx=${readContentBean.content_idx}" class="btn btn-danger">삭제하기</a>
								</c:if>
								<c:if test="${loginAdminBean.check_login == true && readContentBean.content_board_idx == 5 || loginAdminBean.check_login == true && readContentBean.content_board_idx == 6}">
									<a href="board_reply?content_board_idx=${readContentBean.content_board_idx }&content_idx=${readContentBean.content_idx}" class="btn btn-info">답변 작성하기</a>
								</c:if>  
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">	</div>
		</div>
	
	</div>
	
	<c:if test= "${readContentBean.content_board_idx == 5 || readContentBean.content_board_idx == 6}"> 
	<c:if test= "${readContentBean.content_reply_text != null }">
	<div class="container" style="margin-top:100px">
		<!-- row를 클래스에서 주면 12칸으로 나누어진다. -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_writer_nmmal">작성자</label>
							<input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="관리자" disabled="disabled"/>
						</div>
						
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" class="form-control"
									  rows="10" style="resize:none" disabled="disabled">${readContentBean.content_reply_text }</textarea>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<a href="board_list" class="btn btn-primary">목록보기</a>
								<c:if test="${loginAdminBean.check_login == true }">
								<a href="board_delete?content_board_idx=${readContentBean.content_board_idx }&content_idx=${readContentBean.content_idx}" class="btn btn-danger">삭제하기</a>
								</c:if>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">	</div>
		</div>
	
	</div>
	</c:if>
	</c:if>
	
	</body>
	
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>