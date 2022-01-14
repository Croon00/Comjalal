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

<script>

function check_input(){
	
	// 사용자가 입력한 내용을 가져온다.
	var user_pw = $("#user_pw").val()
	var user_pw2 = $("#user_pw2").val()
	var user_postal_code = $("#user_postal_code").val()
	var user_addr1 = $("#user_addr1").val()
	var user_addr2 = $("#user_addr2").val()
	
	// console.log(user_name)
	// console.log(user_id)
	// console.log(user_pw)
	// console.log(user_pw2)
	
	// 정규식
	// 최소 8글자이며 숫자,문자,특수문자가 최소 1개씩 있어야 한다.
	var pw_pattern =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
	
	if(pw_pattern.test(user_pw) == false){
		alert("비밀번호는 8글자 이상이며, 영문,숫자,특수문자를 포함해야 합니다")
		$("#user_pw").val('')
		$("#user_pw").focus()
		return false
	}
	
	if(pw_pattern.test(user_pw2) == false){
		alert("비밀번호는 8글자 이상이며, 영문,숫자,특수문자를 포함해야 합니다")
		$("#user_pw2").val('')
		$("#user_pw2").focus()
		return false
	}
	
	if(user_pw != user_pw2){
		alert('비밀번호가 일치하지 않습니다')
		$("#user_pw").val('')
		$("#user_pw2").val('')
		$("#user_pw").focus()
		return false
	}
	
	if(user_addr2.length == 0){
		alert('상세주소를 입력해주세요')
		$("#user_addr2").focus()
		return false
	}
	

	return true
}

</script>
<title>user/user_modify.jsp</title>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<%-- 다음 주소 --%>
	<c:import url="/WEB-INF/views/include/daum_address.jsp"/>
	
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						
						<!-- 정보수정 폼 -->
						<form:form modelAttribute="memberBean" action="user_modify_pro" onsubmit="return check_input()">
						
							<div class="form-group">
								<label for="user_name">이름</label>
								<form:input path="user_name" class="form-control" disabled="true"/>
							</div>

							<div class="form-group">
								<label for="user_id">아이디</label>
								<form:input path="user_id" class="form-control" disabled="true"/>
							</div>

							<div class="form-group">
								<label for="user_pw">비밀번호</label>
								<form:input path="user_pw" class="form-control" showPassword="true"/>
							</div>
							
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label>
								<input type="password" id="user_pw2" name="user_pw2" class="form-control" value=${memberBean.user_pw }/>
							</div>
							
							<div class="form-group">
								<label for="user_postal_code">주소</label>
								<div class="input_group">
									<form:input path="user_postal_code" class="form-control" readonly="true"/>
									<div class="input-group-append">
										<button type="button"  class="btn btn-primary" onclick='sample2_execDaumPostcode()'>주소 검색</button>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<form:input path="user_addr1" class="form-control" readonly="true"/>
							</div>
							
							<div class="form-group">
								<form:input path="user_addr2" class="form-control"/>
							</div>
							
							<div class="form-group">
								<div class="text-right">
								<form:button class="btn btn-primary">수정 완료</form:button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
	</div>
	
	
	
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
		


</body>
</html>