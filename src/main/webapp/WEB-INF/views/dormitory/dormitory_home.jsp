<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>



<style>
	.home{
		position: absolute;
	}
	
	.footer{
		position: relative;
		top:550px;
		align-content: center;
		text-align: center;
	}
	.col-lg-2{
		margin-left:30px;
	}

</style>

<c:if test="${sessionScope.id != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>

<c:if test="${sessionScope.id == null || fn:substring(sessionScope.id,0,1) != 0}">
<%@include file="../layout/header_dormitory_home.jsp" %> 
<!-- 본문 : 기숙사 홈 -->
<section>
<input type="hidden" value="${id}" name="id">
<div class="super_container" style="overflow: hidden; height:84%;">

	<!-- Home -->
	<div class="home">

		<!-- 사진 슬라이드 -->
		<div class="hero_slider_container">		
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/images/common_img/UNI/dormitory.jpg);">										
					</div>					
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">																	
						<div class="hero_slide_content text-center">																
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">		
		<div class="container">
			<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 hero_box_col">
						<a href="dormitory_reference?st_no=${id}" >
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/book_search.png" class="svg"  id="info">
							<div class="hero_box_content">
								<h2 class="hero_box_title">정보</h2>
								<h2 class="hero_box_title">조회</h2>
							</div>
						</div>	
						</a>					
					</div>
									
					<div class="col-lg-2 hero_box_col">
						<a href="dormitory_stu_overnight_insert">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/books.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">외박</h2>
								<h2 class="hero_box_title">신청</h2>
							</div>
						</div>
						</a>
					</div>
						
					 <div class="col-lg-2 hero_box_col">
						<a href="dormitoty_stu_overnight_select?st_no=${id}">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/chat.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">외박</h2>
								<h2 class="hero_box_title">신청</h2>
								<h2 class="hero_box_title">조회</h2>
							</div>
						</div>
						</a>
					</div>
																	
					<div class="col-lg-2 hero_box_col">
						<a href="dt_stu_penalty_sel?st_no=${id}">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start" >
							<img src="resources/images/common_img/icons/lamp.png" class="svg" >
							<div class="hero_box_content">
								<h2 class="hero_box_title">벌점</h2>
								<h2 class="hero_box_title">조회</h2>
							</div>
						</div>
						</a>
					</div>											
															
					<div class="col-lg-2 hero_box_col">
						<a href="dt_stu_notice_sel" >
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/library.png" class="svg" >
							<div class="hero_box_content">
								<h2 class="hero_box_title">공지</h2>
								<h2 class="hero_box_title">사항</h2>
							</div>
						</div>
						</a>
					</div>
										
				</div>
			</div>
		</div>
	</div>
	</div>

</footer>	
	
</div>	
</section>		
	
<!-- 푸터 -->
<%@include file="../layout/footer_lib2.jsp" %>		
</c:if>

<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">

<%@include file="../layout/header_dormitory_home.jsp" %> 	
<!-- 본문 : 관리자  홈 -->
<section>
<div class="super_container" style="overflow: hidden; height:84%;">

	<!-- Home -->
	<div class="home">

		<!-- 사진 슬라이드 -->
		<div class="hero_slider_container">		
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/images/common_img/UNI/dormitory.jpg);">										
					</div>					
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">																	
						<div class="hero_slide_content text-center">																
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">		
		<div class="container">
			<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">
					
					<div class="col-lg-2 hero_box_col">
						<a href="dormitoty_stu_select">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/book_search.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">학생</h2>
								<h2 class="hero_box_title">관리</h2>
							</div>
						</div>	
						</a>					
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
					<div class="col-lg-2 hero_box_col">
						<a href="dt_admin_overnight">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/books.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">외박</h2>
								<h2 class="hero_box_title">관리</h2>
							</div>
						</div>
						</a>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												
					<div class="col-lg-2 hero_box_col">
						<a href="dormitory_admin_penalty">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/lamp.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">벌점</h2>
								<h2 class="hero_box_title">관리</h2>
							</div>
						</div>
						</a>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;										
															
					<div class="col-lg-2 hero_box_col">
						<a href="dt_admin_notice_sel">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/library.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">공지</h2>
								<h2 class="hero_box_title">사항</h2>
								<h2 class="hero_box_title">관리</h2>
							</div>
						</div>
						</a>
					</div>
															
					<!-- <div class="col-lg-2 hero_box_col">
						<a href="#">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/chat.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">식단</h2>
								<h2 class="hero_box_title">관리</h2>
							</div>
						</div>
						</a>
					</div> -->
										
				</div>
			</div>
		</div>
	</div>
	</div>

</footer>	
	
</div>	
</section>		
	
<!-- 푸터 -->
<%@include file="../layout/footer_lib2.jsp" %>		
</c:if>
