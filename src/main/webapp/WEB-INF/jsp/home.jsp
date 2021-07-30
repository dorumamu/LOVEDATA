<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page session="false" %>

<html>
<head>
	<link href="/css/home.css" rel="stylesheet">
	<title>Home</title>
</head>
<script src="https://www.jsdelivr.com/package/npm/fullpage.js?version=2.9.4"></script>
<body>
<%@ include file="layout/header.jsp" %>
		<div class="container">
			<div class="flex-container">
				<div class="main-content">
					<div class="slideshow-container">
						<div class="mySlides fade">
							<div class="Slides-content">
								<div id="img-content">
									<img class="banner-img" src="/image/icon/home/datapg1.png">
								</div>
							</div>
						</div>

						<div class="mySlides fade">
							<div class="Slides-content">
								<div id="img-content">
									<img class="banner-img" src="/image/icon/home/datapg2.png">
								</div>
							</div>
						</div>

						<div class="mySlides fade">
							<div class="Slides-content">
								<div id="img-content">
									<img class="banner-img" src="/image/icon/home/datepg3.jpg">
								</div>
							</div>
						</div>
						<div>
							<a class="prev" onclick="plusSlides(-1)"><img src="/image/icon/home/slide_btn_prev.png"></a>
							<a class="next" onclick="plusSlides(1)"><img src="/image/icon/home/slide_btn_next.png"></a>
						</div>


						<div class="slider-dot">
							<span class="dot" onclick="currentSlide(1)"></span>
							<span class="dot" onclick="currentSlide(2)"></span>
							<span class="dot" onclick="currentSlide(3)"></span>
						</div>
					</div>


				</div>
				<div class="class1">
					<%--			로그인 되어 있을 경우 Logout  --%>
					<sec:authorize access="isAuthenticated()">
						<c:set var="user_social"><sec:authentication property="principal.user_social"/></c:set>
						<c:choose>
							<%--					소셜 로그인으로 로그인 되어 있을 경우--%>
							<c:when test="${user_social eq true}">
								<c:set var="social_info"><sec:authentication property="principal.social_info"/></c:set>

								<c:choose>
									<%--						소셜 로그인을 카카오로 했을 경우--%>
									<c:when test="${social_info eq 'kakao'}">
										<form action="/logout_kakao" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<button type="submit">LOGOUT</button>
										</form>
									</c:when>

									<%--						소셜 로그인을 네이버로 했을 경우--%>
									<c:when test="${social_info eq 'naver'}">
										<form action="/logout" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<button type="submit">LOGOUT</button>
										</form>
									</c:when>
								</c:choose>
							</c:when>

							<%--					일반 로그인으로 로그인 되어 있을 경우--%>
							<c:when test="${user_social ne true}">
								<form action="/logout" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<button type="submit">LOGOUT</button>
								</form>
							</c:when>
						</c:choose>
					</sec:authorize>

					<%--		로그인 되어 있지 않을 경우 Login	--%>
					<sec:authorize access="!isAuthenticated()">
						<form action="/login" method="get">
								<%--					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
								<%--					<button type="submit">LOGIN</button>--%>
						</form>
					</sec:authorize>
				</div>
				<div class="class1">
					<%--			<a href="/find_id">회원정보 찾기 수정</a>--%>
					<a href="/user/deleteAccount">(임시)회원탈퇴</a>
					<br><br>
					<%--			<a href="/bootstrap">부트스트랩 테스트</a>--%>
					<%--			<a href="/service/loc_recommend">장소_추천</a>--%>
					<a href="/service/loc_recommend">장소 추천</a>
					<a href="/service/loc_detail/ex">장소 보기 예시</a>
					<a href="/service/cor_index">코스 인덱스</a>
					<a href="/fullpage">fullpage테스트</a>
					<%--			<a href="/sample/index">테스트</a>--%>
					<%--			<a href="/service/loc_index">장소_인덱스</a>--%>
					<a href="/Notice">공지사항</a>
				</div>
			</div>
		</div>
</body>
<%--<%@ include file="layout/footer.jsp" %>--%>
<!--  부트스트랩 js 사용 -->
<script defer src="/js/home.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script defer type="text/javascript" src="/resource/js/bootstrap.js"></script>
</html>
