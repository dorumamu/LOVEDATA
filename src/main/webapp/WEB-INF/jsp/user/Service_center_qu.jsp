<%@ page import="org.springframework.security.core.annotation.AuthenticationPrincipal" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page session="false" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/service/loc.css">
    <link rel="stylesheet" href="/css/ServiceCenter.css" >
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <title>LOVEDATA:ServiceCenter</title>
</head>
<%@ include file="../layout/header.jsp"%>
<body>
<div class="container-fluid d-flex " style="padding-top: 100px">

    <div class="col-2" id="sidebar">
        <ul class="nav nav-pills flex-column col-2 position-fixed" style="top: 40%">
            <div class="accordion text-center" id="loc">
                <hr>
                <div class="card">
                    <div class="card-header" id="headingLoc">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block" type="button" data-toggle="collapse"
                                    data-target="#loc_collapse" aria-expanded="true" aria-controls="collapseOne"
                                    style="text-decoration: none; color: #FF6699; font-weight: bold">
                                고객센터
                            </button>
                        </h2>
                    </div>
                    <div id="loc_collapse" class="collapse show" aria-labelledby="headingLoc" data-parent="#loc">
                        <div class="card-body center-pill">
                            <p><a href="/ServiceCenter/Notice/1" class="loc_highlight-not-selected-text-menu ">- 공지 사항</a></p>
                            <p><a href="/ServiceCenter/Questions/1" class="loc_highlight-selected-text-menu">- 문의 사항</a></p>
                            <p><a href="/ServiceCenter/Policy" class="loc_highlight-not-selected-text-menu ">- LOVEDATA 정책</a></p>
                            <p><a href="/ServiceCenter/Withdrawal" class="loc_highlight-not-selected-text-menu">- 회원 탈퇴</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </ul>
    </div>
    <div class="container-fluid" id="display_center" style="margin-right: 30px">
        <div class="col" id="top_navbar">
            <nav class="navbar navbar-expand-sm navbar-light bg-light static-top">
                <h3 class="mx-3">문의사항</h3>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav ">
                        <ul class="navbar-nav"></ul>
                        <select class="select2-dropdown mx-2" id="Notice_select">
                            <option value="1" selected>제목+내용</option>
                            <option value="2">제목</option>
                            <option value="3">내용</option>
                        </select>
                        <input type="text" class="input-box mx-2" placeholder="검색" id="keyword" name="keyword"/>
                        <button class="btn btn-primary mx-2" type="button" id="searchBtn" onclick="Qsearch()">Search</button>
                    </ul>
                </div>
            </nav>
        </div>
        <c:choose>
            <c:when test="${qu_size>0}">
        <table id="tbody">
            <thead>
            <tr>
                <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>상태</th>
            </tr>
            </thead>
            <tbody id="Qtbody" >

                <c:forEach var="qu" items="${qu}">
                    <tr>
                        <td>${qu.qu_no}</td>
                        <c:choose>
                            <c:when test="${qu.qu_secret eq true}">
                                <td onclick=location.href='/ServiceCenter/Questions_Post/${qu.qu_no}';>${qu.qu_title} <img src="/image/icon/user/secret.png" class="img_s"
                                                                                                                            id="imgDisplay" name="imgDisplay" ></td>
                            </c:when>
                            <c:when test="${qu.qu_secret eq false}">
                                <td onclick=location.href='/ServiceCenter/Questions_Post/${qu.qu_no}';>${qu.qu_title}</td>
                            </c:when>
                        </c:choose>
                        <td>${qu.qu_user}</td>
                        <c:set var="tel" value="${fn:split(qu.qu_date,' ')}" />
                        <c:choose>
                            <c:when test="${tel[0] == qu_time}">
                                <td>${tel[1]}</td>
                            </c:when>
                            <c:when test="${tel[0] != qu_time}">
                                <td>${tel[0]}</td>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${qu.qu_answer eq true}">
                                <td>답변완료</td>
                            </c:when>
                            <c:otherwise>
                                <td>답변중</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            </c:when>
        <c:when test="${qu_size==0}">

            글이 존재하지 않습니다.

        </c:when>
        </c:choose>
        <div class="col" id="pu_navbar">
            <div class="container d-flex" id="">
                <div class="col" id="page_number">
                    <nav aria-label="Page navigation example">
                        <input id="qu_pages" value="${qu_page_size}" type="hidden">
                        <input id="qu_pagess" value="${qu_page}" type="hidden">
                        <div class="pagination justify-content-center" , id="pagination justify-content-center">
                            <p onclick="subpage()"> < </p>
                            <c:choose>
                                <c:when test="${search eq false}">
                                    <c:forEach var="qu_pages" begin="1" end="${qu_page}" step="1">
                                        <div class="page-item" id="${qu_pages}">
                                        <li class="page-item ${qu_pages}">
                                            <a href="/ServiceCenter/Questions/${qu_pages}">${qu_pages}</a>
                                        </li>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${search eq true}">
                                    <c:forEach var="qu_pages" begin="1" end="${qu_page}" step="1">
                                    <div class="page-item" id="${qu_pages}">
                                        <li class="page-item ${qu_pages}">
                                            <a href="/ServiceCenter/Questions/search/${menu}/${text}/${qu_pages}">${qu_pages}</a>
                                        </li>
                                    </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            <p onclick="plupage()"> > </p>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="d-flex justify-content-end">
            <button onclick="location.href='/ServiceCenter/Questions_Post_add'" class="btn btn-primary m-2 float-right">글쓰기</button>
            </div>
        </div>
    </div>
</div>

</body>
<!--   부트스트랩 js 사용  -->
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script defer type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script defer src="/js/ServiceCenter.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

    body {
        font-family: 'Jua', sans-serif;
    }
</style>
</html>