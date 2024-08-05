<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RM Theater</title>

<link rel="stylesheet" href="/static/css/slick.css" type="text/css">
<link rel="stylesheet" href="/static/css/slick-theme.css" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section>
			<div class="movie-thumbnail bg-light d-flex justify-content-center align-items-center mt-3">
				<div class="single-item">
					<c:forEach var="movie" items="${movieList }" varStatus="status">
						<a href="/movie/detail?id=${movie.id }" class="movie-link">
						<div class="d-flex">
							<img src="${movie.imagePath }" height="300">
							<div class="ml-4 mt-3">
								<h1>${movie.title }</h1>
								<h4>${movie.age }</h4>
								<h5 class="mt-3">${movie.detail }</h5>
							</div>
						</div>
						</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="movie-subInfo d-flex justify-content-between align-items-center mx-2">
				
				
				<c:forEach var="movie" items="${movieList }" varStatus="status">
				
				<a href="/movie/detail?id=${movie.id }" class="text-dark"  style="text-decoration: none;">
				<div class="movie-1">
					<h2 class="ml-2 mt-1">${status.count }</h2>
						<img src="${movie.imagePath }" width="100%">
					<div class="mt-2 ml-1">
						<h4>${movie.title }</h4>
						<div>${movie.age }</div>
						<div>${movie.mainGenre }</div>
					</div>
				</div>
				</c:forEach>
				</a>
				
			</div>
			
			<div id="event-section">
				<h2>EVENT</h2>
				<div class="d-flex">
					<div class="mr-5">
						<img src="https://cdn.pixabay.com/photo/2020/10/29/13/34/table-5696243_1280.jpg" height="320">
						<h4 class="mt-1 ml-1">[영화 후 레스토랑 가자!]</h4>
						<div class="mt-1 ml-2">영화 1을 본 후 입장권을 제시하면...</div>
					</div>
					<div>
						<img src="https://cdn.pixabay.com/photo/2019/02/27/21/45/fantasy-4025050_1280.jpg" height="320">
						<h4 class="mt-1 ml-1">[영화 티켓 지참시 전시회 할인!]</h4>
						<div class="mt-1 ml-2">영화 3 예매시 전시회 할인 쿠폰 증정...</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-between mb-5">
				<div class="gift-section">
					<h3 class="ml-3 mt-3">패키지</h3>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2017/07/07/12/34/lime-2481358_1280.jpg" width="200">
						<div class="ml-2">
							<span>기본 패키지</span><br>
							<strong>22000원</strong>
						</div>
					</div>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2017/03/10/15/15/lime-2133091_1280.jpg" width="200">
						<div class="ml-3">
							<span>커플 패키지</span><br>
							<strong>27000원</strong>
						</div>
					</div>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2016/09/05/20/52/grapefruit-1647688_1280.jpg" width="200">
						<div class="ml-3">
							<span>효도 패키지</span><br>
							<strong>32000원</strong>
						</div>
					</div>
				</div>
				<div class="gift-section">
					<h3 class="ml-3">영화 관람권</h3>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2012/02/19/18/05/oranges-15046_1280.jpg" width="200">
						<div class="ml-3">
							<span>RM 영화 관람권</span><br>
							<strong>9000원</strong>
						</div>
					</div>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2022/09/08/13/47/kiwi-7441021_1280.jpg" width="200">
						<div class="ml-3">
							<span>소파 영화 관람권</span><br>
							<strong>19000원</strong>
						</div>
					</div>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2021/03/06/12/27/apples-6073599_1280.jpg" width="200">
						<div class="ml-3">
							<span>4D 영화 관람권</span><br>
							<strong>14000원</strong>
						</div>
					</div>
				</div>
				<div class="gift-section">
					<h3 class="ml-3">기프트 카드</h3>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2017/07/21/23/35/map-2527420_1280.jpg" width="200">
						<div class="ml-3">
							<span>RM THEATER 10000원 상품권</span><br>
							<strong>10000원</strong>
						</div>
					</div>
					<div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2017/07/21/23/36/map-2527424_1280.jpg" width="200">
						<div class="ml-3">
							<span>RM THEATER 20000원 상품권</span><br>
							<strong>19500원</strong>
						</div>
					</div><div class="ml-3 mb-3 d-flex">
						<img src="https://cdn.pixabay.com/photo/2017/07/21/23/37/map-2527430_1280.jpg" width="200">
						<div class="ml-3">
							<span>RM THEATER 30000원 상품권</span><br>
							<strong>28700원</strong>
						</div>
					</div>
				</div>
			</div>
			
			<div id="client-notice" class="bg-info">
				고객 공지창
			</div>
			
		</section>
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>




	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/static/js/slick.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".single-item").slick({
				autoplay: true,
				autoplaySpeed: 3000,
			});
			
		});
	
	</script>
	
</body>
</html>