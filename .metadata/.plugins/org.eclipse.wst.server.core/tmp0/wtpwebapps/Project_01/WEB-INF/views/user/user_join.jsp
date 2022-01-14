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

	//아아디 중복 여부를 확인할 변수
	var chk1 = false;

	function check_input(){
		
		// 사용자가 입력한 내용을 가져온다.
		var user_name = $("#user_name").val()
		var user_id = $("#user_id").val()
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
		// 한글만 허용하며 2~4글자까지.
		var name_pattern = /^[가-힣]{2,4}$/
		// 첫글자는 영문대소문자, 나머지는 영문대소 숫자, 4 ~ 20글자
		var id_pattern =  /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/
		// 최소 8글자이며 숫자,문자,특수문자가 최소 1개씩 있어야 한다.
		var pw_pattern =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
		
		if(name_pattern.test(user_name) == false){
			alert("사용자 이름은 한글 2~4글자만 허용합니다")
			// 입력한 칸을 비운다.
			$("#user_name").val('')
			// 포커스를 준다.
			$("#user_name").focus()
			return false
		}
		
		if(id_pattern.test(user_id) == false){
			alert("아이디는 영문으로시작하고 영문과 숫자, 4 ~ 20글자를 허용합니다")
			$("#user_id").val('')
			$("#user_id").focus()
			return false
		}
		
		if(chk1 == false) {
			alert("아이디 중복 확인을 해주세요")
			$("#user_id").focus()
			return false
		}
		
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
		
		if(user_postal_code.length == 0){
			alert('주소를 검색해주세요')
			$("#user_postal_code").focus()
			return false
		}
		
		if(user_addr2.length == 0){
			alert('상세주소를 입력해주세요')
			$("#user_addr2").focus()
			return false
		}
		
	
		return true
	}
	
	
	
	// 아이디 중복확인
	function checkUserId(){
		// 입력한 아이디를 가져온다.
		var user_id = $("#user_id").val()
		
		var id_pattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/
		
		if(id_pattern.test(user_id) == false){
			alert("아이디는 영문으로시작하고 영문과 숫자, 4 ~ 20글자를 허용합니다")
			$("#user_id").val('')
			$("#user_id").focus()
			return
		}
		
		// Ajax
		$.ajax({
			// 요청할 페이지 주소
			url : "check_user_id",
			// 요청방식
			type : 'get',
			// 서버로 보내는 데이터
			data : {'new_id' : user_id},
			// 서버가 전달하는 결과 데이터 타입
			dataType : 'text',
			// 통신이 완료되면 호출되는 함수
			success : function(result){
				// alert(result.trim())
				// YES가 전달 됬다면..
				if(result.trim() == "YES"){
					alert('사용가능한 아이디 입니다')
					chk1 = true
					$("#user_id").attr("readonly", true)
				} else {
					alert('사용불가능한 아이디 입니다')
					$("#user_id").val('')
					$("#user_id").focus()
				}
			}
		})
	}
</script>
<title>user/user_join.jsp</title>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<%-- 다음 주소 --%>
	<c:import url="/WEB-INF/views/include/daum_address.jsp"/>
	
	<div class='container' style='margin-top:100px'>
	
		<div class='row'>
			<div class='col-sm-3'></div>
			<div class='col-sm-6'>
				<div class='card shadow'>
					<div class='card-body'>
						<!-- 회원 가입 폼 -->
						<form action='user_join_pro' method='post' onsubmit='return check_input()'>
							<div class='form-group'>
								<label for='user_name'>이름</label>
								<input type='text' id='user_name' name='user_name' class='form-control'/>
							</div>
							
							<div class='form-group'>
								<label for='user_id'>아이디</label>
								<div class='input-group'>
									<input type='text' id='user_id' name='user_id' class='form-control'/>
									<div class='input-group-append'>
										<button type='button' class='btn btn-primary' onclick='checkUserId()'>중복확인</button>
									</div>
								</div>
							</div>
							<div class='form-group'>
								<label for='user_pw'>비밀번호</label>
								<input type='password' id='user_pw' name='user_pw' class='form-control'/>
							</div>
							<div class='form-group'>
								<label for='user_pw2'>비밀번호 확인</label>
								<input type='password' id='user_pw2' name='user_pw2' class='form-control'/>
							</div>
							
							<div class='form-group'>
								<label for='user_postal_code'>주소</label>
								<div class='input-group'>
									<input type='text' id='user_postal_code' name='user_postal_code' class='form-control' readonly="readonly"/>
									<div class='input-group-append'>
										<button type='button' class='btn btn-primary' onclick='sample2_execDaumPostcode()'>주소검색</button>
									</div>
								</div>
							</div>
							
							<div class='form-group'>
								<input type='text' id='user_addr1' name='user_addr1' class='form-control' readonly="readonly"/>
							</div>
							
							<div class='form-group'>
								<input type='text' id='user_addr2' name='user_addr2' class='form-control'/>
							</div>
							
							<div class='form-group'>
								<div class='text-right'>
									<button type='submit' class='btn btn-primary'>가입완료</button>
									<a href='user_login' class='btn btn-info'>로그인</a>
								</div>
							</div>
							
							
							
						</form>
					</div>
				</div>
			</div>
			<div class='col-sm-3'></div>
		</div>
	
	</div>
	
	
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	
</body>
</html>
	