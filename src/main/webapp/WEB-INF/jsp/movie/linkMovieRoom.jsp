<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Reservation</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section>
			<h1 class="text-center">관 설정</h1>
			<div class="pt-5 d-flex justify-content-center">
				<div id="assignRoomForm">
					<div class="d-flex justify-content-center mt-5">
						<div>
							<select class="selectpicker" data-width="200px" id="selectRoom">
							  <option value="0" selected>관 선택</option>
							  <c:forEach var="room" items="${roomList }">
							  	<c:choose>
							  		<c:when test="${room.linkCheck == 'Unlinked'}">
							  			<option value="${room.roomName }">${room.roomName }</option>
							  		</c:when>
							  		<c:otherwise>
							  			<option value="${room.roomName }" disabled>${room.roomName } [선택불가]</option>
							  		</c:otherwise>
							  	</c:choose>
							  </c:forEach>	  
							</select>
						</div>
						<div class="ml-4">
							<select class="selectpicker" data-width="200px" id="selectMovie">
							  <option value="0" selected>영화 선택</option>
							  <c:forEach var="movie" items="${movieList }">
							  	<option value="${movie.title }">${movie.title }</option>
							  </c:forEach>
							</select>
						</div>
					</div>
					<div class="d-flex justify-content-end mt-5">
						<button type="button" class="btn btn-danger mr-3" onclick="location.href='/movie/list'">취소</button>
						<button type="button" class="btn btn-info rightMargin" id="assignMovieRoomBtn">등록</button>
					</div>
				</div>	
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	
	<script>
	$(document).ready(function(){
		
		let roomName = 0;
		let movieTitle = 0;
		
		
		/*
		$("selectRoom option").each(function(){
			$("#selectRoom option").each(function(){
				var roomName = $(this).val();
				if(roomName != "0"){ // 관 선택 옵션 제외
					$.ajax({
						type:"get"
						, url:"/link/duplicateRoom"
						, data:{"roomName":roomName}
						, success: function(response){
							if(response.isDuplicateRoom){
								$('#selectRoom option[value"' + roomName + '"]').attr('disabled', true);
							}
						}
						, error:function(){
							alert("중복 확인 에러");
						}		
					});
				}
			});
		});
		*/

		
		$("#selectRoom").change(function(){
			
			let selectRoom = document.getElementById("selectRoom");
			roomName = selectRoom.options[selectRoom.selectedIndex].value;
			
			/* 
			$.ajax({
				type:"get"
				, url:"/link/duplicateRoom"
				, data:{"roomName":roomName}
				, success:function(data){
					if(data.isDuplicateRoom){
						alert("중복")
					} else {
						alert("중복 아님");
					}
				}
				, error:function(){
					alert("중복 확인 에러");
				}
			}); */
		});
		
		
		
		
		$("#selectMovie").change(function(){
			
			let selectMovie = document.getElementById("selectMovie");
			movieName = selectMovie.options[selectMovie.selectedIndex].value;
			
			/* 
			alert(movieName);
			$.ajax({
				type:"get"
				, url:"/link/duplicateMovie"
				, data:{"movieName":movieName}
				, success:function(data){
					if(data.isDuplicateRoom){
						alert("중복")
					} else {
						alert("중복 아님");
					}
				}
				, error:function(){
					alert("중복 확인 에러");
				}
			}); */
		});
		
		
		
		
		$("#assignMovieRoomBtn").on("click", function(){
			
			if(roomName == 0){
				alert("관을 선택하세요");
				return;
			}
			
			if(movieName == 0){
				alert("영화를 선택하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/movie/linkRoom"
				, data:{"roomName":roomName, "movieName":movieName}
				, success:function(data){
					if(data.result == "success"){
						alert("등록 성공");
						location.reload();
					} else {
						alert("등록 실패");
					}
				}
				, error:function(){
					alert("등록 에러");
				}
				
			});
			
		});

	});
	
	
	
	</script>
</body>
</html>