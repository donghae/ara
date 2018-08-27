<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/box_mon.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/font_common.css">
<link rel="stylesheet" href="resources/css/footer_ara.css">
<link rel="stylesheet" href="resources/css/form-basic.css">
<link rel="stylesheet" href="resources/css/header_ara.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">

</head>



<body onload="focus(${major});">
<script type="text/javascript">
	function locate(){
		window.location = 'st_adm?st_state=1&major='+ loca.value;
	}
	function focus(major){
		loca.value=major;
	}
</script>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
					<div style="width: 30%; float: left;">
						<br> <br>
						<h1>학생 관리</h1>
						<br> <br>
					</div>
					<div style="width: 30%; float: right; z-index: 3;">
						<br> <br> <select id="loca" class="input" name="major">
							<option value="101">기계공학</option>
							<option value="102">소프트웨어공학</option>
							<option value="103">식품공학</option>
							<option value="104">전기공학</option>
							<option value="105">화학</option>

							<option value="201">물리학</option>
							<option value="202">미생물학</option>
							<option value="203">분자생물학</option>
							<option value="204">생명과학</option>
							<option value="205">화학</option>

							<option value="301">경영학</option>
							<option value="302">경제학</option>
							<option value="303">심리학</option>
							<option value="304">정치외교학</option>
							<option value="305">행적학</option>

							<option value="401">도예</option>
							<option value="402">무용</option>
							<option value="403">문예창작</option>
							<option value="404">실용음악</option>
							<option value="405">조소</option>

							<option value="501">국어국문학</option>
							<option value="502">사학</option>
							<option value="503">영어영문학</option>
							<option value="504">철학</option>
							<option value="505">포르투갈어</option>

							<option value="601">국제스포츠학</option>
							<option value="602">생활체육학</option>
							<option value="603">스포츠경영학</option>
							<option value="604">스포츠응용산업학</option>
							<option value="605">체육교육학</option>
						</select> <input class="btn_navy" type="button" value="조회"
							onclick="locate();">
					</div>
				</div>

				<div class="inbox-body">
					<div class="mail-option">
						<table class="st_mint" style="width: 1300px;">
							<tr>
								<th>학번</th>
								<th>전공명</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>상태</th>
							</tr>
							<c:if test="${cnt>0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td style="width: 10%">${dto.st_no}</td>
										<td style="width: 10%"><c:if
												test="${dto.getMaj_cd() == 101}">기계공학과</c:if> <c:if
												test="${dto.getMaj_cd() == 102}">소프트웨어공학과</c:if> <c:if
												test="${dto.getMaj_cd() == 103}">식품공학과</c:if> <c:if
												test="${dto.getMaj_cd() == 104}">전기공학과</c:if> <c:if
												test="${dto.getMaj_cd() == 105}">화학공학과</c:if> <c:if
												test="${dto.getMaj_cd() == 201}">물리학과</c:if> <c:if
												test="${dto.getMaj_cd() == 202}">미생물학과</c:if> <c:if
												test="${dto.getMaj_cd() == 203}">분자생물학과</c:if> <c:if
												test="${dto.getMaj_cd() == 204}">생명과학과</c:if> <c:if
												test="${dto.getMaj_cd() == 205}">화학과</c:if> <c:if
												test="${dto.getMaj_cd() == 301}">경영학과</c:if> <c:if
												test="${dto.getMaj_cd() == 302}">경제학과</c:if> <c:if
												test="${dto.getMaj_cd() == 303}">심리학과</c:if> <c:if
												test="${dto.getMaj_cd() == 304}">정치외교학과</c:if> <c:if
												test="${dto.getMaj_cd() == 305}">행정학과</c:if> <c:if
												test="${dto.getMaj_cd() == 401}">도예과</c:if> <c:if
												test="${dto.getMaj_cd() == 402}">무용과</c:if> <c:if
												test="${dto.getMaj_cd() == 403}">문예창작과</c:if> <c:if
												test="${dto.getMaj_cd() == 404}">실용음악과</c:if> <c:if
												test="${dto.getMaj_cd() == 405}">조소과</c:if> <c:if
												test="${dto.getMaj_cd() == 501}">국어국문학과</c:if> <c:if
												test="${dto.getMaj_cd() == 502}">사학과</c:if> <c:if
												test="${dto.getMaj_cd() == 503}">영어영문학과</c:if> <c:if
												test="${dto.getMaj_cd() == 504}">철학과</c:if> <c:if
												test="${dto.getMaj_cd() == 505}">포르투갈어과</c:if> <c:if
												test="${dto.getMaj_cd() == 601}">국제스포츠학과</c:if> <c:if
												test="${dto.getMaj_cd() == 602}">생활체육학과</c:if> <c:if
												test="${dto.getMaj_cd() == 603}">스포츠경영학과</c:if> <c:if
												test="${dto.getMaj_cd() == 604}">스포츠응용산업학과</c:if> <c:if
												test="${dto.getMaj_cd() == 605}">체육교육학</c:if></td>
										<td style="width: 5%">${dto.st_name}</td>
										<td style="width: 10%">${dto.st_hp}</td>
										<td style="width: 30%">${dto.st_zipcode}${dto.st_addr1}
											${dto.st_addr2}</td>

										<c:if test="${dto.st_abs_fl==0}">
											<td style="width: 5%">재학</td>
										</c:if>
										<c:if test="${dto.st_abs_fl==1}">
											<td style="width: 5%; color: red;">휴학</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${cnt==0}">
								<tr>
									<td colspan="6" align="center">학생이 없습니다.</td>
								</tr>
							</c:if>

						</table>

					</div>
				</div>
				</aside>
			</div>
		</div>
	</div>
</body>
</html>
