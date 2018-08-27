<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	table.table_student {
		border:1px solid black;
		text-align:center;
		width:300px;
		margin-left:500px;
	}
	.table_student th, td {
	    text-align:center;
	}
	.st_navy th {
	    text-align:center;		
	}
	.st_navy {
		border:1px solid black;
		text-align:center;
		width:700px;
	}
	.st_navy td {
	    text-align:center;
	}
	.btn_navy {
		float:right;
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
							<h1>장학금 조회</h1>
							<br>
						</div>
					</div>
				</aside>			

				<div class="inbox-body">	
					<div class="mail-option">
						<table class="st_navy" style="    margin-left: 0px;">
							<thead>
								<tr>
									<th>학기</th>
									<th>학년</th>
									<th>성적</th>
									<th>등수</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>	
							<c:if test ="${cnt>0}">
								<c:set var ="i" value="1" />
								<c:set var ="j" value="0" />
								<c:forEach var = "dto" items="${dtos}">
										<tr>
											<td>${dto.gpa_semester}</td>
											<td>${i}학년</td>
											<td>${dto.gpa_total}</td>
											<td>${dto.rnum}/${total}</td>
											<c:if test ="${dto.rnum==1}">
												<td>전액(100%)</td>
											</c:if>
											<c:if test ="${dto.rnum==2}">
												<td>반액(60%)</td>
											</c:if>
											<c:if test ="${dto.rnum>=3}">
												<td>해당사항없음</td>
											</c:if>
										</tr>		
									<c:if test="${j==1}">
										<c:set var="i" value="${i+1}" />
										<c:set var="j" value="0" />
									</c:if>
									<c:if test="${j==0}">
										<c:set var="j" value="1" />
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="5">해당사항이 없습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
						<br><br><br><br><br>
						<form>
                        	<fieldset>
                        		<legend style="color:red;">안내</legend>
                        		<ul>
                        			<li>장학금은 성적순으로 차등 지급됩니다.</li>
                        			<li>1등 : 전액장학금(100%)</li>
                        			<li>2등 : 장학금(60%)</li>
                        		</ul>
                        	</fieldset>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>