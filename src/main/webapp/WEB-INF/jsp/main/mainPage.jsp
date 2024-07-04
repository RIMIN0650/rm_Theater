<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RM Theater</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<header class="bg-success text-center">
			<h1 class="pt-3">RM Theater</h1>
		</header>
		
		
		
		<nav class="main-menu">
			<ul class="nav nav-fill pt-3">
				<li class="nav-item mt-2"><a href="#">예매</a></li>
				<li class="nav-item mt-2"><a href="#">영화</a></li>
				<li class="nav-item mt-2"><a href="#">스토어</a></li>
				<div class="input-group col-4 mb-1">
					<input type="text" class="form-control" placeholder="검색할 내용을 입력하세요">
					<div class="input-group-append">
					<!-- 입력 필드와 버튼이 함께 한 줄로 정렬하고, 버튼이 입력 필드와 시각적으로 연결 -->
					<button type="button" class="btn btn-info">검색</button>
					</div>
				</div>
				<li class="nav-item mt-2"><a href="#">로그인</a></li>
				<li class="nav-item mt-2"><a href="#">회원가입</a></li>
				<li class="nav-item mt-2"><a href="#">비회원 예매</a></li>
			</ul>
		</nav>
		
		<section>
			<div class="movie-thumbnail bg-light d-flex justify-content-center align-items-center">
				<h3>slick 사용해서 영화 포스터 회전시킬 공간</h3>
			</div>
			
			<div class="movie-subInfo d-flex justify-content-between align-items-center mx-2">
				<div class="bg-info movie-1">
					<h2 class="ml-2 mt-1">1</h2>
					<div>
						<img src="https://cdn.pixabay.com/photo/2022/04/17/20/44/film-noir-7138980_1280.jpg" width="100%">
						<h4 class="mt-1 ml-1">영화 1</h4>
					</div>
				</div>
				<div class="bg-secondary movie-1">
					<h2 class="ml-2 mt-1">2</h2>
				</div>
				<div class="bg-warning movie-1">
					<h2 class="ml-2 mt-1">3</h2>
				</div>
				<div class="bg-danger movie-1">
					<h2 class="ml-2 mt-1">4</h2>
				</div>
				<div class="bg-success movie-1">
					<h2 class="ml-2 mt-1">5</h2>
				</div>
			</div>
		</section>
			
		<footer class="bg-warning pl-3 pt-1">
			<div>(230905)경기도 용인시 수지구 정평로 03-27</div>
			<div>대표 : 권민석 • 사업자 등록 번호 323-65-06503</div>
			<div>대표 이메일 : chris0540@naver.com</div>
			<div>©THE RM. All Rights Reserved</div>
		</footer>
	</div>




	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>