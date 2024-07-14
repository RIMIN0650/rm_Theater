<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMovie</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
	
		<section class="d-flex bg-info">
			<div class="col-6 bg-secondary">
				<h1 class="text-center">포스터 등록 위한 공간</h1>
			</div>
			<div class="bg-success col-4 ml-5">
				<input type="text" class="form-control my-4" placeholder="Movie Title">
				<div class="d-flex">
				<input type="text" class="form-control mb-4 col-5" placeholder="Movie Main Genre">
				<input type="text" class="form-control mb-4 col-5 ml-4" placeholder="Movie Sub Genre">
				</div>
				<input type="text" class="form-control mb-4" placeholder="Movie Director">
				<input type="text" class="form-control mb-4" placeholder="Movie Age Of View">
				<input type="text" class="form-control mb-4" placeholder="Movie RunTime">
				<input type="text" class="form-control mb-4" placeholder="Movie Country">
				<input type="text" class="form-control mb-4" placeholder="Movie OpeningDay">
				<textarea class="mb-2" placeholder="Movie Detail" id="movieDetail" rows="7"></textarea>
			</div>
		
		
		</section>
		<div class="d-flex justify-content-end mt-3">
			<button type="button" class="btn btn-danger btn-lg mr-5">취소</button>
			<button type="button" class="btn btn-success btn-lg">등록</button>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			
			
			
		});
	</script>
	
</body>
</html>