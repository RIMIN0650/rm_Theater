<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Reservation History</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
			
		<section>
			<div>
				<h3>${user.name }님</h3>
				
				<table class="table">
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>영화 제목</th>
						<th>관</th>
						<th>상영 시작시간</th>
						<th>성인</th>
						<th>청소년</th>
						<th>경로</th>
						<th>장애인</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${reservationDetailList }" varStatus="status">
					<tr class="text-center">
						<td>${status.count }</td>
						<td>${list.movieTitle }</td>
						<td>${list.roomName }</td>
						<td>${list.startTime }</td>
						<td>${list.countAdult }</td>
						<td>${list.countJunior }</td>
						<td>${list.countSenior }</td>
						<td>${list.countDisabled }</td>
						<td><button type="button" class="btn btn-danger deleteBtn">삭제</button></td>
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
	
</body>
</html>