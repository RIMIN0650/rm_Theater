<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager LogIn Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section class="d-flex justify-content-center my-5">
			<div id="loginForm" class="my-5 d-flex justify-content-center">
				<div>
					<h1 class="text-center mb-5">관리자 로그인</h1>
					<div>
						<input type="text" class="form-control mb-3" placeholder="ID" id="identifier">
						<input type="password" class="form-control mb-5" placeholder="PassWord" id="password">
					</div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-info" id="loginBtn">로그인</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<div class="text-center">
		<a href="/admin/join">회원가입</a>&nbsp;또는&nbsp;<a href="/main/home">메인 페이지로</a>
	</div>
	
	<div class="text-center mt-3">
		<a href="/user/login">고객 로그인</a>
	</div>
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		
				
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	<script>
		$(document).ready(function(){
			
			$("#loginBtn").on("click",function(){
				let id = $("#identifier").val();
				let password = $("#password").val();
				
				if(id == ""){
					alert("id 를 입력하세요");
					return ;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/login"
					, data:{"loginId":id, "loginPw":password}
					, success:function(data){
						if(data.result == "success"){
							location.href="/main/home";
							alert("로그인 성공 메인 페이지로 이동합니다.");
						} else {
							alert("아이디 또는 비밀번호를 확인하세요");
						}
					}
					, error:function(){
						alert("로그인 에러");
					}
					
				});
				
			});
			
			
			
			
			
		});
	</script>
	
</body>
</html>