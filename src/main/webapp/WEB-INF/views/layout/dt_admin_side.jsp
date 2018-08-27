<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %> 	

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/boot_student/sidebar.css">
<style>
	.sidebar{
		position: relative;
		left:-200px;
		top:-100px;
	}
</style>
<body>
<c:if test="${sessionScope.name != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>
	<div style="float: left; margin-top:38px;" class="sidebar" >
	<c:if test="${fn:substring(sessionScope.id,0,1) == 0 }">
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3" >
		<input type="hidden" value="${id}" name="id">
			<div id="sidenav1">
 				<div class="navbar-header">
				</div>			
				<div class="collapse navbar-collapse" id="sideNavbar">
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">						
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									공지 사항
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dt_admin_notice_write">공지사항 등록</a></center></li>
										<li><center><a href="dt_admin_notice_sel">공지사항 조회</a></center></li>
									</ul>
								</li>							
						</div>
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									학생 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitoty_stu_select">학생 정보</a></center></li>
										<li><center><a href="dormitoty_stu_insert">학생 등록</a></center></li>
									</ul>
								</li>														
							</div>							
						</div>
						
						<div class="panel panel-defaul">						
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="dormitory_admin_penalty" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									벌점 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitory_admin_penalty">벌점 현황</a></center></li>
										<li><center><a href="dt_admin_penalty_ins">벌점 등록</a></center></li>
									</ul>
								</li>							
							</div>
						</div>	
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									외박 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dt_admin_overnight">외박 신청 승인</a></center></li>
										<li><center><a href="dt_admin_overnight_sel">외박 승인 조회</a></center></li>
									</ul>
								</li>								
							</div>
						</div>										
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<!-- 관리자가 아닌 side 메뉴 -->
	<c:if test="${fn:substring(sessionScope.id,0,1) != 0 }">
	<input type="hidden" value="${id}" name="id">
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3" >
			<div id="sidenav1">
 				<div class="navbar-header">
				</div>			
				<div class="collapse navbar-collapse" id="sideNavbar">
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">						
								<li class="main_nav_item">
									<a href="dt_stu_notice_sel"  style="color:white; font-weight:500;" >
									공지 사항
									</a>
								</li>							
							</div>
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="dt_stu_overnight_insert" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									외박신청
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitory_stu_overnight_insert">외박 신청</a></center></li>
										<li><center><a href="dormitoty_stu_overnight_select?id=${id}">신청 결과 조회</a></center></li>
									</ul>
								</li>														
							</div>							
						</div>
						
						<div class="panel panel-defaul">						
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="dt_stu_penalty_sel?id=${id}"  style="color:white; font-weight:500;" >
									벌점 조회
										<span class="caret"></span>
									</a>

								</li>							
							</div>
						</div>	
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="dormitory_reference?id=${id}" style="color:white; font-weight:500;" >
									정보 조회 
										<span class="caret"></span>
									</a>

								</li>								
							</div>
						</div>										
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>	
 </div>
</body>
</html>