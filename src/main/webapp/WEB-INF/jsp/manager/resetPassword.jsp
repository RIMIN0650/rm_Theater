<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Manager Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
			
		
			
		<section class="d-flex justify-content-center">
		
			
			
			<div id="resetPwForm">
				<div class="d-flex justify-content-center">
					<div>
						<h3 class="mt-4 mb-5 text-center">비밀번호 변경</h3>
						<div id="checkTempPwForm">
							<input type="text" class="form-control mt-4" placeholder="Id" id="managerId">
							<input type="text" class="form-control mt-3" placeholder="Temp password" id="tempPw">
							<div class="d-flex justify-content-center">
								<button type="button" class="btn btn-success mt-4" id="checkTempPwBtn">확인하기</button>
							</div>
						</div>
						<div id="changePasswordForm" class="d-none">
							<input type="password" class="form-control mt-3" placeholder="New password" id="newPassword">
							<input type="password" class="form-control mt-3" placeholder="Password check" id="newPasswordCheck">
							<div class="d-flex justify-content-center">
								<button type="button" class="btn btn-success mt-4" id="changePasswordBtn">변경하기</button>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			$("#checkTempPwBtn").on("click",function(){
				
				let	managerId = $("#managerId").val();
				let tempPw = $("#tempPw").val();
				
				if(managerId == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				if(tempPw == ""){
					alert("임시 비밀번호를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/checkTempPassword"
					, data:{"loginId":managerId, "tempPassword":tempPw}
					, success:function(data){
						if(data.result){
							alert("임시 비밀번호 확인 성공");
							$("#changePasswordForm").removeClass("d-none");
							$("#checkTempPwForm").addClass("d-none");
						} else {
							alert("임시 비밀번호 확인 실패");
						}
					}
					, error:function(){
						alert("임시 비밀번호 확인 에러");
					}
				})

			});
			
			$("#changePasswordBtn").on("click",function(){
				let managerId = $("#managerId").val();
				let newPw = $("#newPassword").val();
				let newPwCheck = $("#newPasswordCheck").val();
				
				if(newPw == ""){
					alert("새로운 비밀번호를 입력하세요");
					return ;
				}
				
				if(newPw != newPwCheck){
					alert("비밀번호를 확인하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/changePassword"
					, data:{"loginId":managerId, "password":newPw}
					, success:function(data){
						if(data.result == "success"){
							alert("비밀번호 변경 성공");
							location.href="/main/home";
						} else {
							alert("비밀번호 변경 실패");
						}
					}			
					, error:function(){
						alert("비밀번호 변경 에러");
					}
				})
				
				
				
			});
			
			
			
			
			
		});	
	
	
	
	</script>
	
	
</body>
</html>