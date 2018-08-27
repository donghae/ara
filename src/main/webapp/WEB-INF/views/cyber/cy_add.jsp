<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<style>
.wrap_dev1{
	display: inline;
	width: 100%;
	height: 40%;
	}
	.wrap_dev2{
	width:100%;
	text-align:center;
	background-color: #cacaca;
	}
	
	.table1 {
	
	border: 2px solid white;
	border-radius: 5px;
	background-color: #FFFFFF;
	font-size: 15px;
	margin: 0 auto;
	}

	table input {
		color: black;
		width: 750px;
		height:30px;
	}

	.input {
		background-color: #FFFFFF;
		border: 1px solid #CC3D3D;
	}
	
	.inputButton {
		background-color: white;
		color: black;
		width: 70px;
		font-size: 11px;
		margin: 3px;
	}
	
	th {
		background-color:#cacaca;
		color: /* #FFA7A7 */black;
		font-size: 11px;
		border: 1px solid white;
		border-radius: 4px;
		margin: 0px;
		padding: 3px;
		height: 40px;
		width: 200px;
	}
	td {
		background-color:white;
		color: black;
		font-size: 11px;
		border: 1px solid white;
		border-radius: 4px;
		margin: 0px;
		padding: 3px;
		height: 40px;
		width: 350px;
	}
	textarea {
		width:750px;
		resize : vertical;
	}

</style>
<jsp:include page="../layout/header_ara.jsp"/>
<div class="wrap_dev1">
	<!-- gnb_dep1 영역 -->
	
		<div class="wrap_dev2">
			<div>
				<a href="cy_main"><span style="font-size: 2em;">온라인 강의</span></a>
			
				<a href="cy_add"><span style="font-size: 2em; margin-left: 10%;">강의추가</span></a>
			
				<a href="cy_comm"><span style="font-size: 2em; margin-left: 10%;">커뮤니티</span></a>
				
			</div>

		</div>

	</div>
	<form class="add" method="post" enctype="multipart/form-data" style="margin-top: 200px; margin-bottom: 200px;">
		<table class="table1">
			<tr>
				<th>강&nbsp;의&nbsp;명</label></th>
				<td><input type="text" required autofocus></td>
			</tr>
			<tr>
			<th>첨&nbsp;부</label></th>
			<td><input type="file" required autofocus></td>
			</tr>
			<tr>
				<th>교&nbsp;수&nbsp;명</label></th>
				<td><input type="text" required autofocus></td>
			</tr>
			
			
			
			<tr>
				<th>강&nbsp;의&nbsp;내&nbsp;용</label></th>
				<td>
				<textarea rows="5" cols="30"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input class="button1" type="submit" value="강의추가" style="width:80px;">
				<input class="button1" type="reset" value="취소" style="width:60px;">	
				<!-- <input type="submit" value="책추가">
				<input type="reset" value="취소" onclick="window.location.back();"> -->
				</td>
			</tr>
		</table>	
				
</form>
<%@ include file = "../layout/footer_ara.jsp"%>
</html>

