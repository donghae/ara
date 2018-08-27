<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/box_mon.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/font_common.css">
<link rel="stylesheet" href="resources/css/footer_ara.css">
<link rel="stylesheet" href="resources/css/form-basic.css">
<link rel="stylesheet" href="resources/css/header_ara.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
</head>
<style>
.button {
	background-color: #001E42;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	cursor: pointer;
}

.pfBtn {
	width:20px;
	border-radius: 12px;
	margin-left: 800px;
}
 table {
	width: 100%;
	border: 1px solid gray;
	border-collapse: collapse;
	margin-left:400px;
	margin-top:100px;
}

th, td {
	border: 1px solid gray;
	padding: 10px;
	color:black;
}
th {
	border: 1px solid gray;
	padding: 10px;
	color:black;
	text-align:center;
}
.applicantCheck_header {
	background-color:#001E42;
}
.applicantCheck_mid {
	
	color:#001E42;
	text-align:center;
	font-size:20px;
	font-weight:bold;
}
input[type=text] {
    border: 1px solid gray;
    border-radius: 4px;
}
</style>
<body>
<jsp:include page="../../layout/header_ara.jsp" />
	<div style="width:900px;">
	
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box" style="height:700px;">
			<form action="confirmJumin" method="post">
			<table>
				<tr>
					<th class="applicantCheck_header" colspan="2"><center><img src="${path}resources/images/common_img/logo/ARA_navy.PNG" style="width:100px;">
					<img src="${path}resources/images/common_img/logo/ARA_full_navy.PNG" style="width:300px;"></center></th>
				</tr>
				
				<tr>
					<td class="applicantCheck_mid" colspan="2">합격자조회</td>	
				</tr>
				
				<tr>
					<th style="text-align:center;width:40%;">성명</th>
					<td><input type="text" name="name"></td>
				</tr>
			
				<tr>
					<th style="text-align:center;width:40%;">주민등록번호</th>
					<td><input type="text" name="jumin1"> - <input type="text" name="jumin2"></td>
				</tr>
				
				<tr><td colspan="2" style="text-align:center;">
					<input type="submit" class="btn_navy" value="조회">				
				</td></tr>
			</table>
			</form>
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="../../layout/footer_lib.jsp"%>
</footer>
</body>
</html>