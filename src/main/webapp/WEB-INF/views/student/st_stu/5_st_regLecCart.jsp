<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function search() {
		window.location = 'st_stu?st_state=13&lec_day_dt=' + date.value
				+ '&lec_name=' + lec_name.value;
	}
	function timeTable() {
		var url = "cartTimeTable";
		window.open(url, "cartTimeTable", "menubar=no, width=1400, height=1000");
	}
	$(function() {
		$('input[name=cartPlus]').click(function() {
			var id = $(this).attr('id');
			var param = "lec_no=" + id;
			$.ajax({
				//  url : 'projectFinal/student/st_stu/5_st_regLecCartSub.jsp',
				url : 'regLecCartPlus',
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

	$(function() {
		$('input[name=cartDel]').click(function() {
			var id = $(this).attr('id');
			var param = "lec_no=" + id;
			$.ajax({
				url : 'regLecCartDel',
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
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
					<div style="width: 30%;z-index: 1;">
						<br> <br>
						<h1 style="    width: 300px;">수강 계획 도우미</h1>
					</div>
				</div>
				<form>
	           	<fieldset>
	           		<legend style="color:red;">안내</legend>
	           		<ul>
	           			<li style="color:red;width: 1200px;"> 강의시간/강의실은 교강사 및 강의실 사정에 따라 변경될 수 있으니 [수강계획현황]및 [수강계획시간표]를 활용하여 중복여부를 확인 바랍니다.</li>
	           			<li style="color:red;width: 1200px;"> 성능개선 및 안정화를 위한 테스트로 인하여 간혹 사용기간이 열려 수강신청이 가능할 수도 있으나, 테스트 후 예고없이 삭제됨을 알려드립니다.</li>
	           			<li style="color:red;width: 1200px;"> (테스트기간 : 8/1~8/30)</li>
	           		</ul>
	           	</fieldset>
	           </form>
				<div id="result">
					<div>
						<div style="width: 60%; z-index: 1;">
						<br>
						</div>
						<div style="width: 100%;z-index: 1;">
							<h3  style="float:left">수강 계획 현황</h3>
							<input  style="float:right;left: 400px;" class="btn_mint" type="button" value="시간표 보기" onclick = "timeTable();" style="margin-left: 550px;">
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
									<th style="width: 5%; text-align: center;">희망인원</th>
									<th style="width: 1%; text-align: center;">삭제</th>
								</tr>
								<c:if test="${cnt_wish>0}">
								<c:forEach var="dto" items="${dtos_wish}">
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
										<td style="text-align: center">${dto.lec_wish_person}</td>
										<td style="text-align: center">
											<input class="btn_mint"	name="cartDel" type="button" value="삭제" id="${dto.lec_no}">
										</td>
									</tr>
								</c:forEach>
								</c:if>
								</table>
								<!-- 신청자가 없으면 -->
								<c:if test="${cnt_wish==0}">
									<tr>
										<td colspan="6" align="center">등록된 강의가 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="inbox-body">
					<div class="mail-option">
						<table class="st_mint"
							style="width: 1300px; margin-left: 0px; margin-right: 0px;"
							align="center">
							<tr>
								<th><select id="date" class="input" name="date">
										<option value="">전체</option>
										<option value="월">월요일</option>
										<option value="화">화요일</option>
										<option value="수">수요일</option>
										<option value="목">목요일</option>
										<option value="금">금요일</option>
								</select></th>
								<th><input type="text" id="lec_name" name="lec_name"
									placeholder="과목명을 입력하세요."></th>

								<th><input style="width: 100px; height: 50px;"
									class="btn_mint" type="button" value="SEARCH"
									onclick="search();"></th>
								<th colspan="6"></th>
							</tr>
							<tr>
								<th style="width: 1%; text-align: center;">추가</th>
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
										<td style="text-align: center">
											<input class="btn_mint"name="cartPlus" type="button" value="추가" id="${dto.lec_no}">
										</td>
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
									</tr>
								</c:forEach>
							</c:if>
							<!-- 신청자가 없으면 -->
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="6" align="center">강의를 검색하세요.</td>
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