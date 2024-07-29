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
			
			<h1 class="text-center">관 리스트</h1>
			
			<div>
				<table class="table text-center mt-5">
					<thead>
						<tr>
							<th>#</th>
							<th>관 이름</th>
							<th>좌석 수 </th>
							<th>가격</th>
							<th>수정</th>							
							<th>삭제</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="roomList" items="${roomList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td class="roomName-cell">${roomList.roomName }</td>
							<td>${roomList.totalSeat }</td>
							<td>${roomList.seatPrice }</td>
							<td class="roomListAlterBtn-cell"><button type="button" class="btn btn-warning modifyRoomNameBtn" data-room-id="${roomList.id }">수정</button></td>
							<td class="roomListAlterBtn-cell"><button type="button" class="btn btn-danger deleteRoomBtn" data-room-id="${roomList.id }">삭제</button></td>
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
			$(".modifyRoomNameBtn").on("click",function(){
				let roomId = $(this).data("room-id");
				
				location.href="/room/updateInfo?id="+roomId;
				
			});
			
			$(".deleteRoomBtn").on("click",function(){
				let roomId = $(this).data("room-id");
				
				$.ajax({
					type:"delete"
					, url:"/room/delete"
					, data:{"id":roomId}
					, success:function(data){
						if(data.result == "success"){
							alert("삭제 성공");
							location.href="/room/roomList";
						} else {
							alert("삭제 실패");
						}
					} 
					, error:function(data){
						alert("삭제 에러");
					}
				});
				
			});
		});
	</script>
</body>
</html>