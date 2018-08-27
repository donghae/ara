<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp" %>

<style>
	.st_navy th {
		text-align: center;
	}
</style>

<body>
	<%@include file="../layout/header_ara.jsp"%>

	<!-- Popular -->

	<div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<h1>학생</h1>
        <table class="st_navy">
        	<thead>
        		<tr>
        			<th>동아리명</th>
        			<td colspan="3">동아리1</td>
        		</tr>
        		<tr>
        			<th>위치</th>
        			<td colspan="3">101호</td>
        		</tr>
        		<tr>
        			<th>인원</th>
        			<td>10명</td>
        			<th>분류</th>
        			<td>1</td>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<th>동아리 정보</th> 
        			<td colspan="3">동아리입니다  213123</td>       			
        		</tr>
        		
        	</tbody>
        </table>
        <h1>관리자</h1>
		<table class="st_navy">
			<thead>
        		<tr>
        			<th>동아리명</th>
        			<td colspan="3"><input type="text" value="동아리1"></td>
        		</tr>
        		<tr>
        			<th>위치</th>
        			<td colspan="3"><input type="text" value="101호"></td>
        		</tr>
        		<tr>
        			<th>인원</th>
        			<td>10명</td>
        			<th>분류</th>
        			<td><input type="text" value="1"></td>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<th>동아리 정보</th> 
        			<td colspan="3"><textarea rows="5" cols="50" style="resize: none;">동아리입니다  213123</textarea></td>       			
        		</tr>        		
        	</tbody>
        </table>
    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>