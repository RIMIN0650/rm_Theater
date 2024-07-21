<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Room</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section>
			
			<h1 class="text-center">관 등록</h1>
			<div class="pt-5 d-flex justify-content-center">
			<div id="addRoomForm"> 
				<div class="mt-5">
					<div class="d-flex justify-content-end">
						<input type="text" class="form-control col-6 ml-4 rightMargin" placeholder="Room name" id="roomName">
					</div>
				</div>
				<div class="d-flex justify-content-end mt-5">
					<button type="button" class="btn btn-danger mr-3" id="backToRoomListBtn">취소</button>
					<button type="button" class="btn btn-info rightMargin" id="addNewRoomBtn">등록</button>
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
			
			$("#backToRoomListBtn").on("click",function(){
				// 관 리스트 보여주기
				
			});
			
			$("#addNewRoomBtn").on("click", function(){
				let roomName = $("#roomName").val();
				
				if(roomName == ""){
					alert("관 이름을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/addRoom"
					, data:{"roomName":roomName}
					, success:function(data){
						if(data.result == "success"){
							alert("영화관 추가 성공");
						} else {
							alert("영화관 추가 실패");
						}
					}
					, error:function(data){
						alert("영화관 추가 에러");
					}
				})
				
			});
			
			
		});
	</script>
	
</body>
</html>