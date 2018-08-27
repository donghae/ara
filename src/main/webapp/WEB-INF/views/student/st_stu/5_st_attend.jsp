<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.st_navy th {
	text-align: center;
	width: 60px;
}

.st_navy td {
	text-align: center;
	width: 60px;
}
</style>
</head>
<body>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br> <br>
							<h1>출결현황</h1>
						</div>
						<div style="width: 30%; margin-left:620px;">
							<br> <br> <br> <br> <br>
							<h3>강의별 출결현황</h3>
						</div>
					</div>
				</aside>

				<div class="inbox-body">
					<div class="mail-option">
						<br> <br>
						<table class="st_navy" style="text-align: center;">
							<thead>
								<tr>
									<th>순번</th>
									<th>수업일자</th>
									<th style="width:45%">강의명 / 강의실</th>
									<th>출석여부</th>
								</tr>
							</thead>

							<tbody>
							<c:set var="i" value="0"/>
								<c:forEach var="dtos2" items="${dtos2}">
									
										<tr>
											<td>${i+1}주차</td>
											<c:set var="dto3" value="${dto3}" />

											<fmt:parseDate var="startDate" value="${dto3}"
												pattern="yy-MM-dd" />
											<jsp:useBean id="myDate" class="java.util.Date" />
											<c:set target="${myDate}" property="time"
												value="${startDate.time + (((1000*60*60*24)*7)*(i))}" />
											<fmt:formatDate var="lec_date" value="${myDate}"
												pattern="yy-MM-dd" />
											<td>${lec_date}</td>

											<td>${lec_name}/ ${dtos2.lec_room_no}호</td>

											<td><c:choose>
													<c:when test="${dtos2.attend_fl == 0}">결석(Ⅹ)</c:when>
													<c:when test="${dtos2.attend_fl == 1}">출석(○)</c:when>
													<c:when test="${dtos2.attend_fl == 2}">지각(△)</c:when>
												</c:choose></td>
										</tr>
									<c:set var="i" value="${i+1}"/>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>