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

<script>
	function check_input() {
		// 입력한 값을 가져온다
		var video_subject = $("#video_subject").val()
		var video_url = $("#video_url").val()
		

		// 유효성 검사
		if (video_subject.length == 0) {
			alert("제목을 입력해주세요")
			$("#video_subject").focus()
			return false
		}
		
		if (video_url.length == 0) {
			alert("url을 입력해주세요")
			$("#video_url").focus()
			return false
		}

		return true
	}
</script>
</head>
<body>

	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- 관리자용 메뉴는 일반 회원의 메뉴와 다르기 때문에 일부러 관리자용 메뉴를 만들고 그 메뉴를 출력한다. -->
	<div class="container" style="margin-top: 100px">
		<!-- row를 클래스에서 주면 12칸으로 나누어진다. -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<!-- 파일 업로드를 위해서는 enctype을 설정해야 한다. -->

						<form action="video_write_pro" method="post"
							onsubmit="return check_input()"> 
							

							<div class="form-group">
								<label for="video_subject">영상 제목</label> <input type="text"
									id="video_subject" name="video_subject" class="form-control" />
							</div>

							<div class="form-group">
								<label for="video_url">영상 URL</label> <input type="text"
									id="video_url" name="video_url" class="form-control" />
							</div>
							
							<div class="select_list">
							<select name="video_notice_idx">
												<option selected>영상 종류</option>
												<option value="1">CPU</option>
												<option value="2">MB</option>
												<option value="3">VGA</option>
												<option value="4">RAM</option>
												<option value="5">SSD</option>
												<option value="6">HARD</option>
												<option value="7">POWER</option>
												<option value="8">COOLER</option>
												<option value="9">CASE</option>
												<option value="10">MONITER</option>
										</select>

							</div>

							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">등록</button>
									<a href="video_board_list_base"
										class="btn btn-danger">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>

	</div>
	<!-- 하단 메뉴 -->
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>