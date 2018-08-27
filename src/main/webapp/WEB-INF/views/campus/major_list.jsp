<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../setting.jsp" %>



<body>
	<%@include file="../layout/header_ara.jsp"%>


	<input type="hidden" name="pageNum" value="${pageNum}">

	<!-- Popular -->

	<div class="main-content">
		
        <!-- You only need this form and the form-basic.css -->
		<h1>학생</h1>
		
        <table class="st_navy">
        	<thead>
        		<fmt:formatDate var="date" value="${date}"/>
        		<tr>
        			<th>전공명${date}</th>
        			<th>사무실 번호</th>
        			<th>인원</th>
        			<th>학과 정보</th>
        		</tr>
        	</thead>
        	<c:if test="${requestScope.dtos!=null}">
				<tbody>
					<c:forEach var="vo" items="${dtos}">
						<tr>
							<td>
								<c:set var="maj_nm" value="${fn:substringBefore(vo.maj_info,'입니다')}"/>
								<a href="major?maj_cd=${vo.maj_cd}&pageNum=${pageNum}" >${maj_nm}</a>
							</td>						
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
		        			<td>${vo.maj_cnt}명</td>
		        			<td>${vo.maj_info}</td>
	        			</tr>
					</c:forEach>
	        	</tbody>
        	</c:if>
        </table>
        <table style="width:1000px">
			<tr align="center">
				<th align="center">
					<c:if test="${cnt>0}">
						<!-- 처음 : ◀◀                                  이전 : ◀-->
						<c:if test="${startPage > pageBlock}">
							<a href="major_list">◀◀</a>
							<a href="major_list?pageNum=${startPage-pageBlock}">&nbsp;◀</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i!=currentPage}">
								<a href="major_list?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 끝 : ▶▶                                       다음 : ▶-->
						<c:if test="${pageCount > endPage}">
							<a href="major_list?pageNum=${startPage+pageBlock}">▶&nbsp;</a>
							<a href="major_list?pageNum=${pageCount}">▶▶</a>
						</c:if>
					</c:if>
				</th>
			</tr>
		</table>
        <h1>관리자${updateCnt}</h1>
		<table class="st_navy">
        	<thead>
        		<tr>
        			<td align="center" colspan="5"><input type="button" class="btn_navy" value="추가"></td>
        		</tr>
        		<tr>
        			<th>동아리명</th>
        			<th>위치</th>
        			<th>인원</th>
        			<th>분류</th>
        			<th>수정/삭제</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>동아리1</td>
        			<td>101호</td>
        			<td>10명</td>
        			<td>1</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리2</td>
        			<td>102호</td>
        			<td>20명</td>
        			<td>2</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리3</td>
        			<td>103호</td>
        			<td>30명</td>
        			<td>3</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리4</td>
        			<td>104호</td>
        			<td>40명</td>
        			<td>4</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>        		
        	</tbody>
        </table>
    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>