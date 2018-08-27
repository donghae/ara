<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/boot_library/css/courses_styles.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/css/courses_responsive.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/css/bootstrap.min.css">
<link href="resources/boot_library/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/css/main_styles.css">
<link rel="stylesheet" type="text/css" href="resources/boot_library/css/responsive.css">


	<header class="header d-flex flex-row" style="background:#fff;">
		<div class="header_content d-flex flex-row align-items-center">
			<!-- Logo -->
			<div class="logo_container">
				<div class="logo">
					<a href="ara"><img src="resources/images/common_img/logo/ARA_white_red.PNG" width="50px"></a>
					<span style="padding-left:15px;"><a href="lib_home"><img src="resources/images/common_img/logo/ARA_full_white.PNG" alt="" height="35px"></a></span>
				</div>
			</div>

			<!-- Main Navigation -->
			<nav class="main_nav_container">
				<div class="main_nav">
					<ul class="main_nav_list" >
						
						<li class="main_nav_item">
							<a href="lib_bookSearch" style="color:#001E42;">도서 검색</a>							
						</li>
						
						<li class="main_nav_item">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:#001E42;" aria-haspopup="true" aria-expanded="false">
							도서관 안내
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><center><a href="lib_summary">개 요</a></center></li>
								<li><center><a href="lib_situation">현 황</a></center></li>
								<li><center><a href="lib_map">찾아오시는 길</a></center></li>
							</ul>
						</li>
						
						
						<c:choose>												
							<c:when test="${sessionScope.id == null}"><!-- 비회원일 시 -->
								<li class="main_nav_item">
									<a href="lib_seat" class="dropdown-toggle" style="color:#001E42;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									도서관 서비스
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center>&nbsp;&nbsp;로그인 후, 이용해 주세요&nbsp;&nbsp;</center></li>
									</ul>
								</li>
																	
								<li class="main_nav_item">
									<a onclick="javascript:librarylogin();" style="color:#001E42;">로그인</a>	
								</li>							
							</c:when>
							
							
							<c:when test="${sessionScope.id != null}"><!-- 로그인 했을 시 -->
								<c:set var="admin" value="${sessionScope.id.substring(0,1)}"/>
								<c:choose>
									
									<c:when test="${admin == '0'}">	<!-- 관리자일 경우 -->																	
										<li class="main_nav_item">
											<a href="#" style="color:#001E42;" class="dropdown-toggle" data-toggle="dropdown" 
												role="button" aria-haspopup="true" aria-expanded="false">
												${name}<span class="caret"></span>
											</a>
										
											<ul class="dropdown-menu">
												<li><center><a href="lib_bookSearch_admin">관리자 페이지</a></center></li>									
												<li><center><a href="lib_logout">로그아웃</a></center></li>
											</ul>
										</li>
									</c:when>
									
									
									<c:otherwise><!-- 학생/교수일 경우 -->
										<li class="main_nav_item">
											<a href="lib_seat" class="dropdown-toggle" style="color:#001E42;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
											도서관 서비스
												<span class="caret"></span>
											</a>
											<ul class="dropdown-menu">
												<li><center><a href="lib_seat">좌석 현황</a></center></li>
											</ul>
										</li>
										
										<li class="main_nav_item">
											<a href="#" class="dropdown-toggle" style="color:#001E42;" data-toggle="dropdown" 
												role="button" aria-haspopup="true" aria-expanded="false">
												마이 라이브러리<span class="caret"></span>
											</a>
										
											<ul class="dropdown-menu">
												<li><center><a href="lib_myLibrary">도서 내역</a></center></li>											
											</ul>
										</li>
										
										<li class="main_nav_item">
											<a href="#" style="color:#001E42;" class="dropdown-toggle" data-toggle="dropdown" 
												role="button" aria-haspopup="true" aria-expanded="false">
												${name}<span class="caret"></span>
											</a>
										
											<ul class="dropdown-menu">									
												<li><center><a href="lib_logout">로그아웃</a></center></li>
											</ul>
										</li>
									</c:otherwise>
									
								</c:choose>
								
							</c:when>
						</c:choose>
						
					</ul>
				</div>
			</nav>
		</div>
	
	</header>
<script src="resources/boot_library/js/jquery-3.2.1.min.js"></script>
<script src="resources/boot_library/js/popper.js"></script>
<script src="resources/boot_library/js/bootstrap.min.js"></script>
<script src="resources/boot_library/plugins/greensock/TweenMax.min.js"></script>
<script src="resources/boot_library/plugins/greensock/TimelineMax.min.js"></script>
<script src="resources/boot_library/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="resources/boot_library/plugins/greensock/animation.gsap.min.js"></script>
<script src="resources/boot_library/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="resources/boot_library/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resources/boot_library/plugins/scrollTo/jquery.scrollTo.min.js"></script>
<script src="resources/boot_library/plugins/easing/easing.js"></script>
<script src="resources/boot_library/js/custom.js"></script>
