<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>runTime Id 받아서 상세정보 표시하면서 예약할 수 있는 창</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
			
		<section>
			<div id="userId" class="d-none">${userId }</div>
			<div id="runTimeId" class="d-none">${runTimeId }</div>
			<div id="remainSeatCount" class="d-none">${room.totalSeat - runTimeDetail.reservedSeat }</div>
			
			<div class="d-flex">
				<div id="movieDetailForm" class="pt-3 pl-3">
					<h2>${movieName }</h2>
					<h4>${runTimeDetail.startTime } ~ ${runTimeDetail.endTime }</h4>
					<h5>${roomName }관 / 잔여 좌석 : ${room.totalSeat - runTimeDetail.reservedSeat } / ${room.totalSeat }</h5>
				</div>
				<div id="inputClientNumberForm">
					<div class="d-flex align-items-between mt-3">
						<div class="d-flex ml-3">
							<h4 class="mt-1 mr-3">성인</h4>
							<button type="button" class="btn btn-light subCntBtn" data-target="countAdult">-</button>
							<input type="number" class="form-control col-2 mx-1 text-center" id="countAdult" value="0" min="0">
							<button type="button" class="btn btn-light addCntBtn" data-target="countAdult">+</button>
						</div>
						<div class="d-flex">
							<h4 class="mt-1 mr-2">청소년</h4>
							<button type="button" class="btn btn-light subCntBtn" data-target="countJunior">-</button>
							<input type="number" class="form-control col-2 mx-1 text-center" id="countJunior" value="0" min="0">
							<button type="button" class="btn btn-light addCntBtn" data-target="countJunior">+</button>
						</div>
						<div class="d-flex">
							<h4 class="mt-1 mr-2">경로</h4>
							<button type="button" class="btn btn-light subCntBtn" data-target="countSenior">-</button>
							<input type="number" class="form-control col-2 mx-1 text-center" id="countSenior" value="0" min="0">
							<button type="button" class="btn btn-light addCntBtn" data-target="countSenior">+</button>
						</div>
						<div class="d-flex">
							<h4 class="mt-1 mr-2">장애인</h4>
							<button type="button" class="btn btn-light subCntBtn" data-target="countDisabled">-</button>
							<input type="number" class="form-control col-2 mx-1 text-center" id="countDisabled" value="0" min="0">
							<button type="button" class="btn btn-light addCntBtn" data-target="countDisabled">+</button>
						</div>
					</div>
					<div class="mt-4 text-center" id="ageInfoForm">
						<h6 id="adultInfo" class="text-white d-none">- 인원 선택 후 결제 버튼을 눌러주세요.</h6>
						<h6 id="juniorInfo" class="text-white d-none">- 14세 ~ 19세, 입장시 청소년증을 지참해주세요.</h6>						
						<h6 id="seniorInfo" class="text-white d-none">- 반드시 본인의 신분증(만 65세 이상)을 소지하신 후 입장해주세요. 미지참 시 입장이 제한됩니다.</h6>
						<h6 id="disabledInfo" class="text-white d-none">- 반드시 복지카드를 소지하신 후 입장해주세요. 미지참 시 입장이 제한됩니다</h6>
					</div>
					<div class="d-flex ml-3 mb-2">
						<h3>가격 :&nbsp;</h3><h3 id="totalPrice">0원</h3>
					</div>
				</div>
			</div>
			<div class="mt-3 d-flex justify-content-end">
				<button type="button" class="btn btn-lg text-white" id="submitBookInfoBtn">예매하기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			
			function updateTotalPrice(){
				let adultCount = parseInt($("#countAdult").val()) || 0;
				let juniorCount = parseInt($("#countJunior").val()) || 0;
				let seniorCount = parseInt($("#countSenior").val()) || 0;
				let disabledCount = parseInt($("#countDisabled").val()) || 0;
				
				let adultPrice = 12000;
				let juniorPrice = 8000;
				let seniorPrice = 5000;
				let disabledPrice = 3000;
				
				let totalPrice = (adultCount * adultPrice) +
									(juniorCount * juniorPrice) +
									(seniorCount * seniorPrice) +
									(disabledCount * disabledPrice);
				
				$("#totalPrice").text(totalPrice + "원");
			}
			$(".subCntBtn").on("click",function(){
				
				let targetId = $(this).data("target");
				let input = $("#" + targetId);
				let currentValue = parseInt(input.val());
				if(currentValue > 0){
					input.val(currentValue - 1).trigger("change");
				}
				
			});
			
			
			$(".addCntBtn").on("click",function(){
				
				let targetId = $(this).data("target");
				let input = $("#" + targetId);
				let currentValue = parseInt(input.val());
				if(currentValue < 9){
					input.val(currentValue + 1).trigger("change");
				}
				
			});
			
			$("#countAdult").on("change",function(){
				$("#adultInfo").removeClass("d-none");
				$("#juniorInfo").addClass("d-none");
				$("#seniorInfo").addClass("d-none");
				$("#disabledInfo").addClass("d-none");
				updateTotalPrice();
			});
			
			$("#countJunior").on("change",function(){
				$("#adultInfo").addClass("d-none");
				$("#juniorInfo").removeClass("d-none");
				$("#seniorInfo").addClass("d-none");
				$("#disabledInfo").addClass("d-none");
				updateTotalPrice();
			});
			
			$("#countSenior").on("change",function(){
				$("#adultInfo").addClass("d-none");
				$("#juniorInfo").addClass("d-none");
				$("#seniorInfo").removeClass("d-none");
				$("#disabledInfo").addClass("d-none");
				updateTotalPrice();
			});
			
			$("#countDisabled").on("change",function(){
				$("#adultInfo").addClass("d-none");
				$("#juniorInfo").addClass("d-none");
				$("#seniorInfo").addClass("d-none");
				$("#disabledInfo").removeClass("d-none");
				updateTotalPrice();
			});
			
			$("#submitBookInfoBtn").on("click",function(){
				let userId = $("#userId").text();
				let runTimeId = $("#runTimeId").text();
				let remainSeatCount = parseInt($("#remainSeatCount").text());
				
				alert(remainSeatCount);
				
				let adultCount = parseInt($("#countAdult").val());
				let juniorCount = parseInt($("#countJunior").val());
				let seniorCount = parseInt($("#countSenior").val());
				let disabledCount = parseInt($("#countDisabled").val());
				
				let totalCount = adultCount + juniorCount + seniorCount + disabledCount;
				
				if(totalCount < 1){
					alert("0명은 예매할 수 없습니다.");
					return ;
				}
				
				if(totalCount > 8){
					alert("최대 예약 가능 인원은 8명 입니다");
					return ;
				}
				
				if(remainSeatCount < totalCount){
					alert("예매 가능 인원을 확인해주세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/reservation/add"
					, data:{"userId":userId, "runTimeId":runTimeId, "countAdult":adultCount
						, "countJunior":juniorCount, "countSenior":seniorCount, "countDisabled":disabledCount}
					, success:function(data){
						if(data.result == "success"){
							alert("예약 성공");
							location.href="/main/home";
						} else {
							alert("예약 실패");
						}
					}
					, error:function(){
						alert("예약 에러");
					}
				});
			});
			
		});
	</script>
	
</body>
</html>