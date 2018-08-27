<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${rank==1}">
	<c:set var="schol" value="${tuition}" />
</c:if>
<c:if test="${rank==2}">
	<c:set var="schol" value="${tuition*0.6}" />
</c:if>
<c:if test="${rank!=1&&rank!=2}">
	<c:set var="schol" value="0" />
</c:if>

<fmt:parseNumber var="tuition1" value="${tuition/1000000}" integerOnly="true" />
<fmt:parseNumber var="tuition2" value="${tuition/1000}" integerOnly="true" />
<fmt:parseNumber var="tuition3" value="${tuition-tuition2*1000}" integerOnly="true" />

<c:if test="${tuition2==0}">
	<c:set var="tuition2" value="000"/>
</c:if>
<c:if test="${tuition3==0}">
	<c:set var="tuition3" value="000"/>
</c:if>

<fmt:parseNumber var="schol1" value="${schol/1000000}" integerOnly="true" />
<fmt:parseNumber var="schol2" value="${schol/1000}" integerOnly="true" />
<fmt:parseNumber var="schol3" value="${schol-schol2*1000}" integerOnly="true" />
<c:if test="${schol!=0}">
	<c:if test="${schol2==0}">
		<c:set var="schol2" value="000"/>
	</c:if>
	<c:if test="${schol3==0}">
		<c:set var="schol3" value="000"/>
	</c:if>
</c:if>

<c:set var="real" value="${tuition-schol}" />
<fmt:parseNumber var="real1" value="${real/1000000}" integerOnly="true" />
<fmt:parseNumber var="real2" value="${real/1000}" integerOnly="true" />
<fmt:parseNumber var="real3" value="${real-real2*1000}" integerOnly="true" />
<c:if test="${real!=0}">
	<c:if test="${real2==0}">
		<c:set var="real2" value="000"/>
	</c:if>
	<c:if test="${real3==0}">
		<c:set var="real3" value="000"/>
	</c:if>
</c:if>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function searchProf() {
		  var url = "searchProf";
		  window.open(url, "searchProf", "menubar=no, width=650, height=700");
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
<body>

	<div style="height: inherit; width: 500px; display: inline-block;">
		<div style="width: 1300px;height: 850px; float: left;">
			<div class="container" style="margin-left: 100px;">
			<div style="width: 30%; float: left;">
						<br> <br>
						<h1>등록금 조회</h1>
					</div>
					<br>
				<div class="mail-box" style="top: 30px;">
						<form action="lecturePro" method="post" enctype="multipart/form-data" name="myForm" onsubmit="return inputCheck();">
						<input type="hidden" name="prof_no">
								 <table style="width: 800px; margin-left: 0px;" align="center">
 									<tr style="text-align:center;background-color:#001E42;">
										<th colspan="4" style="color:white;height: 80px;"><h2>등록금 납부 조회</h2></th>
									</tr>
									<tr>
										<td style="padding-bottom: 0px;padding-top: 10px;"></td>
									</tr>
									<tr class="bg-gray">
										<th style="text-align:center">등록금</th>
										<td style="text-align:center">
											<input type="text" name="tuition" 
											value="${tuition1},${tuition2-tuition1*1000},${tuition3}원" readonly> 
										</td><td></td>
									</tr>
 									<tr>
										<th style="text-align:center">장학금</th>
										<td style="text-align:center">
										<c:if test="${schol!=0}">
											<input type="text" name="prof_name" value="${schol1},${schol2-schol1*1000},${schol3}원" readonly> 
										</c:if>
										<c:if test="${schol==0}">
											<input type="text" name="prof_name" value="0원" readonly> 
										</c:if>
										</td><td></td>
									</tr>
									<tr class="bg-gray">
										<td style="text-align:center">실납입금액</td>
										<td style="text-align:center">
											<c:if test="${real!=0}">
												<input type="text" name="prof_name" value="${real1},${real2-real1*1000},${real3}원" readonly> 
											</c:if>
											<c:if test="${real==0}">
												<input type="text" name="prof_name" value="0원" readonly> 
											</c:if>
										
										</td><td></td>
									</tr>
									<tr>
										<th style="text-align:center">수납금액</th>
										<td style="text-align:center">
											<input type="text" name="prof_name" value="0원" readonly> 
										</td><td></td>
									</tr>
									<tr class="bg-gray">
										<td style="text-align:center"></td>
										<td style="text-align:center">
										</td><td></td>
									</tr>
								</table>
						</form>
					</div>
				</div>
		</div>
	</div>
</body>
</html>



