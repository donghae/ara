<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	function btn_delete(maj_cd){
		window.location="delete_major?maj_cd="+maj_cd;
	}
</script>
<%@ include file="../setting.jsp" %>



<body>
	<%@include file="../layout/header_ara.jsp"%>

	
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<!-- Popular -->

	<div class="main-content">
		
        <!-- You only need this form and the form-basic.css -->
		<h1>학생</h1>
		
        <table class="responsive-table">
        	
        	<c:if test="${requestScope.vo!=null}">
        		<thead>
	        		<tr>
	        			<th>전공명</th>
	        			<td>
	        				<c:set var="maj_nm" value="${fn:substringBefore(vo.maj_info,'입니다')}"/>
							${maj_nm}
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>사무실 번호</th>
	        			<td>
	        				<c:set var="colleage" value="${fn:substring(vo.maj_office_no,1,2) }"/>
	        				<c:set var="office_no" value="${fn:substring(vo.maj_office_no,1,4) }"/>
	        				<c:if test="${colleage==1}">공학대학</c:if>
							<c:if test="${colleage==2}">과학대학</c:if>
							<c:if test="${colleage==3}">사회대학</c:if>
							<c:if test="${colleage==4}">예술대학</c:if>
							<c:if test="${colleage==5}">인문대학</c:if>
							<c:if test="${colleage==6}">체육대학</c:if>
							&nbsp;${office_no}호
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>인원</th>
	        			<td>
	        				${vo.maj_cnt}명
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">학과 정보</th>
	        			<td>${vo.maj_info}</td>
	        		</tr>
	        		
        		</thead>
				
        	</c:if>
        </table>
        
        <h1>관리자 modifyForm</h1>
        <form action="modify_major" method="post">
        	<input type="hidden" name="pageNum" value="${pageNum}">
        	<input type="hidden" name="maj_cd" value="${maj_cd}">
        	<table class="st_navy">
        	
        	<c:if test="${requestScope.vo!=null}">
        		<thead>        			
	        		<tr>
	        			<th>전공명</th>
	        			<td>
	        				<c:set var="maj_nm" value="${fn:substringBefore(vo.maj_info,'입니다')}"/>
							${maj_nm}
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>사무실 번호</th>
	        			<td>
	        				<c:set var="colleage" value="${fn:substring(vo.maj_office_no,1,2) }"/>
	        				<c:set var="office_no" value="${fn:substring(vo.maj_office_no,1,4) }"/>
	        				<c:if test="${colleage==1}">공학대학</c:if>
							<c:if test="${colleage==2}">과학대학</c:if>
							<c:if test="${colleage==3}">사회대학</c:if>
							<c:if test="${colleage==4}">예술대학</c:if>
							<c:if test="${colleage==5}">인문대학</c:if>
							<c:if test="${colleage==6}">체육대학</c:if>
							&nbsp;${office_no}호
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>인원</th>
	        			<td>
	        				<input name="maj_cnt" type="text" value="${vo.maj_cnt}">명
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">등록금</th>
	        			<td>
	        				<input name="maj_tuition" type="text" value="${vo.maj_tuition}">원
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">담당 교수번호</th>
	        			<td>
	        				<input name="prof_no" type="text" value="${vo.prof_no}">
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">학과 정보</th>
	        			<td><textarea name="maj_info" rows="5" cols="50" style="resize: none;">${vo.maj_info}</textarea></td>
	        		</tr>
	        		<tr>	        			
	        			<td colspan="2" align="center">
        					<input type="submit" class="btn_navy" value="수정">
        					<input type="button" class="btn_navy" value="삭제" onclick="btn_delete(${maj_cd});">
        					<input type="button" class="btn_navy" value="취소">
        				</td>
	        		</tr>
        		</thead>
				
        	</c:if>
        </table>
        </form>
        
		<h1>관리자 addForm</h1>
		<form action="add_major" method="post">
		
	        <table class="st_navy">        	
	       		<thead>        			
	        		<tr>
	        			<th>전공코드</th>
	        			<td>        				
							<input name="maj_cd" type="text" value="" required="required">
	        			</td>
	        		</tr>	        		
	        		<tr>
	        			<th>사무실 번호</th>
	        			<td>
	        				<input name="maj_office_no" type="text" value="" required="required">
	        			</td>
	        		</tr>
	        		<tr>
	        			<th>인원</th>
	        			<td>
	        				<input name="maj_cnt" type="text" value="" required="required">명
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">등록금</th>
	        			<td>
	        				<input name="maj_tuition" type="text" value="" required="required">원
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">담당 교수번호</th>
	        			<td>
	        				<input name="prof_no" type="text" value="" required="required">
	        			</td>
	        		</tr>
	        		<tr>
	        			<th align="center">학과 정보</th>
	        			<td><textarea name="maj_info" rows="5" cols="50" style="resize: none;" required="required">입니다</textarea></td>
	        		</tr>
	        		<tr>	        			
	        			<td colspan="2" align="center">
	        				<input type="submit" class="btn_navy" value="추가">
	        				<input type="button" class="btn_navy" value="취소">
	        			</td>        			
		        	</tr>
	       		</thead>
					
	        </table>
        </form>
    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>