`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Account</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section class="d-flex justify-content-center my-5">
		
			<div id="findAccount"class=" d-flex justify-content-center align-items-center">
				<button type="button" class="btn btn-info mr-4">아이디 찾기</button>
				<button type="button" class="btn btn-info">비밀번호 찾기</button>
			</div>
			
			<div id="findIdForm">
				<div class="d-flex justify-content-center">
					<div class="mt-5">
						<input type="text" class="form-control" placeholder="Name" id="nameForId">
						<input type="text" class="form-control my-3 " placeholder="email" id="emailForId">
					</div>
				</div>
					<div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-info mt-3" id="findIdBtn">찾기</button>
					</div>
					<div class="d-flex justify-content-center mt-4">
						<button type="button" class="btn btn-success" id="toFindPwBtn">비밀번호 찾기</button>
					</div>
				</div>
			</div>
			<div id="findPasswordForm">
				<div class="d-flex justify-content-center">
					<div class="mt-5">
						<input type="text" class="form-control" placeholder="ID" id="idForPw">
						<input type="text" class="form-control my-3 " placeholder="birthDay" id="birthDayForPw">
					</div>
				</div>
					<div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-info mt-3" id="findPwBtn">찾기</button>
					</div>
					<div class="d-flex justify-content-center mt-4">
						<button type="button" class="btn btn-success" id="toFindIdBtn">아이디 찾기</button>
					</div>
				</div>
			</div>
		</section>
		
		<div class="text-center">
			<a href="/user/join">회원가입</a>&nbsp;또는&nbsp;<a href="/main/home">메인 페이지로</a>
		</div>
		
		<div class="text-center mt-3">
			<a href="/admin/login">관리자용 로그인</a>
		</div>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	
	
	
	
	
	
	
</body>
</html>