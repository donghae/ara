<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>




<body>
	<%@include file="../layout/header_ara.jsp"%>
	

	<!-- Popular -->

	<div class="main-content" style="margin: 10% 0; min-height: 45%" >
		<h1 style="text-align: left; margin-left: 10%">통학버스</h1>
		<br>
        <!-- You only need this form and the form-basic.css -->
		<table class="st_navy">
        	<thead>
        		<tr>
        			<th>출발지</th>
        			<th>도착지</th>
        			<th>출발시간</th>
        			<th>소요시간</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>수원</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>평택</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>용인</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>        		
        	</tbody>
        </table>
    </div>
	<%@include file="../layout/footer_ara.jsp"%>
</body>
</html>