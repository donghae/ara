<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/sidebar.css">
<body>
	<div style="height: 700px; width: 400px; float: left;">
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3">
			<div id="sidenav1">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#sideNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="sideNavbar">
					 <div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne"><span class="glyphicon glyphicon-book">
									</span>학사 관리<span class="caret"></span></a>
								</h4>
							</div>
							<!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
							<c:choose>
								<c:when test="${st_state==1 || st_state==2 || st_state==3 || st_state==4}">
									<div id="collapseOne" class="panel-collapse collapse in"> 
								</c:when>
								<c:otherwise>
									<div id="collapseOne" class="panel-collapse collapse">
								</c:otherwise>
							</c:choose>
								<ul class="list-group">
									<li><a href="st_adm?st_state=1&major=101" class="navlink">학생 관리</a></li>
									<li><a href="st_adm?st_state=2" class="navlink">성적 관리</a></li>
								</ul>
							</div>
						</div> 
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseTwo"><span class="glyphicon glyphicon-cog">
									</span>입학 관리<span class="caret"></span></a>
								</h4>
							</div>
							<c:choose>
								<c:when test="${st_state==5 || st_state==6 || st_state==7}">
									<div id="collapseTwo" class="panel-collapse collapse in" >
								</c:when>
								<c:otherwise>
									<div id="collapseTwo" class="panel-collapse collapse"> 
								</c:otherwise>
							</c:choose>
							
								<ul class="list-group">
									<li><a href="st_adm?st_state=5&major=101" class="navlink">지원서 관리</a></li>
									<li><a href="st_adm?st_state=6&major=101" class="navlink">합격 관리</a></li>
									<li><a href="st_adm?st_state=7&major=101" class="navlink">예비 합격자 관리</a></li>
								</ul>
							</div>
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseThree">
										<span class="glyphicon glyphicon-calendar"> </span>강의 관리
										<span class="caret"></span>
									</a>
								</h4>
							</div>
							<c:choose>
								<c:when test="${st_state==8 || st_state==9 ||st_state==101}">
									<div id="collapseThree" class="panel-collapse collapse in">
								</c:when>
								<c:otherwise>
									<div id="collapseThree" class="panel-collapse collapse">
								</c:otherwise>
							</c:choose>
							
								<ul class="list-group">
									<li><a href="st_adm?st_state=8" class="navlink">강의 조회 및 수정</a></li>
									<li><a href="st_adm?st_state=9" class="navlink">강의 등록</a></li>
									<li><a href="st_adm?st_state=101" class="navlink">수강 신청 관리</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>