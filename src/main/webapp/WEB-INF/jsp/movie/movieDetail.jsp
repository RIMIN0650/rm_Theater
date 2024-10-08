<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Detail</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section class="my-5">
			<div class="d-flex ml-5">
				<img src="${movieInfo.imagePath }" width="200">
				<div class="ml-5">
					<h1>${movieInfo.title }</h1>
					<hr>
					${movieInfo.director }<br>
					
					${movieInfo.mainGenre } ${movieInfo.subGenre },
					${movieInfo.runTime } 분,
					${movieInfo.country }<br>
					
					개봉일 : ${movieInfo.openingDay }<br>
					${movieInfo.ageOfView }<br>
				
				<div class="mt-5" id="movieInfoDetail">
				${movieInfo.detail }
				</div>
				</div>
			</div>
			
			<div class="ml-5 mt-5">
				<h3>남성 / 여성</h3>
				<h3>나이</h3>
				<h6>${countAdult }</h6>
				<h6>${countJunior }</h6>
				<h6>${countSenior }</h6>
				<h6>${countDisabled }</h6>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
		
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>