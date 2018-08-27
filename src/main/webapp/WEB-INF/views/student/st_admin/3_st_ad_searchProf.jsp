<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function search() {
		window.location = 'searchProf?prof_name=' + prof_name.value+ '&maj_cd=' + maj_cd.value;
	}
	function setProf(prof_no,prof_name) {
		opener.document.myForm.prof_no.value=prof_no;
		opener.document.myForm.prof_name.value=prof_name;
		self.close();
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<body>
	<form action="searchProf" method="post" name="myForm" onsubmit="return setProf();">
		<div style="width: 900px; float: left;">
			<div class="container" style="margin-left: 100px;">
				<div class="mail-box">
					<aside class="lg-side">
					<div class="inbox-body">
						<div class="mail-option">
							<table class="st_mint"
								style="width: 1300px; margin-left: 0px; margin-right: 0px;"
								align="center">
								<tr>
									<th><select id="maj_cd" class="input" name="maj_cd">
											<option value="">전공을 선택하세요.</option>
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
									</select></th>
									<th><input type="text" id="prof_name" name="prof_name"placeholder="교수명을 입력하세요."></th>
									<th><input style="width: 100px; height: 50px;"
										class="btn_navy" type="button" value="search"
										onclick="search();"></th>
									<th colspan="4"></th>
								</tr>
								<tr>
									<th style="width: 7%; text-align: center;">교수 번호</th>
									<th style="width: 7%; text-align: center;">이름</th>
									<th style="width: 10%; text-align: center;">전공명</th>
								</tr>
								<c:if test="${cnt>0}">
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td style="text-align: center" onclick="setProf('${dto.prof_no}','${dto.prof_name}');"><a href="" style="text-decoration:none;">${dto.prof_no}</a></td>
											<td style="text-align: center" onclick="setProf('${dto.prof_no}','${dto.prof_name}');"><a href="" style="text-decoration:none;">${dto.prof_name}</a></td>
											<td style="text-align: center" onclick="setProf('${dto.prof_no}','${dto.prof_name}');"><a href="" style="text-decoration:none;">${dto.maj_cd}</a></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${cnt==0}">
									<tr>
										<td colspan="6" align="center">해당하는 교수가 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
					</aside>
				</div>
			</div>
		</div>
	</form>
</body>