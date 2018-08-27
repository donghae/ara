<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${path}resources/js/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function timeTable() {
	var url = "regTimeTable";
	window.open(url, "regTimeTable", "menubar=no, width=1400, height=1000");
}
$(function() {
	$('input[name=regDel]').click(function() {
		var id = $(this).attr('id');
		var param = "lec_no=" + id;
		$.ajax({
			url : 'regLecDel',
			type : 'get',
			data : param,

			success : function(msg) {
				$('#result').html(msg);
			},
			error : function() {
				swal('오류');
			}
		});
	});
});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<body>
	<div id="result">
					<div>
						<div style="width: 60%; float: left;  z-index: 1;">
						<br><h3>수강 신청 현황</h3>
						</div>
						<div style="width: 30%; float: left;  z-index: 1;left: 650px;">
							<input class="btn_mint" type="button" value="시간표 보기" onclick = "timeTable();">
						</div>
					</div>
					<div class="inbox-body">
						<div class="mail-option">
							<table class="st_mint"
								style="width: 1300px; margin-left: 0px; margin-right: 0px;"
								align="center">
								<tr>
									<th style="width: 4%; text-align: center;">강의 번호</th>
									<th style="width: 10%; text-align: center;">교과목명</th>
									<th style="width: 3%; text-align: center;">학점</th>
									<th style="width: 5%; text-align: center;">담당교수</th>
									<th style="width: 10%; text-align: center;">요일/시간(강의실)</th>
									<th style="width: 7%; text-align: center;">온라인 여부</th>
									<th style="width: 5%; text-align: center;">최대인원</th>
									<th style="width: 5%; text-align: center;">신청인원</th>
									<th style="width: 3%; text-align: center;">취소</th>
								</tr>
								<c:if test="${cnt_reg>0}">
									<c:forEach var="dto" items="${dtos_reg}">
										<tr>
											<td style="text-align: center">${dto.lec_no}</td>
											<td style="text-align: center">${dto.lec_name}</td>
											<td style="text-align: center">${dto.lec_point}</td>
											<td style="text-align: center">${dto.prof_name}</td>
											<td style="text-align: center">${dto.lec_day_dt}/${dto.lec_dt}:00
												~ ${dto.lec_dt+dto.lec_point}:00(${dto.lec_room_no}호)</td>
											<c:if test="${dto.lec_cy_fl==1}">
												<td style="text-align: center">O</td>
											</c:if>
											<c:if test="${dto.lec_cy_fl==0}">
												<td style="text-align: center">X</td>
											</c:if>
											<td style="text-align: center">${dto.max_person}</td>
											<td style="text-align: center">${dto.lec_now_person}</td>
											<td style="text-align: center">
												<input class="btn_mint"	name="regDel" type="button" value="취소"id="${dto.lec_no}">
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<!-- 신청자가 없으면 -->
							<c:if test="${cnt_reg==0}">
								<tr>
									<td colspan="6" align="center">등록된 강의가 없습니다.</td>
								</tr>
							</c:if>
						</div>
					</div>
				</div>
</body>