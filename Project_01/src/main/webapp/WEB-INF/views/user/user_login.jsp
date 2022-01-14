<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BOOTSTRAP and JQuery CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function check_input(){
		
		// 사용자가 입력한 내용을 가져온다.
		var user_id = $("#user_id").val()
		var user_pw = $("#user_pw").val()
		
		// 정규식
		// 첫글자는 영문대소문자, 나머지는 영문대소 숫자, 4 ~ 20글자
		var id_pattern =  /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/
		// 최소 8글자이며 숫자,문자,특수문자가 최소 1개씩 있어야 한다.
		var pw_pattern =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
		
		if(id_pattern.test(user_id) == false){
			alert("아이디는 영문으로시작하고 영문과 숫자, 4 ~ 20글자를 허용합니다")
			$("#user_id").val('')
			$("#user_id").focus()
			return false
		}
		
		
		if(pw_pattern.test(user_pw) == false){
			alert("비밀번호는 8글자 이상이며, 영문,숫자,특수문자를 포함해야 합니다")
			$("#user_pw").val('')
			$("#user_pw").focus()
			return false
		}
	
		return true
	}
</script>

<title>user/user_login.jsp</title>
</head>
<style>

@import url('https://fonts.googleapis.com/css?family=Numans');

.container{
height: 100%;
align-content: center;
}
.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
</style>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<div class="container" style="margin-top:100px">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
			
			<c:if test="${chk == true }">
						<!-- 로그인 실패시 보여줄 alert -->
				<div class='alert alert-danger'>
					<h3>로그인 실패</h3>
					<p>아이디와 비밀번호를 확인해주세요</p>
				</div>
			</c:if>
				<!-- id 비밀번호 입력하는 곳 -->
				<form action='user_login_pro' method='post' onsubmit='return check_input()'>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" id="user_id" name="user_id" class="form-control" placeholder="ID">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">로그인 상태 유지
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					<a href="user_join">회원가입</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<p style='margin-bottom:200px'>&nbsp;</p>
	
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	
</body>
</html>
	