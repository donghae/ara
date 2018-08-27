<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function searchProf() {
		  var url = "searchProf";
		  window.open(url, "searchProf", "menubar=no, width=650, height=700");
	}
	function focus(lec_day_dt,lec_dt){
		date.value=lec_day_dt;
		time.value=lec_dt;
	}
	function del(lec_no){
		var result = confirm("삭제하시겠습니까?");
		if(result) {
			window.location = 'deletePro?lec_no=${lec_no}';
		}
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript" src="resources/js/student.js"></script> 
<style>
.bg-gray {
	background-color: #E5E7EA;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
</head>
<body onload="focus('${dto.lec_day_dt}',${dto.lec_dt});">
	<div style="height: inherit; width: 500px; display: inline-block;">
		<div style="width: 1300px;height: 850px; float: left;">
			<div class="container" style="margin-left: 100px;">
			<div style="width: 30%; float: left;">
						<br> <br>
						<h1>강의 수정</h1>
					</div>
				<div class="mail-box" style="top: 30px;">
						<form action="modiPro" method="post" enctype="multipart/form-data" name="myForm" onsubmit="return inputCheck();">
						<input type="hidden" name="prof_no" value="${dto.prof_no}">
						<input type="hidden" name="lec_no" value="${lec_no}">
								 <table style="width: 800px; margin-left: 0px;" align="center">
 									<tr style="text-align:center;background-color:#001E42;">
										<th colspan="4" style="color:white;height: 80px;"><h2>강의 수정</h2></th>
									</tr>
									<tr>
										<td style="padding-bottom: 0px;padding-top: 10px;"></td>
									</tr>
									<tr class="bg-gray">
										<th style="text-align:center">교과목명</th>
										<td style="text-align:center">
											<input type="text" name="lec_name" value="${dto.lec_name}"> 
										</td>
										<td></td>
									</tr>
 									<tr>
										<th style="text-align:center">학점</th>
										<td style="text-align:center"><input type="text" name="lec_point" value="${dto.lec_point}"></td>
										<td></td>
									</tr>
									<tr class="bg-gray">
										<td style="text-align:center">담당교수</td>
										<td style="text-align:center">
											<input type="text" name="prof_name" value="${dto.prof_name}" readonly>  
										</td>
										<td>
											<input style="width:100px;height:50px;" class="btn_navy" type="button" value="search" onclick="searchProf();">
										</td>
									</tr>
									<tr>
										<th style="text-align:center">요일</th>
										<td style="text-align:center">
											<select class="input" id="date" name="lec_day_dt">
												<option value="월">월요일</option>
												<option value="화">화요일</option>
												<option value="수">수요일</option>
												<option value="목">목요일</option>
												<option value="금">금요일</option>
											</select>
										</td>
										<td></td>
									</tr>
									<tr class="bg-gray">
										<th style="text-align:center">시작 시간</th>
										<td style="text-align:center">
											<select class="input" name="lec_dt" id="time">
												<option value="9">9:00</option>
												<option value="10">10:00</option>
												<option value="11">11:00</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="14">14:00</option>
												<option value="15">15:00</option>
												<option value="16">16:00</option>
												<option value="17">17:00</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="20">20:00</option>
												<option value="21">21:00</option>
												<option value="22">22:00</option>
											</select>
										</td>
										<td></td>
									</tr>
									<tr>
										<th style="text-align:center">강의실</th>
										<td style="text-align:center">
											<input type="text" name="lec_room_no" value="${dto.lec_room_no}">
										</td>
										<td></td>
									</tr>
									<tr class="bg-gray">
										<th style="text-align:center">온라인 강의</th>
										<td style="text-align:center">
										<c:if test="${dto.lec_cy_fl==0}">
											<input type="radio" name="lec_cy_fl" value="0" checked /> 오프라인
											<input type="radio" name="lec_cy_fl" value="1" style="margin-left: 30px;" /> 온라인
										</c:if>
										<c:if test="${dto.lec_cy_fl==1}">
											<input type="radio" name="lec_cy_fl" value="0" /> 오프라인
											<input type="radio" name="lec_cy_fl" value="1" checked  style="margin-left: 30px;" /> 온라인
										</c:if>
										</td>
										<td></td>
									</tr>
									<tr>
										<th style="text-align:center">최대인원</th>
										<td style="text-align:center">
											<input type="text" name="max_person" value="${dto.max_person}">
										</td>
										<td></td>
									</tr>
									<tr class="bg-gray">
										<th colspan="3" style="text-align:center">
											<input type="submit" value="수정하기"> 
											<input type="button" value="삭제하기" onclick="del('${lec_no}')"> 
										</th>
									</tr>
								</table>
						</form>
					</div>
				</div>
		</div>
	</div>
</body>
</html>



