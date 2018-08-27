<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<style>
.button {
	background-color: #001E42;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	cursor: pointer;
}

.pfBtn {
	width: 20px;
	border-radius: 12px;
	margin-left: 800px;
}

table {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-left: 400px;
	margin-top: 100px;
}

th, td {
	border: 1px solid gray;
	padding: 10px;
	color: black;
}

th {
	border: 1px solid gray;
	padding: 10px;
	color: black;
	text-align: center;
}

.applicantCheck_header {
	background-color: #001E42;
}

.applicantCheck_mid {
	color: #001E42;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

input[type=text] {
	border: 1px solid gray;
	border-radius: 4px;
}
</style>

<body>

	<jsp:include page="../../layout/header_ara.jsp" />

	<div style="width: 900px;">



		<div class="container" style="margin-left: 100px;">

			<div class="mail-box" style="height: 700px;">

				<link
					href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
					rel="stylesheet" id="bootstrap-css">

				<div class="main-wrap">

					<table class="table table-striped">

						<thead>

							<tr>

								<th data-sort="name"
									style="background-color: #001E42; color: white; text-align: center;">합격자
									조회</th>

							</tr>

						</thead>

						<tbody>

							<tr>

								<td style="text-align: center;">축하합니다. ${name}님</td>

							</tr>

							<tr>

								<td style="text-align: center;">2018학년도 1학기 <c:if
										test="${major == 101}">기계공학</c:if> <c:if
										test="${major == 102}">소프트웨어공학</c:if> <c:if
										test="${major == 103}">식품공학</c:if> <c:if
										test="${major == 104}">전기공학</c:if> <c:if
										test="${major == 105}">화학공학</c:if> <c:if
										test="${major == 201}">물리학</c:if> <c:if test="${major == 202}">미생물학</c:if>
									<c:if test="${major == 203}">분자생물학</c:if> <c:if
										test="${major == 204}">생명과학</c:if> <c:if
										test="${major == 205}">화학</c:if> <c:if test="${major == 301}">경영학</c:if>
									<c:if test="${major == 302}">경제학</c:if> <c:if
										test="${major == 303}">심리학</c:if> <c:if test="${major == 304}">정치외교학</c:if>
									<c:if test="${major == 305}">행정학</c:if> <c:if
										test="${major == 401}">도예</c:if> <c:if test="${major == 402}">무용</c:if>
									<c:if test="${major == 403}">문예창작</c:if> <c:if
										test="${major == 404}">실용음악</c:if> <c:if
										test="${major == 405}">조소</c:if> <c:if test="${major == 501}">국어국문학</c:if>
									<c:if test="${major == 502}">사학</c:if> <c:if
										test="${major == 503}">영어영문학</c:if> <c:if
										test="${major == 504}">철학</c:if> <c:if test="${major == 505}">포르투갈어</c:if>
									<c:if test="${major == 601}">국제스포츠학</c:if> <c:if
										test="${major == 602}">생활체육학</c:if> <c:if
										test="${major == 603}">스포츠경영학</c:if> <c:if
										test="${major == 604}">스포츠응용산업학</c:if> <c:if
										test="${major == 605}">체육교육학</c:if>과에 합격하셨습니다.

								</td>
							</tr>
							<tr>
								<td style="text-align: center;">학번 : ${st_no}	비밀번호 : ${st_no}</td>
							</tr>
					</table>

				</div>

			</div>

		</div>

	</div>

	<footer>

		<%@ include file="../../layout/footer_ara.jsp"%>

	</footer>

</body>

</html>
