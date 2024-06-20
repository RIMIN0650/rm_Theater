<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Us</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap" class="bg-dark">
		<header class="bg-info text-center mt-3">
			<h1 class="display-2">RM_THEATER</h1>
		</header>
	
		<section class="bg-success d-flex justify-content-center">
			<div class="text-center" id="joinForm">
				<h1 class="my-5">Join RM Theater</h1>
				<div>
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-8" placeholder="ID">
						<button type="button" class="btn btn-info">중복 확인</button>
					</div>
					<input type="password" class="form-control mb-4" placeholder="PW">
					<input type="password" class="form-control mb-4" placeholder="PW CHECK">
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-3" placeholder="010">
						<h3>-</h3>
						<input type="text" class="form-control col-4" placeholder="1234">
						<h3>-</h3>
						<input type="text" class="form-control col-4" placeholder="5678">
					</div>
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-5" placeholder="이메일">
						<h3>@</h3>
						<input type="text" class="form-control col-5" placeholder="선택하세요">							
										
					</div>
					
					<div class="d-flex justify-content-between align-items-center text-align-center mb-3">
						<input type="text" class="form-control col-3" placeholder="yyyy">
						<h4>년</h4>
						<input type="text" class="form-control col-2" placeholder="mm">
						<h3>월</h3>
						<input type="text" class="form-control col-2" placeholder="dd">
						<h3>일</h3>
					</div>
					<div class="mb-3 d-flex justify-content-center align-items-center">
						<div>성별 : &nbsp;</div>
						<div class="form-check form-check-inline d-flex align-items-center">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
							<label class="form-check-label" for=inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label" for=inlineRadio2">여성</label>
						</div>
					</div>
					
					<button type="button" class="btn btn-info">회원가입</button>
				</div>
			</div>
		</section>
		
		<footer class="bg-warning">
			<div>
			
			</div>
		</footer>	
	
	</div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
</body>
</html>