<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">
	function locate(){
		window.location = 'st_adm?st_state=5&major='+ loca.value;
	}
	function focus(major){
		loca.value=major;
	}
	function apply() {
		window.location = 'applicationPro?&major=' + loca.value+'&extra=1';
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<body onload="focus(${major});">

	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
					<div style="width: 30%; float: left;">
						<br> <br>
						<h1>지원서 관리</h1>
					</div>
					<div style="width: 30%; float: right;z-index:3;">
						<br> <br>
						<select id="loca" class="input" name="major">
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
						</select>
						<input class="btn_navy" type="button" value="조회" onclick="locate();">
					</div>
				</div>
				<div class="inbox-body">
					<div class="mail-option">
						<table class="st_mint"
							style="width: 1300px; margin-left: 0px; margin-right: 0px;"
							align="center">
							<tr>
								<th style="width: 7%; text-align: center;">신청 번호</th>
								<th style="width: 10%; text-align: center;">사진</th>
								<th style="width: 5%; text-align: center;">신청자</th>
								<th style="width: 7%; text-align: center;">지원학과</th>
								<th style="width: 5%; text-align: center;">성적</th>
								<th style="width: 7%; text-align: center;">주민번호</th>
								<th style="width: 7%; text-align: center;">출신학교</th>
								<th style="width: 5%; text-align: center;">연락처</th>
								<th style="width: 10%; text-align: center;">주소</th>
								<th style="width: 5%; text-align: center;">이메일</th>
								<th style="width: 7%; text-align: center;">장애여부</th>
							</tr>
							<c:if test="${cnt>0}">
								<c:forEach var="dto" items="${dtos}">
									<!-- 큰바구니에서 작은 바구니를 꺼내서 아래서 출력 -->
									<tr>
										<td style="text-align: center">${dto.ent_no}<c:set
												var="number" value="${number-1}" /></td>
										<td style="text-align: center"><img
											style="width: 60px; height: 80px"
											src="resources/images/addmission_img/${dto.ent_image}"></td>
										<td style="text-align: center">${dto.ent_name}</td>
										<td style="text-align: center">${dto.ent_maj}</td>
										<td style="text-align: center">${dto.ent_grade}</td>
										<c:set var ="rez" value="${dto.ent_regi_no.split('-')}" />
										 <td style="text-align: center">${rez[0]}-*******</td> 
										<td style="text-align: center">${dto.ent_highschool}</td>
										<td style="text-align: center">${dto.ent_hp}</td>
										<td style="text-align: center">${dto.ent_zipcode}
											${dto.ent_addr1} ${dto.ent_addr2}</td>
										<td style="text-align: center">${dto.ent_email}</td>
										<c:if test="${dto.ent_disablity_fl==0}">
											<td style="text-align: center">장애없음</td>
										</c:if>
										<c:if test="${dto.ent_disablity_fl==1}">
											<td style="text-align: center">장애있음</td>
										</c:if>
									</tr>
								</c:forEach>
								<tr>
									<th colspan="10" style="text-align: center">
										<input class="btn_navy" type="button" value="승인" onclick="apply();" style=" width: 62px; height: 39.5px; color:white;">
									</th>
								</tr>
							</c:if>
							<!-- 신청자가 없으면 -->
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="6" align="center">신청자가 없습니다.</td>
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