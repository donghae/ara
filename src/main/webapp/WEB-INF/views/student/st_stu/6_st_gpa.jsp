<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../../setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.st_navy th {
	text-align:center;
}
.st_navy td {
	text-align:center;
}
</style>
<script type="text/javascript">
   function locate(){
      window.location='st_stu?st_state=15&semester='+semester.value;
   }
   function focus(semester){
	   semester.value=semester;
   }
</script>

</head>
<body onload="focus(${semester});">
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br>
							<br>
							<h1>성적 조회</h1>
						</div>
						</div>
					</aside>
					
				<div>
				

				<table class="st_navy">
					<thead>
						<tr>
							<td colspan="5">
								<select id="semester" class="input" name="semester">
									<option value="">학기선택</option>			
				                     <option value="2018-1"
				                     <c:if test="${semester eq '2018-1'}">selected="selected"</c:if>>2018-1학기</option>
				                     
				                     <option value="2017-2"
				                     <c:if test="${semester eq '2017-2'}">selected="selected"</c:if>>2017-2학기</option>
				                     
				                     <option value="2017-1"
				                     <c:if test="${semester eq '2017-1'}">selected="selected"</c:if>>2017-1학기</option>
				                     
				                     <option value="2016-2"
				                     <c:if test="${semester eq '2016-2'}">selected="selected"</c:if>>2016-2학기</option>
				                     
				                     <option value="2016-1"
				                     <c:if test="${semester eq '2016-1'}">selected="selected"</c:if>>2016-1학기</option>
				                     
				                     <option value="2015-2"
				                     <c:if test="${semester eq '2015-2'}">selected="selected"</c:if>>2015-2학기</option>
				                     
				                     <option value="2015-1"
				                     <c:if test="${semester eq '2015-1'}">selected="selected"</c:if>>2015-1학기</option>
			                  </select>
			                  <input class="btn_navy" type="button" value="조회"
			                     onclick="locate();" style="color:white">
							</td>
						</tr>
					
						<tr>
							<th>연도-학기</th>
							<th>강의번호</th>
							<th style="width:30%">강의명</th>
							<th>평균평점</th>
							<th>성적인정</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${cnt>0}">
						<c:set var="avg" value="0" />
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.gpa_semester}학기</td>					
								<td>${dto.lec_no}</td>													
								<td>${dto.lec_name}</td>						
								<td>${dto.gpa}</td>					
								<td>Y</td>
							</tr>
							<c:set var="avg" value="${avg + dto.gpa}" />
						</c:forEach>

						<tr>
							<td colspan="5" style="text-align:right;">평점평균: 
								<fmt:formatNumber value="${avg/cnt}" pattern=".00"/>
							</td>
						</tr>
						</c:if>
						
						<c:if test="${cnt==0}">
						
							<tr>
								<td colspan="5">
									해당하는 학기의 성적이 없습니다.
								</td>
							</tr>
						
						</c:if>
					</tbody>	
				</table>
			</div>	
			</div>
		</div>
	</div>
</body>