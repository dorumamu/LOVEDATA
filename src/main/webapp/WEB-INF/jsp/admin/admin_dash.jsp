<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<%--	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">--%>
	<%--	<link rel="stylesheet" type="text/css" href="/css/Bootstarp_test/bootstrap.min.css">--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/service/loc.css">
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

        body {
            font-family: 'Jua', sans-serif;
        }
	</style>
	<title>Admin Dashboard</title>
</head>
<%@ include file="../layout/header.jsp" %>
<body class="bg-light">
	<div class="container-fluid d-flex" style="padding-top: 100px">
		<div class="col-2" id="sidebar">
			<ul class="nav nav-pills flex-column col-2 position-fixed" style="top: 40%">
				<div class="accordion text-center" id="loc">
					<hr>
					<div class="card">
						<div class="card-header" id="headingLoc">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block loc_highlight-selected-nav-menu" type="button"
										data-toggle="collapse"
										data-target="#loc_collapse" aria-expanded="true" aria-controls="collapseOne">
									어드민
								</button>
							</h2>
						</div>
						<div id="loc_collapse" class="collapse show" aria-labelledby="headingLoc" data-parent="#loc">
							<div class="card-body center-pill">
								<p><a href="/admin/dash" class="highlight-selected-text-menu">- 대시보드</a></p>
								<p><a href="/admin/loc_recommend" class="highlight-not-selected-text-menu">- 추천 장소(어드민)</a></p>
								<p><a href="/admin/cor_recommend" class="highlight-not-selected-text-menu">- 추천 코스(어드민)</a></p>
								<p class="mb-0"><a href="" class="highlight-not-selected-text-menu">- 신고 센터</a></p>
							</div>
						</div>
					</div>
				</div>
			</ul>
		</div>

<%--	https://startbootstrap.com/previews/material-admin-pro	--%>
		<div class="container-xl p-5">
			<div class="row justify-content-between align-items-center mb-5">
				<div class="col flex-shrink-0 mb-5 mb-md-0">
					<h1 class="display-4 mb-0">Dashboard</h1>
					<div class="text-muted">Sales overview &amp; summary</div>
				</div>
				<div class="col-12 col-md-auto">
					<div class="d-flex flex-column flex-sm-row gap-3">
						<mwc-select class="mw-50 mb-2 mb-md-0" outlined="" label="View by">
							<mwc-list-item selected="" value="0" mwc-list-item="" tabindex="0" aria-disabled="false" role="option" aria-selected="true">Order type</mwc-list-item>
							<mwc-list-item value="1" mwc-list-item="" tabindex="-1" aria-disabled="false" role="option">Segment</mwc-list-item>
							<mwc-list-item value="2" mwc-list-item="" tabindex="-1" aria-disabled="false" role="option">Customer</mwc-list-item>
						</mwc-select>
						<mwc-select class="mw-50" outlined="" label="Sales from">
							<mwc-list-item value="0" mwc-list-item="" tabindex="0" aria-disabled="false" role="option">Last 7 days</mwc-list-item>
							<mwc-list-item value="1" mwc-list-item="" tabindex="-1" aria-disabled="false" role="option">Last 30 days</mwc-list-item>
							<mwc-list-item value="2" mwc-list-item="" tabindex="-1" aria-disabled="false" role="option">Last month</mwc-list-item>
							<mwc-list-item selected="" value="3" mwc-list-item="" tabindex="-1" aria-disabled="false" role="option" aria-selected="true">Last year</mwc-list-item>
						</mwc-select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 mb-5">
					<div class="card card-raised border-primary" style="border: 1px solid; border-left : 5px solid; border-radius: 30px">
						<div class="card-body px-4">
							<div class="d-flex justify-content-between align-items-center mb-2">
								<div class="me-2">
									<div class="display-5">101.1K</div>
									<div class="card-text">Downloads</div>
								</div>
								<div class="icon-circle bg-primary text-white"><i class="material-icons">download</i></div>
							</div>
							<div class="card-text">
								<div class="d-inline-flex align-items-center">
									<i class="material-icons icon-xs text-success">arrow_upward</i>
									<div class="caption text-success fw-500 me-2">3%</div>
									<div class="caption">from last month</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!--  부트스트랩 js 사용 -->
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%--slim 사용시 ajax 미지원--%>
<%-- https://song8420.tistory.com/236 --%>
<%--<script defer src="https://code.jquery.com/jquery-3.5.1.slim.min.js"--%>
<%--		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
<%--		crossorigin="anonymous"></script>--%>
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</html>