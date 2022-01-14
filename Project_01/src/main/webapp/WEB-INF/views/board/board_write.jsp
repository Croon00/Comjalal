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

<title>board/board_write</title>

<script>

function check_input(){
	// 입력한 값을 가져온다
	var board_subject = $("#board_subject").val()
	var board_content = $("#board_content").val()
	
	// 유효성 검사
	if(board_subject.length == 0){
		alert("제목을 입력해주세요")
		$("#board_subject").focus()
		return false
	}
	
	if(board_content.length == 0){
		alert("내용을 입력해주세요")
		$("#board_content").focus()
		return false
	}
	
	return true
}

</script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container" style="margin-top: 100px">
		<!-- row를 클래스에서 주면 12칸으로 나누어진다. -->
		<div class="row">
			<div class="col-sm-3">
			</div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<!-- 파일 업로드를 위해서는 enctype을 설정해야 한다. -->

						<form action="board_write_pro" method="post"
							onsubmit="return check_input()" enctype="multipart/form-data">

							<input type="hidden" name="content_board_idx" value="${board_idx }" />

							<div class="form-group">
								<label for="board__subject">제목</label> <input type="text"
									id="board_subject" name="content_subject" class="form-control" />
							</div>

							<div class="form-group">
								<label for="board__content">내용</label>
								<textarea id="board_content" name="content_text"
									class="form-control" rows="10" style="resize: none"></textarea>

							</div>

							<div class="form-group">
								<label for="board__file">첨부이미지</label> <input type="file"
									name="upload_file" id="upload_file" class="form-control"
									accept="image/*" />

							</div>

							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">작성완료</button>
									<a href="board_list?board_idx=${board_idx }&page=${now_page}" class="btn btn-danger">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>

	</div>


	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />