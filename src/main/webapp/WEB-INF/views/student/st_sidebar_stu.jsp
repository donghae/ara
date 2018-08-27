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
         <div class="collapse navbar-collapse" id="sideNavbar"style="margin-left: 250%;">
            <div class="panel-group" id="accordion">
               <div class="panel panel-defaul">
                  <div class="panel-heading">
                     <h4 class="panel-title">
                         <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">학적 관리<span class="caret"></span></a>
                     </h4>
                  </div>
                  <!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
                  <c:choose>
						<c:when test="${st_state==10}">
							<div id="collapseOne" class="panel-collapse collapse in"> 
						</c:when>
						<c:otherwise>
							<div id="collapseOne" class="panel-collapse collapse">
						</c:otherwise>
					</c:choose>
                     <ul class="list-group">
                        <li><a href="st_stu?st_state=10" class="navlink">기본학적(신상정보변경)</a></li>
                     </ul>
                  </div>
               </div>
               <div class="panel panel-defaul">
                  <div class="panel-heading">
                     <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo">수업 관리<span class="caret"></span></a>
                     </h4>
                  </div>
                 <c:choose>
					<c:when test="${st_state==21 || st_state==11 || st_state==12 || st_state==13 || st_state==14}">
						<div id="collapseTwo" class="panel-collapse collapse in" >
					</c:when>
					<c:otherwise>
						<div id="collapseTwo" class="panel-collapse collapse"> 
					</c:otherwise>
				</c:choose>
                     <ul class="list-group">
                        <li><a href="st_stu?st_state=21" class="navlink">시간표</a></li>
                        <li><a href="st_stu?st_state=11" class="navlink">내 강의실</a></li>
                        <li><a href="st_stu?st_state=12" class="navlink">수강 신청</a></li>
                        <li><a href="st_stu?st_state=13&lec_day_dt=X&lec_name=X" class="navlink">수강 계획 도우미</a></li>
                        <li><a href="st_stu?st_state=14" class="navlink">강의 시간표(전체용)</a></li>
                     </ul>
                  </div>
               </div>
               <div class="panel panel-defaul">
                  <div class="panel-heading">
                     <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree">성적 관리<span
                           class="caret"></span></a>
                     </h4>
                  </div>
                  <c:choose>
					<c:when test="${st_state==15}">
						<div id="collapseThree" class="panel-collapse collapse in">
					</c:when>
					<c:otherwise>
						<div id="collapseThree" class="panel-collapse collapse">
					</c:otherwise>
					</c:choose>
                     <ul class="list-group">
                        <li><a href="st_stu?st_state=15&semester='2018-1'" class="navlink">성적 조회</a></li>
                     </ul>
                  </div>
               </div>

               <div class="panel panel-defaul">
                  <div class="panel-heading">
                     <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFour">장학금 관리<span class="caret"></span></a>
                     </h4>
                  </div>
                  <c:choose>
					<c:when test="${st_state==16}">
						<div id="collapseFour" class="panel-collapse collapse in">
					</c:when>
					<c:otherwise>
						<div id="collapseFour" class="panel-collapse collapse">
					</c:otherwise>
					</c:choose>
                     <ul class="list-group">
                        <li><a href="st_stu?st_state=16" class="navlink">장학금 수여 내역 조회</a></li>
                     </ul>
                  </div>
               </div>

               <div class="panel panel-defaul">
                  <div class="panel-heading">
                     <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseFive">등록금 관리<span class="caret"></span></a>
                     </h4>
                  </div>
                  <c:choose>
					<c:when test="${st_state==18}">
						<div id="collapseFive" class="panel-collapse collapse in">
					</c:when>
					<c:otherwise>
						<div id="collapseFive" class="panel-collapse collapse">
					</c:otherwise>
					</c:choose>
                     <ul class="list-group">
                        <li><a href="st_stu?st_state=18" class="navlink">등록금 납부 조회</a></li>
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