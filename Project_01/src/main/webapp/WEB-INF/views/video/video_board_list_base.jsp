<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- BOOTSTRAP and JQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<script>

$(document).ready(function(){
	$("#div1").load("video_board_list?video_board_idx=0");
	$(".div1").click(function(){
		$("#div1").load("video_board_list?video_board_idx=1");
		});	
	
	$(".div2").click(function(){
		$("#div1").load("video_board_list?video_board_idx=2");
		});
	$(".div3").click(function(){
		$("#div1").load("video_board_list?video_board_idx=3");
		});
	
	$(".div4").click(function(){
		$("#div1").load("video_board_list?video_board_idx=4");
		});
	
	$(".div5").click(function(){
		$("#div1").load("video_board_list?video_board_idx=5");
		});
	
	$(".div6").click(function(){
		$("#div1").load("video_board_list?video_board_idx=6");
		});
	
	$(".div7").click(function(){
		$("#div1").load("video_board_list?video_board_idx=7");
		});
	$(".div8").click(function(){
		$("#div1").load("video_board_list?video_board_idx=8");
		});	
	$(".div9").click(function(){
		$("#div1").load("video_board_list?video_board_idx=9");
		});	
	$(".div10").click(function(){
		$("#div1").load("video_board_list?video_board_idx=10");
		});	
});


</script>	
</head>

<body>
	

	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	

	<div class="container" style="margin-top: 50px">
		<!-- Grid row -->
		<div class="row">

			<!-- Grid column -->
			<div class="col-md-12 mb-4">

				<button type="button" class="btn btn-primary px-3 div1">
					<img src="image/cpu_btn.png">
				</button>
				<button type="button" class="btn btn-info px-3 div2">
					<img src="image/mb_btn.png">
				</button>
				<button type="button" class="btn btn-secondary px-3 div3">
					<img src="image/vga_btn.png">
				</button>
				<button type="button" class="btn btn-success px-3 div4">
					<img src="image/ram_btn.png">
				</button>
				<button type="button" class="btn btn-info px-3 div5">
					<img src="image/ssd_btn.png">
				</button>
				<button type="button" class="btn btn-warning px-3 div6">
					<img src="image/hdd_btn.png">
				</button>
				<button type="button" class="btn btn-danger px-3 div7">
					<img src="image/power_btn.png">
				</button>
				<button type="button" class="btn btn-danger px-3 div8">
					<img src="image/cooler_btn.jpg">
				</button>
				<button type="button" class="btn btn-danger px-3 div9">
					<img src="image/case_btn.png">
				</button>
				<button type="button" class="btn btn-danger px-3 div10">
					<img src="image/moniter_btn2.png">
				</button>
			
			</div>
		</div>

	</div>
	
	<div id="div1"  style="margin-top: 50px">
	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	

	
	
</body>
</html>