<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Run Time List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
		<c:import url="/WEB-INF/jsp/include/mainMenu.jsp" />
			
		<section>
			<div>
				<c:forEach var="clList" items="${cineLinkList }" varStatus="status">
					<div class="mb-5">
						<h4 class="mb-4">${clList.roomName }관 - ${clList.movieName } </h4>
						<c:forEach var="rtList" items="${runTimeDetailList }">
							<c:choose>
								<c:when test="${not empty clList.roomName }">
									<c:if test="${clList.roomName == rtList.roomName}">
										<button type="button" class="btn ml-2 runTimeBtn" data-runtime-id="${rtList.runTimeId }">
											<div>
											<fmt:formatNumber type="number" maxFractionDigits="0"
											value="${rtList.startTime / 100 }">
											</fmt:formatNumber>
											
											<c:if test="${rtList.startTime % 100 eq 0 }">
											: 00  
											</c:if>
											<c:if test="${(rtList.startTime % 100) lt 10 && (rtList.startTime % 100) gt 0}">
											: 0${rtList.startTime % 100 }  
											</c:if>
											<c:if test="${rtList.startTime % 100 gt 9}">
											: ${rtList.startTime % 100 }
											</c:if>
											</div>
											<div class="small-text">${rtList.totalSeat - rtList.reservedSeat }/${rtList.totalSeat }</div>
										</button>
									</c:if>
								</c:when>
								<c:otherwise>
									<h3>상영 정보 없음</h3>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			$(".runTimeBtn").on("click",function(){
				let runTimeId = $(this).data("runtime-id");
				
				location.href="/reservation/detail?runTimeId="+runTimeId;
			});
			
		});
	</script>
	
</body>
</html>