</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie update</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
	
		<section class="pt-5">
			<h1 class="mb-5 text-center">영화 정보 수정</h1>
			<div class="d-flex justify-content-center pt-5">
				<div class="col-4 movieInfoInputForm">
					<div class="d-flex justify-content-end">
						<label for="fileInput"><i class="bi bi-image big-font right" id="addPoster"></i></label>
						<input type="file" id="fileInput" class="d-none">
					</div>
					<div class="d-flex justify-content-center">
						<img id="imagePreview" src="${movieInfo.imagePath }" alt="Image Preview" class="img-fluid">
					</div>
					
				</div>
				<div class="col-4 ml-5 movieInfoInputForm">
					<div id="pkNum" class="d-none">${movieInfo.id }</div>
					<input type="text" class="form-control my-4 movieInfoTextInput" placeholder="Title" id="title" value="${movieInfo.title }">
					<div class="d-flex">
						<input type="text" class="form-control mb-4 col-5 movieInfoTextInput" placeholder="Main Genre" id="mainGenre" value="${movieInfo.mainGenre }">
						<input type="text" class="form-control mb-4 col-5 ml-4 movieInfoTextInput" placeholder="Sub Genre" id="subGenre" value="${movieInfo.subGenre }">
					</div>
					<input type="text" class="form-control mb-4 movieInfoTextInput" placeholder="Director" id="director" value="${movieInfo.director }">
					<div class="d-flex">
						<input type="text" class="form-control mb-4 col-3 movieInfoTextInput" placeholder="Age Of View" id="ageOfView" value="${movieInfo.ageOfView }">
						<input type="number" class="form-control mb-4 col-3 ml-3 movieInfoTextInput" placeholder="RunTime" id="runTime" value="${movieInfo.runTime }">
						<input type="text" class="form-control mb-4 col-3 ml-3 movieInfoTextInput" placeholder="Country" id="country" value="${movieInfo.country }">
					</div>
					<input type="text" class="form-control mb-4 movieInfoTextInput" placeholder="Movie OpeningDay" id="openingDay" value="${movieInfo.openingDay }">
					<textarea class="mb-2" placeholder="Movie Detail" rows="9" id="detail">${movieInfo.detail }</textarea>
				</div>
			</div>
		</section>
		<div class="d-flex justify-content-end mt-3">
			<button type="button" class="btn btn-danger btn-lg mr-5" id="cancelBtn">삭제</button>
			<button type="button" class="btn btn-warning btn-lg mr-5" id="deleteBtn">취소</button>
			<button type="button" class="btn btn-success btn-lg" id="modifyBtn">수정</button>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			let runTime = 1;
			let movieId = $("#pkNum").text();			
			let existingImagePath = $("imagePreview").attr("src");
			
			
			$("#runTime").on("change",function(){
				let runTime = $(this).val();
				if(runTime < 1){
					alert("1 이하의 숫자는 입력할 수 없습니다");
					$("#runTime").val("");
				}
				
			});
			
			$("#fileInput").on("change", function(){
				let file = this.files[0];
				
				if(file) {
					let reader = new FileReader();
					reader.onload = function(e){
						$("#imagePreview").attr("src", e.target.result);
						$("#imagePreview").removeClass("d-none");
						
					}
					reader.readAsDataURL(file);
				} else {
					$("#imagePreview").addClass("d-none");
				}
			});
			
			// 영화 등록 기능
			$("#modifyBtn").on("click",function(){
				
				let title = $("#title").val();
				let file = $("#fileInput")[0].files[0]; // 파일 업로드 input에서 파일 가져오기
				let mainGenre = $("#mainGenre").val();
				let subGenre = $("#subGenre").val();
				let director = $("#director").val();
				let ageOfView = $("#ageOfView").val();
				let runTime = $("#runTime").val();
				let country = $("#country").val();
				let openingDay = $("#openingDay").val();
				let detail = $("#detail").val();
				
				
				//
				// 이미지 파일이 어떻게 전달되는지 콘솔에 찍기
				let applyFile = document.getElementById("fileInput").files;
				console.log(applyFile);
				
				
				//
				
				if(title == ""){
					alert("title을 입력하세요");
					return ;
				}
				if(mainGenre == ""){
					alert("mainGenre를 입력하세요");
					return ;
				}
				if(director == ""){
					alert("director를 입력하세요");
					return ;
				}
				if(ageOfView == ""){
					alert("age를 입력하세요");
					return ;
				}
				if(runTime == ""){
					alert("runTime을 입력하세요");
					return ;
				}
				if(country == ""){
					alert("country를 입력하세요");
					return ;
				}
				if(openingDay == ""){
					alert("openingDay를 입력하세요");
					return;
				}
				
				let formData = new FormData();
				formData.append("id", movieId);
				formData.append("title", title);
				// 이미지 파일이 선택되었고, 파일이 등록되지 않은 경우에만 추가
		        if (file !== undefined && file != null ) {
		            formData.append("imageFile", file);
		        } else {
		        	formData.append("existingImagePath", existingImagePath);
		        }
				formData.append("mainGenre", mainGenre);
				formData.append("subGenre", subGenre);
				formData.append("director", director);
				formData.append("ageOfView", ageOfView);
				formData.append("runTime", runTime);
				formData.append("country", country);
				formData.append("openingDay", openingDay);
				formData.append("detail", detail);
				
				$.ajax({
					type:"put"
					, url:"/movie/update"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						if(data.result == "success"){
							alert("영화 정보 수정 성공");
							location.href="/movie/list"
						} else {
							alert("영화 정보 수정 실패");
						}
					}
					, error:function(){
						alert("영화 정보 수정 에러");
					}
				});
			});
			
		});
	</script>
	
</body>
</html>