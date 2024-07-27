`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Manager Account</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
		
		<section class="d-flex justify-content-center my-5">
		
			<div id="findAccount"class=" d-flex justify-content-center align-items-center">
				<button type="button" class="btn btn-info mr-4" id="findMyIdBtn">아이디 찾기</button>
				<button type="button" class="btn btn-info" id="findMyPwBtn">비밀번호 찾기</button>
			</div>
			
			<div id="findIdForm" class="d-none">
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
				</div>
			</div>
			
			<div id="findPwForm" class="d-none">
				<div class="d-flex justify-content-center">
					<div class="mt-5">
						<input type="text" class="form-control" placeholder="ID" id="idForPw">
						<input type="text" class="form-control my-3 " placeholder="phoneNumber" id="phoneForPw">
					</div>
				</div>
					<div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-info mt-3" id="findPwBtn">찾기</button>
					</div>
				</div>
			</div>
			<div id="returnIdForm" class="d-none">
				<div class="text-center" id="showId"></div>
			</div>
			<div id="returnPwForm" class="d-none">
				<div class="text-center" id="showTempPw"></div>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-warning mt-5 mr-3" id="toResetPw">비밀번호 재설정</button>
				</div>
			</div>
		</section>
		
		<div class="text-center">
			<a href="/user/join">회원가입</a>&nbsp;또는&nbsp;<a href="/main/home">메인 페이지로</a>
		</div>
		
		<div class="text-center mt-3">
			<a href="/user/login">고객 로그인</a>
		</div>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	<script>
		$(document).ready(function(){
			
			$("#findMyIdBtn").on("click",function(){
				$("#findIdForm").removeClass("d-none");
				$("#findPwForm").addClass("d-none");
				$("#returnPwForm").addClass("d-none");
				$("#returnIdForm").addClass("d-none");
				
			});
			
			$("#findMyPwBtn").on("click",function(){
				$("#findPwForm").removeClass("d-none");
				$("#findIdForm").addClass("d-none");
				$("#returnIdForm").addClass("d-none");
				$("#returnPwForm").addClass("d-none");
				
			});
			
			$("#findIdBtn").on("click",function(){
				
				let name = $("#nameForId").val();
				let email = $("#emailForId").val();
				
				if(name == ""){
					alert("이름을 입력하세요");
					return ;
				}
				
				if(email == ""){
					alert("이메일을 입력하세요");
					return ;
				}
				
				
				
				$.ajax({
					type:"post"
					, url:"/admin/findId"
					, data:{"name":name, "email":email}
					, success:function(data){
						if(data.result == "success"){
							$("#showId").html("<h2>아이디 : " + data.managerId + "</h2>");
							$("#findIdForm").addClass("d-none");
							$("#returnIdForm").removeClass("d-none");
						} else {
							alert("등록된 이름 / 이메일이 없습니다");
						}
					}
					, error:function(){
						alert("아이디 찾기 에러");
					}

				});
				
			});
			
			$("#findPwBtn").on("click",function(){
				
				let id = $("#idForPw").val();
				let phone = $("#phoneForPw").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				if(phone == ""){
					alert("전화번호를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/showTempPw"
					, data:{"loginId":id, "phoneNumber":phone}
					, success:function(data){
						if(data.result == "success"){
							$("#showTempPw").html("<h2>임시 비밀번호 : " + data.managerTempPw + "</h2>");
							$("#findPwForm").addClass("d-none");
							$("#returnPwForm").removeClass("d-none");
						} else {
							alert("등록된 아이디 / 전화번호가 없습니다");
						}
					}
					, error:function(){
						alert("비밀번호 찾기 에러");
					}
				});
				
			});
			
			$("#toResetPw").on("click",function(){
				location.href="/admin/resetPassword";
			});
						
		});
	
	</script>
	
	
</body>
</html>