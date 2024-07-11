<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Us</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
	
		<section class="d-flex justify-content-center">
			<div class="text-center" id="joinForm">
				<h1 class="my-5">Join RM Theater</h1>
				<div>
					<div class="d-flex justify-content-between mb-4">
						<input type="text" class="form-control col-8" placeholder="ID" id="identifier">
						<button type="button" class="btn btn-info" id="checkDupBtn">중복 확인</button>
					</div>
					<div class="d-flex justify-content-center align-items-start">
						<div class="small text-danger d-none mb-3" id="dupId">중복된 id 입니다.</div>
						<div class="small text-success d-none mb-3" id="possId">사용 가능한 id 입니다.</div>
					</div>
					
					
					<input type="text" class="form-control mb-4" placeholder="Name" id="name">
					<input type="password" class="form-control mb-4" placeholder="PW" id="password">
					<input type="password" class="form-control mb-4" placeholder="PW CHECK" id="passwordCheck">
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
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

		
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			var now = new Date(); // 현재 날짜 불러오기
			var currentYear = now.getFullYear(); // 현재 년도 변수에 저장
			// var sex = "neutral"; // 초기 성별을 중립으로 설정
			
			var isDupId = true; // 중복된 아이디인지 체크
			
			var isDupCheck = false; // 아이디 중복 확인 검사
			
			$("#identifier").on("input",function(){
				// 아이디 입력 칸에 변화가 생긴 경우
				// 아이디 중복확인과 관련된 모든 부분을 초기화하기
				isDupCheck = false;
				isDuplicateId = true;
				
				$("#dupId").addClass("d-none");
				$("#possId").addClass("d-none");
				
			});
			
			
			$("#telNum1").on("input",function(){
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
				// $(this).val()은 입력 필드의 현재 값을 가져오고
				// 'replace' 메소드를 통해 숫자가 아닌 모든 문자를 빈 문자열로 대체한 다음
				// 다시 $(this).val()을 사용해서 필드의 값을 업데이트
			});
			
			$("#telNum2").on("input",function(){
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			});
			
			$("#telNum3").on("input",function(){
				$(this).val($(this).val().replace(/[^0-9]/g, ''));			
			});
			
			
			
			$("#checkDupBtn").on("click",function(){
				let id = $("#identifier").val();
				if(id == ""){
					alert("ID를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate-id"
					, data:{"loginId":id}
					, success:function(data){
						
						isDupCheck = true; // 아이디 중복 확인 여부를 참으로 만들기
						if(data.isDuplicateId){ // 만약 중복된 아이디라면
							isDupId = true;
							$("#dupId").removeClass("d-none");
							$("#possId").addClass("d-none");
						} else { // 아이디가 중복이 아니라면
							isDupId = false;
							$("#possId").removeClass("d-none");
							$("#dupId").addClass("d-none");
						}
					}
					, error:function(){
						alert("중복 확인 에러");
					}
				});
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
				let age = currentYear - birthYear
				let sex = $('input[name=sex]:checked').val();
				
				if(id == ""){
					alert("id를 입력하세요.");
					return ;
				}
				
				if(!isDupCheck){
					alert("아이디 중복 확인을 해주세요");
					return ;
				}
				
				if(isDupId){ // 아이디가 중복 된 것을 띄워도 회원가입 버튼을 누른 경우
					alert("아이디가 중복되었습니다");
					return ;
				}
				
				if(name == ""){
					alert("이름을 입력하세요.");
					return ;
				}
				
				if(pw == ""){
					alert("비밀번호를 입력하세요.");
					return ;
				}
				
				if(pwCheck != pw){
					alert("비밀번호가 일치하지 않습니다.");
					return ;
				}
				
				if(telNum1 == "" || telNum2 == "" || telNum3 == "" || phoneNumber.length != 11){
					alert("전화번호를 확인하세요");
					return ;
				}
				
				if(emailId == "" || emailDomain == ""){
					alert("이메일을 확인하세요");
					return ;
				}
				
				if(birthYear == "" || birthMonth == "" || birthDate == ""){
					alert("생년월일을 확인하세요.");
					return ;
				}
				
				if(sex != "MALE" && sex != "FEMALE"){
					alert("성별을 선택해주세요");
					return ;
				}
				
				if(birthMonth >12){
					alert("월을 확인하세요");
					return ;
				}
				
				if(birthMonth < 10){ // 월을 7로 입력한 경우 07로 변환
					birthMonth = "0" + birthMonth;
				}
				
				if(birthDate > 31){
					alert("일을 확인하세요");
					return ;
				}
				
				if(birthDate < 10){ // 일을 3으로 입력한 경우 03으로 변환
					birthDate = "0" + birthDate;
				}
				
				let birthDay = birthYear + birthMonth + birthDate;
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":id, "password":pw, "name":name
							, "phoneNumber":phoneNumber, "email":email, "age":age, "sex":sex}
							, success:function(data){
								if(data.result == "success"){
									alert("회원가입 성공! 환영합니다");
									location.href="/main/home";
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