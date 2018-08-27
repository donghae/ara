<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.st_navy th {
	    text-align:center;
	    height:80px;
	    min-width:180px;
	}
	.st_navy td {
	    text-align:center;
	    height:80px;
	    min-width:180px;
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
							<h1>시간표</h1>
						</div>
						<div style="width: 30%; margin-left:890px;">
							<br><br><br><br><br>
							<h3> 수업관리 > 시간표</h3>
						</div>
					</div>
				</aside>			

				<!-- <div class="inbox-body" style="width: 1300px; height: 1000px; margin-left:0%;"> -->							
				<div class="inbox-body">	
					<div class="mail-option">
						<table class="st_navy">
							<thead>								
								<tr>
									<th></th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="0" end="13">
									<tr>
										<td>
											${i+1}교시(${i+9}:00)
										</td>
										<c:forEach var="j" begin="0" end="4">
											<td>${timeTable[j][i+1]}
												<br>
												<c:set var="ho" value="${fn:substring(lecRoom[j][i+1],2,5)}호" />
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 1}">
													공학대학 ${ho}
												</c:if>
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 2}">
													과학대학 ${ho}
												</c:if>
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 3}">
													사회대학 ${ho}
												</c:if>
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 4}">
													예술대학 ${ho}
												</c:if>
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 5}">
													인문대학 ${ho}
												</c:if>
												<c:if test="${fn:substring(lecRoom[j][i+1],0,1) == 6}">
													체육대학 ${ho}
												</c:if>
											</td>
										</c:forEach>
									</tr>
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