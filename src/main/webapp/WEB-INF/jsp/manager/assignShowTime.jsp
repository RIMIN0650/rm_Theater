<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Movie Show Time</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
			
		<section class="d-flex justify-content-center">
			
			<div id="assignShowTimeForm" class="mt-5">
				<div class="pt-4 pl-3">
					<h1>${roomName } - ${movieName }</h1>
				</div>
				<div class="mt-4">
					<div class="d-flex pl-3">
						<input type="text" class="form-control col-6" placeholder="Start time" id="showTime">
						<button type="button" class="btn btn-info no-line-break ml-3" id="verifyTimeBtn">시간 확인</button>
					</div>
					<div class="d-flex justify-content-end mt-4">
						<button type="button" class="btn btn-success btn-lg mr-4" id="addShowTimeBtn">등록</button>
					</div>
				</div>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	<script>
		$(document).ready(function(){
			
			$("#verifyTimeBtn").on("click",function(){
				alert("시간 확인");
				
			});
			
			$("#addShowTimeBtn").on("click",function(){
				let showTime = $("#showTime").val();
				let roomName = "${roomName }";
				
				$.ajax({
					type:"post"
					, url:"/runTime/assign"
					, data:{"roomName": roomName, "startTime":showTime}
					, success:function(data){
						if(data.result == "success"){
							alert("시간 추가 성공");
						} else {
							alert("시간 추가 실패");
						}
					}
					, error:function(){
						alert("시간 추가 오류");
					}
				});
			});
			
			
		});
	</script>
</body>
</html>