<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<nav class="main-menu-form mb-5">
			<ul class="nav nav-fill main-menu">
				<c:choose>
					<c:when test="${managerName ne null }">		
						<li class="nav-item mt-2"><a href="/movie/list" class="text-dark">영화 관리</a>
							<ul class="sub-menu">
								<li><a href="/admin/addRoom">새로운 관 등록</a></li>
								<li><a href="/movie/linkRoom">영화 배정</a></li>
								<li><a href="/room/linkMovie">관-영화 리스트</a></li>
								<li><a href="/room/roomList">영화관 수정</a></li>
							</ul>
						</li>
						<li class="nav-item mt-2"><a href="#" class="text-dark">이벤트 관리</a></li>
						<li class="nav-item mt-2"><a href="#" class="text-dark">공지 관리</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item mt-2"><a href="/movie/reservation" class="text-dark">예매</a></li>
						<li class="nav-item mt-2"><a href="#" class="text-dark">영화</a></li>
						<li class="nav-item mt-2"><a href="#" class="text-dark">스토어</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<div class="input-group col-4" id="searchInput">
					<input type="text" class="form-control" placeholder="검색할 내용을 입력하세요">
					<div class="input-group-append">
					<!-- 입력 필드와 버튼이 함께 한 줄로 정렬하고, 버튼이 입력 필드와 시각적으로 연결 -->
					<button type="button" class="btn btn-info" id="mainPageSearchBtn">검색</button>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${userName eq null && managerName eq null }">
						<li class="nav-item mt-2"><a href="/user/login" class="text-dark">로그인</a></li>
						<li class="nav-item mt-2"><a href="/user/join" class="text-dark">회원가입</a></li>
						<li class="nav-item mt-2"><a href="#" class="text-dark">비회원 예매</a></li>
					</c:when>
					<c:when test="${userName eq null }">
						<div id="loginStatus" class="mt-3 right">
							<div>${managerName }님&nbsp;&nbsp;<a href="/admin/logout">로그아웃</a></div>
						</div>
						<li class="nav-item mt-2"><a href="#" class="text-dark">내정보</a></li>
					</c:when>
					<c:when test="${managerName eq null }">
						<div id="loginStatus" class="mt-3 right">
							<div>${userName }님&nbsp;&nbsp;<a href="/user/logout">로그아웃</a></div>
						</div>
						<li class="nav-item mt-2"><a href="#" class="text-dark">내정보</a></li>
					</c:when>
					<c:otherwise>
						<div id="loginStatus" class="mt-3 right">
							<div>정보 없음</div>
						</div>
						<li class="nav-item mt-2"><a href="#" class="text-dark">NULL</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		
		