<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMovie</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
	
		<section class="pt-5">
			<h1 class="mb-5 text-center">신규 영화 등록</h1>
			<div class="d-flex justify-content-center pt-5">
				<div class="col-4 d-flex justify-content-center align-items-center movieInfoInputForm">
					<label for="fileInput"><i class="bi bi-image big-font" id="imageIcon">파일첨부</i></label>
					<input type="file" id="fileInput" class="d-none">
					<div>
						<img id="imagePreview" src="" alt="Image Preview" class="d-none">
					</div>
				</div>
				<div class="col-4 ml-5 movieInfoInputForm">
					<input type="text" class="form-control my-4" placeholder="Title" id="title">
					<div class="d-flex">
						<input type="text" class="form-control mb-4 col-5" placeholder="Main Genre" id="mainGenre">
						<input type="text" class="form-control mb-4 col-5 ml-4" placeholder="Sub Genre" id="subGenre">
					</div>
					<input type="text" class="form-control mb-4" placeholder="Director" id="director">
					<div class="d-flex">
						<input type="text" class="form-control mb-4 col-3" placeholder="Age Of View" id="ageOfView">
						<input type="text" class="form-control mb-4 col-3 ml-3" placeholder="RunTime" id="runTime">
						<input type="text" class="form-control mb-4 col-3 ml-3" placeholder="Country" id="country">
					</div>
					<input type="text" class="form-control mb-4" placeholder="Movie OpeningDay" id="openingDay">
					<textarea class="mb-2" placeholder="Movie Detail" rows="7" id="detail"></textarea>
				</div>
			</div>
		</section>
		<div class="d-flex justify-content-end mt-3">
			<button type="button" class="btn btn-danger btn-lg mr-5" id="cancelBtn">취소</button>
			<button type="button" class="btn btn-success btn-lg" id="registerBtn">등록</button>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			$("#fileInput").on("change", function(){
				let file = this.files[0];
				if(file) {
					let reader = new FileReader();
					reader.onload = function(e){
						$("#imagePreview").attr("src", e.target.result);
						$("#imagePreview").show();
					}
					reader.readAsDataURL(file);
				} else {
					$("#imagePreview").hide();
				}
			});
			
			// 영화 등록 기능
			$("#registerBtn").on("click",function(){
				let title = $("#title").val();
				let file = $("#fileInput")[0].files[0];
				let mainGenre = $("#mainGenre").val();
				let subGenre = $("#subGenre").val();
				let director = $("#director").val();
				let ageOfView = $("#ageOfView").val();
				let runTime = $("#runTime").val();
				let country = $("#country").val();
				let openingDay = $("#openingDay").val();
				let detail = $("#detail").val();
				
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
				if(file == null){
					console.log(file);
					alert("파일을 선택해주세요");
					return ;
				}
				
				let formData = new FormData();
				formData.append("title", title);
				formData.append("imageFile", file);
				formData.append("mainGenre", mainGenre);
				formData.append("subGenre", subGenre);
				formData.append("director", director);
				formData.append("ageOfView", ageOfView);
				formData.append("runTime", runTime);
				formData.append("country", country);
				formData.append("openingDay", openingDay);
				formData.append("detail", detail);
				
				$.ajax({
					type:"post"
					, url:"/movie/addMovie"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						if(data.result == "success"){
							alert("영화 등록 성공");
							location.reload();
						} else {
							alert("영화 등록 실패");
						}
					}
					, error:function(){
						alert("글 쓰기 에러");
					}
				});
			});
			
		});
	</script>
	
</body>
</html>