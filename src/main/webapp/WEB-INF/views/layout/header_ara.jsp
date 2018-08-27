<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>boot_main &mdash; Free Website Template, Free HTML5 Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
	

	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/boot_main/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/boot_main/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="resources/boot_main/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/boot_main/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/boot_main/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="resources/boot_main/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/boot_main/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="resources/boot_main/css/style.css">
	
	<!-- 헤더 로그인 -->
	<link rel="stylesheet" href="resources/css/header_ara.css">

	<!-- Modernizr JS -->
	<script src="resources/boot_main/js/modernizr-2.6.2.min.js"></script>
	
	</head>
	
	<body>
		
		
		
	<!-- 헤더-로그인 -->	 
	<div id="myara">
		<c:if test="${sessionScope.id==null}">
		    <div class="menu common" style="width:20%;position:relative;"><p class="aranav"></p>
		   	</div>
		    <div class="logo common" style="width:40%">
		    	<p class="aranav"><span >ARA, Leading the Way to the Future</span></p>
		    </div>
		    <div class="login common" style="width:20%">
		    	<p class="aranav">
		    		<a href="loginPage" style="color:#001E42;">LOGIN</a>
		    	</p>
		    </div>
	    </c:if>
	    
	    <c:if test="${sessionScope.id!=null}">
	    	<div class="menu common" style="width:20%;position:relative;"><p class="aranav"></p>
	    	</div>
		    <div class="logo common" style="width:40%">
		    	<p class="aranav"><span>ARA, Leading the Way to the Future</span></p>
		    </div>
		    <div class="login common" style="width:25%">
		    	<p class="aranav">
		    		<span style="color:#001E42;padding-right:20px;display:inline">${sessionScope.name} (${sessionScope.id}) 님</span>
		    		<span><a href="logout" style="color:#001E42;padding:20px;">LOGOUT</a></span>	    			    						
		    	</p>
		    </div>
	    </c:if>
	</div>
	
	<div class="gtco-loader"></div>
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo"><a href="ara"><img src="resources/images/common_img/logo/ARA_mint.PNG" height="50px"></a></div>
					</div>
					
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li><a href="igoara">아라소개</a></li>
							<li><a href="admission">입학안내</a></li>						
							<li class="has-dropdown active">
								<a href="#">대학생활</a>
								<ul class="dropdown">
									<li><a href="bus_list">스쿨버스</a></li>
									<li><a href="st_dietary_chart">학식</a></li>
									<li><a href="circle_list">동아리</a></li>
								</ul>
							</li>
							<c:if test="${sessionScope.id == null}">
								<li class="has-dropdown active">
									<a href="#">학사정보</a>
										<ul class="dropdown">
											<li>로그인 후, 이용해 주세요</li>																											
										</ul>
								</li>
							</c:if>	
							
							<c:set var="id" value="${sessionScope.id.substring(0,1)}"/>
							
							<c:if test="${sessionScope.id != null}">	
								<c:if test="${id == '0'}">
									<li class="has-dropdown active">
										<a href="#">학사정보</a>
											<ul class="dropdown">
												<li><a href="st_adm?st_state=1&major=101">학생 관리</a></li>
												<li><a href="st_adm?st_state=2">성적 관리</a></li>														
											</ul>
									</li>
								</c:if>
								
								<c:if test="${id == '1'}">
									<li class="has-dropdown active">
										<a href="#">학사정보</a>
											<ul class="dropdown">
												<li><a href="st_pro?st_state=50">내 강의실</a>																											
											</ul>
									</li>
								</c:if>
								
								<c:if test="${id == '2'}">
									<li class="has-dropdown active">
										<a href="#">학사정보</a>
											<ul class="dropdown">
												<li><a href="st_stu?st_state=15">학사 정보</a></li>
												<li><a href="st_stu?st_state=10">마이 페이지</a></li>																	
											</ul>
									</li>
								</c:if>
								
							</c:if>																					
						</ul>
					
					</div>
				</div>
			</div>
		</nav>

	<!-- jQuery -->
	<script src="${path}resources/js/jquery-3.3.1.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/boot_main/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/boot_main/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/boot_main/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="resources/boot_main/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/boot_main/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/boot_main/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="resources/boot_main/js/main.js"></script>

	
