<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

	function search() {
		if(${st_state==8}){
			window.location = 'st_adm?st_state=8&lec_day_dt=' + date.value+'&lec_name='+lec_name.value;
		}
		if(${st_state==14}){
			window.location = 'st_stu?st_state=14&lec_day_dt=' + date.value+'&lec_name='+lec_name.value;
		}
	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<body>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
					<div style="width: 30%; float: left; z-index: 1;">
						<br> <br>
						<h1>강의 조회</h1>
					</div>
				</div>
				<div class="inbox-body">
					<div class="mail-option">
						<table class="st_mint"
							style="width: 1300px; margin-left: 0px; margin-right: 0px;"
							align="center">
							
							<tr>
								<th>
									<select id="date" class="input" name="date">
										<option value="">전체</option>
										<option value="월">월요일</option>
										<option value="화">화요일</option>
										<option value="수">수요일</option>
										<option value="목">목요일</option>
										<option value="금">금요일</option>
									</select>
								</th>
								<th>
									<input type="text" id="lec_name" name="lec_name" placeholder="과목명을 입력하세요.">
								</th>
								
								<th>
									<input style="width:100px;height:50px;" class="btn_mint" type="button" value="SEARCH" onclick="search();">
								</th>
								<th colspan="4"></th>
							</tr>
							<tr>
								<th style="width: 1%; text-align: center;">강의 번호</th>
								<th style="width: 10%; text-align: center;">교과목명</th>
								<th style="width: 3%; text-align: center;">학점</th>
								<th style="width: 5%; text-align: center;">담당교수</th>
								<th style="width: 10%; text-align: center;">요일/시간(강의실)</th>
								<th style="width: 7%; text-align: center;">온라인 여부</th>
								<th style="width: 5%; text-align: center;">최대인원</th>
							</tr>
							<c:if test="${cnt>0}">
								<c:forEach var="dto" items="${dtos}">
									<!-- 큰바구니에서 작은 바구니를 꺼내서 아래서 출력 -->
									<tr>
										<td style="text-align: center">${dto.lec_no}</td>
										<c:if test="${st_state==8}">
											<td style="text-align: center"><a href="st_adm?st_state=100&lec_no=${dto.lec_no}">${dto.lec_name}</a></td>
										</c:if>
										<c:if test="${st_state==14}">
											<td style="text-align: center">${dto.lec_name}</td>
										</c:if>
										<td style="text-align: center">${dto.lec_point}</td>
										<td style="text-align: center">${dto.prof_name}</td>
										<td style="text-align: center">${dto.lec_day_dt}/${dto.lec_dt}:00 ~ ${dto.lec_dt+dto.lec_point}:00(${dto.lec_room_no}호)</td>
										<c:if test ="${dto.lec_cy_fl==1}">
											<td style="text-align: center">O</td>
										</c:if>
										<c:if test ="${dto.lec_cy_fl==0}">
											<td style="text-align: center">X</td>
										</c:if>
										<td style="text-align: center">${dto.max_person}</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 신청자가 없으면 -->
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="6" align="center">등록된 강의가 없습니다.</td>
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