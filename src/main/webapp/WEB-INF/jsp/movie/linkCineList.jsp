<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room - Movie List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section>
			
			<h1 class="text-center">관 / 등록된 영화</h1>
			
			<div>
				<table class="table text-center mt-5">
					<thead>
						<tr>
							<th>#</th>
							<th>관 이름</th>
							<th>등록 영화</th>	
							<th>상영 시간</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="linkList" items="${cineLinkList }" varStatus="status">
						<tr>
							<th>${status.count }</th>
							<td>${linkList.roomName }</td>
							<td>${linkList.movieName }</td>							
							<td><button type="button" class="btn btn-info showRunTimeBtn" data-room-name="${linkList.roomName }">상영 시간 확인</button></td>
							<td><button type="button" class="btn btn-danger deleteBtn" data-room-name="${linkList.roomName }">삭제</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			$(".showRunTimeBtn").on("click",function(){
				let roomName = $(this).data("room-name");
				location.href="/runTime/perRoom?roomName=" + roomName;
				
			});
			
			$(".deleteBtn").on("click",function(){
				
				let roomName = $(this).data("room-name");	
				
				$.ajax({
					type:"delete"
					, url:"/link/delete"
					, data:{"roomName":roomName}
					, success:function(data){
						if(data.result == "success"){
							alert("삭제 성공");
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function(){
						alert("삭제 에러");
					}
					
				});
				
			});
			
			
			
			
			
		});
	
	</script>
	
</body>
</html>