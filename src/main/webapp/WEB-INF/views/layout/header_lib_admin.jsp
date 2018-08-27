<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>boot_main &mdash; Free Website Template, Free HTML5 Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
	
  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700" rel="stylesheet">
	
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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="resources/boot_main/js/respond.min.js"></script>
	<![endif]-->
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
	
<!-- 헤더-로그인 -->	
	<c:choose>
	
		<c:when test="${sessionScope.id == null}">
			<div id="my">
				<p style="text-align:center;font-size:14px;">
				    <span>ARA, Leading the Way to the Future</span>
				    <a style="color:black; padding-right:20px;" onclick="javascript:librarylogin();">LOGIN</a>
			    </p>
			</div>					
		</c:when>
		
		<c:when test="${sessionScope.id != null}">
			<div id="my">
				<p style="text-align:center;font-size:14px;">
				    <span>${name} 관리자   페이지 입니다</span>
				    <a style="color:black; padding-right:20px;" href="lib_logout">LOGOUT</a>
			    </p>
			</div>					
		</c:when>
		
	</c:choose>
	
	
	
	<div class="gtco-loader"></div>
	<!-- 헤더 - 네비게이션 -->
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				
				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo"><a href="ara"><img src="resources/images/common_img/logo/ARA_mint.PNG" height="50px"></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li>
								<a href="lib_bookSearch_admin">도서 검색</a>
							</li>
							<li class="has-dropdown active">
								<a href="#">도서 관리</a>
								<ul class="dropdown">
									<li><a href="lib_bookAddForm">도서 등록</a></li>								
									<!-- <li><a href="lib_bookSupervise">도서 현황</a></li>	 -->								
								</ul>
							</li>		
							<li>
								<a href="lib_loanSupervise">대여 관리</a>
							</li>							
							<li>
								<a href="lib_seat_admin">좌석 현황</a>
							</li>							
							<li>
								<a href="lib_home">도서관홈으로</a>
							</li>													
						</ul>
					</div>
				</div>
				
			</div>
		</nav>


<!-- 	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div> -->
	
	<!-- jQuery -->
	<script src="resources/boot_main/js/jquery.min.js"></script>
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

	
