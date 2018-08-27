<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  


<body>
<!-- 헤더 -->
<%@include file="../../layout/header_lib_home.jsp" %>


<!-- 본문 : 도서관 홈 -->
<section>
<div class="super_container" style="overflow: hidden; height:84%;">

	<!-- Home -->
	<div class="home">

		<!-- 사진 슬라이드 -->
		<div class="hero_slider_container">
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
						
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
					</div>
				</div>

			</div>

			<div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200">prev</span></div>
			<div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">next</span></div>
		</div>
		
	</div>
</div>	
</section>	
	
<!-- 푸터 -->
<%@include file="../../layout/footer_ara.jsp" %>		
</body>