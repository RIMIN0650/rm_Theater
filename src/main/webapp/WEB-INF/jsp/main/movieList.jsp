<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>



	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
	
		<div>
			<table class="table">
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>포스터</th>
						<th>영화 제목</th>
						<th>제한 연령</th>
						<th>메인 장르</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${movieList }" varStatus="status">
					<tr class="text-center">
						<td>${status.count }</td>
						<td class="poster-cell"><img src="${list.imagePath }" class="poster-image"></td>
						<td>${list.title }</td>
						<td>${list.age }</td>
						<td>${list.mainGenre }</td>
						<td><button type="button" class="btn btn-warning modifyBtn" data-movie-id="${list.id }" onclick="location.href='/movie/update-view?id=${list.id }'">수정</button></td>
						<td><button type="button" class="btn btn-danger deleteBtn" data-movie-id="${list.id }">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$(".modifyBtn").on("click", function(){
				let movieId = $(this).data("movie-id");
				
			});
			
			$(".deleteBtn").on("click", function(){
				let movieId = $(this).data("movie-id");
				alert(movieId);
				
				$.ajax({
					type:"delete"
					, url:"/movie/delete"
					, data:{"id":movieId}
					, success:function(data){
						if(data.result == "success"){
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