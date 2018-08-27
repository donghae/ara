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
	height: 70px;
	min-width: 150px;
}

.st_navy td {
	text-align: center;
	height: 70px;
	min-width: 150px;
}
</style>
<script type="text/javascript">
	/* 출석입력 */
	function attendList(str) {
		var param = str.split("|");
		var st_no = param[0];
		var dto3 = param[1];
		window.location = 'st_pro?st_state=52&lec_name=${lec_name}&st_no='
				+ st_no + '&dto3=' + dto3;
	}
	/* 성적입력 */
	function inputGrade(str) {
		var param = str.split("|");
		var maj_cd = param[0];
		var st_name = param[1];
		var st_no = param[2];
		window.location = 'st_pro?st_state=53&lec_name=${lec_name}&maj_cd='
				+ maj_cd + '&st_name=' + st_name + '&st_no=' + st_no;
	}
</script>
</head>
<body>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<div style="width: 60%; float: left;">
							<br>
							<br>
							<h1>강의명 : ${lec_name}</h1>
							<input type="hidden" value="${lec_name}" name="lec_name">
						</div>
						<div style="width: 40%; margin-left: 600px;">
							<br>
							<br>
							<br>
							<br>
							<br>
							<h3>수업관리 > 시간표 > 학생목록</h3>
						</div>
					</div>
				</aside>
				<input type="hidden" value="${dto3}" name="dto3">
				<div class="inbox-body">
					<div class="mail-option">
						<table class="st_navy">
							<thead>
								<tr>
									<th>번호</th>
									<th>학번</th>
									<th>전공</th>
									<th>이름</th>
									<th>최종 성적</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${cnt>0}">
								<c:set var="rnum" value="1" />
								<c:forEach var="dto" items="${dtos}">
									<input type="hidden" value="${dto.st_no}" name="st_no">
									<input type="hidden" value="${dto.maj_cd}" name="maj_cd">

									<tr>
										<td>${rnum}</td>
										<td>${dto.st_no}<input type="hidden" value="${dto.st_no}"
											name="st_no"></td>

										<td><c:if test="${dto.maj_cd == 101}">기계공학</c:if> <c:if
												test="${dto.maj_cd == 102}">소프트웨어공학</c:if> <c:if
												test="${dto.maj_cd == 103}">식품공학</c:if> <c:if
												test="${dto.maj_cd == 104}">전기공학</c:if> <c:if
												test="${dto.maj_cd == 105}">화학공학</c:if> <c:if
												test="${dto.maj_cd == 201}">물리학</c:if> <c:if
												test="${dto.maj_cd == 202}">미생물학</c:if> <c:if
												test="${dto.maj_cd == 203}">분자생물학</c:if> <c:if
												test="${dto.maj_cd == 204}">생명과학</c:if> <c:if
												test="${dto.maj_cd == 205}">화학</c:if> <c:if
												test="${dto.maj_cd == 301}">경영학</c:if> <c:if
												test="${dto.maj_cd == 302}">경제학</c:if> <c:if
												test="${dto.maj_cd == 303}">심리학</c:if> <c:if
												test="${dto.maj_cd == 304}">정치외교학</c:if> <c:if
												test="${dto.maj_cd == 305}">행정학</c:if> <c:if
												test="${dto.maj_cd == 401}">도예</c:if> <c:if
												test="${dto.maj_cd == 402}">무용</c:if> <c:if
												test="${dto.maj_cd == 403}">문예창작</c:if> <c:if
												test="${dto.maj_cd == 404}">실용음악</c:if> <c:if
												test="${dto.maj_cd == 405}">조소</c:if> <c:if
												test="${dto.maj_cd == 501}">국어국문학</c:if> <c:if
												test="${dto.maj_cd == 502}">사학</c:if> <c:if
												test="${dto.maj_cd == 503}">영어영문학</c:if> <c:if
												test="${dto.maj_cd == 504}">철학</c:if> <c:if
												test="${dto.maj_cd == 505}">포르투갈어</c:if> <c:if
												test="${dto.maj_cd == 601}">국제스포츠학</c:if> <c:if
												test="${dto.maj_cd == 602}">생활체육학</c:if> <c:if
												test="${dto.maj_cd == 603}">스포츠경영학</c:if> <c:if
												test="${dto.maj_cd == 604}">스포츠응용산업학</c:if> <c:if
												test="${dto.maj_cd == 605}">체육교육학</c:if></td>

										<td>${dto.st_name}</td>

										<td><c:if test="${dto.gpa >=0 && dto.gpa <= 4.5}">${dto.gpa}</c:if>
											<c:if test="${dto.gpa < 0 && dto.gpa > 4.5}">0</c:if></td>
												
								<c:set var="dto3" value="${dto3}"/>
								

										<td><input class="btn_navy" type="button" value="성적"
											style="text-align: center; color:white;"
											onclick="javascript:inputGrade('${dto.maj_cd}|${dto.st_name}|${dto.st_no}');">
											<input class="btn_navy" type="button" value="출결"
											style="text-align: center;color:white;"
											onclick="javascript:attendList('${dto.st_no}|${dto3}');"></td>
									</tr>
									<c:set var="rnum" value="${rnum+1}" />
								</c:forEach>
								</c:if>
								<c:if test="${cnt==0}">
									<tr>
										<td>
											학생이 없습니다.
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>