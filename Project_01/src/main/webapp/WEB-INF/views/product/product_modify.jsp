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
		var product_name = $("#product_name").val()
		var product_code = $("#product_code").val()
		var product_made = $("#product_made").val()
		var product_price = $("#product_price").val()
		var product_text = $("#product_text").val()
		var product_file = $("#product_file").val()
		

		// 유효성 검사
		if (product_name.length == 0) {
			alert("제목을 입력해주세요")
			$("#product_name").focus()
			return false
		}
		
		if (product_code.length == 0) {
			alert("제목을 입력해주세요")
			$("#product_code").focus()
			return false
		}
		
		if (product_made.length == 0) {
			alert("제목을 입력해주세요")
			$("#product_made").focus()
			return false
		}

		if (product_text.length == 0) {
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

	<!-- 관리자용 메뉴는 일반 회원의 메뉴와 다르기 때문에 일부러 관리자용 메뉴를 만들고 그 메뉴를 출력한다. -->
	<div class="container" style="margin-top: 100px">
		<!-- row를 클래스에서 주면 12칸으로 나누어진다. -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<!-- 파일 업로드를 위해서는 enctype을 설정해야 한다. -->

						<form action="product_modify_pro" method="post"
							onsubmit="return check_input()" enctype="multipart/form-data">

							<input type="hidden" name="product_idx" value="${readProductBean.product_idx }"/>
							<input type="hidden" name="product_notice_idx" value="${readProductBean.product_notice_idx }" /> 
							

							<div class="form-group">
								<label for="product_name">제품 이름</label> <input type="text"
									id="product_name" name="product_name" class="form-control"
									value="${readProductBean.product_name }" />
							</div>

							<div class="form-group">
								<label for="product_code">제품 코드</label> <input type="text"
									id="product_code" name="product_code" class="form-control"
									value="${readProductBean.product_code }"  />
							</div>

							<div class="form-group">
								<label for="product_made">제품 제조사</label> <input type="text"
									id="product_made" name="product_made" class="form-control"
									value="${readProductBean.product_made }"  />
							</div>

							<div class="form-group">
								<label for="product_price">제품 가격</label> <input type="text"
									id="product_price" name="product_price" class="form-control"
									value="${readProductBean.product_price }"  />
							</div>

							<div class="form-group">
								<label for="product_text">제품 상세 내용</label>
								<textarea id="product_text" name="product_text"
									class="form-control" rows="3" style="resize: none">${readProductBean.product_text }</textarea>

							</div>

							<div class="form-group">
								<label for="product_file">첨부이미지</label> <input type="file"
									name="upload_file" id="upload_file" class="form-control"
									value="${readProductBean.product_file }" 
									accept="image/*" />

							</div>
							
							<div class="form-group">
								<label for="product_file2">첨부이미지2</label> <input type="file"
									name="upload_file2" id="upload_file2" class="form-control"
									value="${readProductBean.product_file2 }" 
									accept="image/*" />

							</div>

							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">등록</button>
									<a href="product_read?product_notice_idx=${readProductBean.product_notice_idx }&product_idx=${readProductBean.product_idx}"
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
