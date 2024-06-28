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
						<input type="text" class="form-control col-8" placeholder="ID" id="identifier">
						<button type="button" class="btn btn-info" id="checkDupBtn">중복 확인</button>
					</div>
					
					<input type="text" class="form-control mb-4" placeholder="Name" id="name">
					<input type="password" class="form-control mb-4" placeholder="PW" id="password">
					<input type="passwordCheck" class="form-control mb-4" placeholder="PW CHECK" id="passwordCheck">
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-3" placeholder="010" maxlength='3' id="telNum1">
						<h3>-</h3>
						<input type="text" class="form-control col-4" placeholder="1234" maxlength='4' id="telNum2">
						<h3>-</h3>
						<input type="text" class="form-control col-4" placeholder="5678" maxlength='4' id="telNum3">
					</div>
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-5" placeholder="이메일" id="emailId">
						<h3>@</h3>
						<input type="text" class="form-control col-5" placeholder="선택하세요" id="emailDomain">							
										
					</div>
					
					<div class="d-flex justify-content-between align-items-center text-align-center mb-3">
						<input type="text" class="form-control col-3" placeholder="yyyy" id="birthYear" maxlength='4'>
						<h4>년</h4>
						<input type="text" class="form-control col-2" placeholder="mm" id="birthMonth" maxlength='2'>
						<h3>월</h3>
						<input type="text" class="form-control col-2" placeholder="dd" id="birthDate" maxlength='2'>
						<h3>일</h3>
					</div>
					<div class="mb-3 d-flex justify-content-center align-items-center">
						<div>성별 : &nbsp;</div>
						<div class="form-check form-check-inline d-flex align-items-center">
							<input class="form-check-input" type="radio" name="sex" id="maleRadioButton" value="MALE">
							<label class="form-check-label" for="maleRadioButton">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="sex" id="femailRadioButton" value="FEMALE">
							<label class="form-check-label" for="femailRadioButton">여성</label>
						</div>
					</div>
					
					<button type="button" class="btn btn-info" id="joinBtn">회원가입</button>
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
	
	<script>
		$(document).ready(function(){
			var now = new Date();
			var currentYear = now.getFullYear();
			var sex = "neutral";
			var checkId = false;
			
			
			// 아이디 입력 부분에 변화가 생긴 경우
			// 모든 관련 부분 초기화 시켜주기
			/* $("#identifier").on("input",function){
				
			} */
			
			
			
			
			$("#checkDupBtn").on("click",function(){
				let id = $("#identifier").val();
				if(id == ""){
					alert("ID를 입력하세요");
					return;
				}
				
			});
			
			$("#joinBtn").on("click",function(){
				let id = $("#identifier").val();
				let name = $("#name").val();
				let pw = $("#password").val();
				let pwCheck = $("#passwordCheck").val();
				let telNum1 = $("#telNum1").val();
				let telNum2 = $("#telNum2").val();
				let telNum3 = $("#telNum3").val();
				let phoneNumber = telNum1 + telNum2 + telNum3;
				let emailId = $("#emailId").val();
				let emailDomain = $("#emailDomain").val();
				let email = emailId + "@" + emailDomain;
				let birthYear = $("#birthYear").val();
				let birthMonth = $("#birthMonth").val();
				let birthDate = $("#birthDate").val();
				let birthDay = birthYear + birthMonth + birthDate;
				let age = currentYear - birthYear
				let sex = $('input[name=sex]:checked').val();
				
				if(id == ""){
					alert("id를 입력하세요.");
					return;
				}
				if(name == ""){
					alert("이름을 입력하세요.");
					return;
				}
				if(pw == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				if(pwCheck != pw){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				if(telNum1 == "" || telNum2 == "" || telNum3 == "" || phoneNumber.length != 11){
					alert("전화번호를 확인하세요");
					return;
				}
				if(emailId == "" || emailDomain == ""){
					alert("이메일을 확인하세요");
					return;
				}
				if(birthYear == "" || birthMonth == "" || birthDate == ""){
					alert("생년월일을 확인하세요.");
					return;
				}
				if(sex != "MALE" && sex != "FEMALE"){
					alert("성별을 선택해주세요");
					return;
				}
				
				
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":id, "password":pw, "name":name
							, "phoneNumber":phoneNumber, "email":email, "age":age, "sex":sex}
							, success:function(data){
								if(data.result == "success"){
									alert("회원가입 성공! 환영합니다");
									
								} else {
									alert("로그인 실패");
								}
							}, error:function(){
								alert("로그인 에러");
							}
					
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>