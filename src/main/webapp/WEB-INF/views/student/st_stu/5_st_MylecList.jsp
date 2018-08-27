<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<style type="text/css">
	.st_navy th {
	    text-align:center;		
	}
	.st_navy td {
	    text-align:center;		
	}
</style>
</head>
<body>
	<div style="width:900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br><br>
							<h1>내 강의실</h1>
						</div>
						<div style="width: 30%; margin-left:790px;">
							<br><br><br><br><br>
							<h3>수업관리 > 내 강의실</h3>			
						</div>
					</div>
				</aside>			

				<!-- <div class="inbox-body" style="width: 1300px; height: 1000px; margin-left:0%;"> -->							
				<div class="inbox-body">	
					<div class="mail-option">
						<table class="st_navy" style="width:1000px; text-align:center;">
							<thead>	
							<tr> 
								<th style="width:10%">번호</th>
								<th style="width:10%">강의번호</th>
								<th style="width:30%">강의명</th>
								<th style="width:10%">담당교수</th>
								<th style="width:10%">강의요일</th>
								<th style="width:20%">강의시각</th>
								<th style="width:10%">학점</th>
							</tr>
						</thead>
											
		<tbody>
		<c:if test="${cnt > 0}">
			<c:set var="i" value="0" />
			<c:forEach var="dto" items="${dtos}">
		
				<tr>
					<td>${i+1}</td>		
					<td>${dto.lec_no}</td>
					<td><a href="st_stu?st_state=19&lec_name=${dto.lec_name}">${dto.lec_name}</a></td>	
					<td>${dto.prof_name}</td>
					<td>${dto.lec_day_dt}</td>
					
					<td>
						${dto.lec_dt} : 00 ~ ${dto.lec_dt+dto.lec_point} : 00
					</td>
					
					<td>${dto.lec_point}</td>
				<c:set var="i" value="${i+1}" />	
				</tr>
			</c:forEach>
		</c:if>

		<c:if test="${cnt ==0}">
			<tr>
				<td colspan="7" align="center">
					강의가 없습니다.
				</td>
			</tr>
		</c:if>
		<p>* 각 강의의 출결은 해당 과목을 클릭해주세요.</p>
	</tbody>
						</table>
					</div><!-- mail-box -->
				</div><!-- container -->
			</div>
		</div>
	</div>
</body>
</html>