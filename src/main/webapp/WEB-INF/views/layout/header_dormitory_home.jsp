<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../setting.jsp" %>  
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



<script type="text/javascript">
 function penalty(){
	 window.open
 }


</script>

<c:if test="${sessionScope.name != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>

<c:if test="${fn:substring(sessionScope.id,0,1) != null}">		<!-- 비회원일 시 -->	
	<c:set var="admin" value="${sessionScope.id.substring(0,1)}"/>	
</c:if>			

	<header class="header d-flex flex-row" style="background:#fff;">
		<div class="header_content d-flex flex-row align-items-center">
			<!-- Logo -->
			<div class="logo_container">
				<div class="logo">
					<a href="dormitory"><img src="resources/images/common_img/logo/ARA_white_red.PNG" width="50px"></a>
					<span style="padding-left:15px;"><a href="dormitory"><img src="resources/images/common_img/logo/ARA_full_white.PNG" alt="" height="35px"></a></span>
				</div>
			</div>

			<!-- Main Navigation -->
			<nav class="main_nav_container">
				<div class="main_nav">
					<ul class="main_nav_list" >

					<c:if test="${admin == 1}">	
						<script>
							alert("교수님은 이용 불가입니다");
						</script>
					</c:if>


					<c:if test="${admin != 0 || sessionScope.id == null}">		<!-- 비회원일 시 -->
					<input type="hidden" value="${id}" name="id">																										
						<li class="main_nav_item">
							<a href="dormitory_reference?id=${id}" style="color:#001E42;">정보 조회</a>							
						</li>
						
						<li class="main_nav_item">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:#001E42;" aria-haspopup="true" aria-expanded="false">
							외박 신청
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><center><a href="dormitory_stu_overnight_insert">외박 신청</a></center></li>
								<li><center><a href="dormitoty_stu_overnight_select?id=${id}">신청 결과 조회</a></center></li>
							</ul>
						</li>
										
								<li class="main_nav_item">
									<a href="dt_stu_penalty_sel?id=${id}" style="color:#001E42;" onclick="return penalty();">벌점 조회</a>							
								</li>

								<li class="main_nav_item">
									<a href="dt_stu_notice_sel" style="color:#001E42;">공지 사항</a>							
								</li>
																	
								<li class="main_nav_item">
									<c:if test="${sessionScope.id == null }">
										<li class="main_nav_item">
											<a href="loginPage" style="color:#001E42;">로그인</a>							
										</li>
									</c:if>

									<c:if test="${sessionScope.id != null }">
										<a href="#" style="color:#001E42;" class="dropdown-toggle" data-toggle="dropdown" 
											role="button" aria-haspopup="true" aria-expanded="false">
											${sessionScope.name}<span class="caret"></span>
										</a>
									
									<ul class="dropdown-menu">																		
										<li><center><a href="logout">로그아웃</a></center></li>
									</ul>										
									</c:if>																	
								</li>							
							</c:if>
																																					
							<c:if test="${admin == 0}"> <!-- 관리자일 경우 -->																					
								<li class="main_nav_item">
									<a href="dormitory_admin_penalty" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:#001E42;" aria-haspopup="true" aria-expanded="false">
									학생 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitoty_stu_select">학생 현황</a></center></li>
										<li><center><a href="dormitoty_stu_insert">학생 등록</a></center></li>										
									</ul>
								</li>
								
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:#001E42;" aria-haspopup="true" aria-expanded="false">
									외박 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dt_admin_overnight">외박 신청 승인</a></center></li>
										<li><center><a href="dt_admin_overnight_sel">신청 결과 조회</a></center></li>
									</ul>
								</li>
												
								<li class="main_nav_item">
									<a href="dormitory_admin_penalty" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:#001E42;" aria-haspopup="true" aria-expanded="false">
									벌점 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitory_admin_penalty">벌점 현황</a></center></li>
										<li><center><a href="dt_admin_penalty_ins">벌점 등록</a></center></li>									
									</ul>
								</li>
		
								<li class="main_nav_item">
									<a href="dt_admin_notice_sel" style="color:#001E42;">공지 사항</a>							
								</li>
																	
								<li class="main_nav_item">
									<a href="#" style="color:#001E42;" class="dropdown-toggle" data-toggle="dropdown" 
										role="button" aria-haspopup="true" aria-expanded="false">
										${sessionScope.name}<span class="caret"></span>
									</a>
								
									<ul class="dropdown-menu">
										<li><center><a href="#">관리자 페이지</a></center></li>									
										<li><center><a href="logout">로그아웃</a></center></li>
									</ul>
								</li>
							</c:if>		
									
									 <%-- <c:otherwise><!-- 학생/교수일 경우 -->
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
												<li><center><a href="lib_rental">도서 대여</a></center></li>
												<li><center><a href="lib_reservation">도서 예약</a></center></li>
												<li><center><a href="lib_submission">희망도서 신청</a></center></li>
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
									</c:otherwise> --%>
								
								
								

						
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
