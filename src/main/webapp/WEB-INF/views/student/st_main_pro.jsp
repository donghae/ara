<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<jsp:include page="../layout/header_ara.jsp" />

<div style="height: inherit; width: 1300px; display: inline-block;">
	<%@ include file="../student/st_sidebar_pro.jsp"%>

	<!-- 교수 시간표 -->
	<c:if test="${sessionScope.st_state == 50}">
		<%@ include file="../student/st_pro/50_pro_timeTable.jsp"%>
	</c:if>

	<!-- 해당 강의를 듣는 학생 목록 -->
	<c:if test="${sessionScope.st_state == 51}">
		<%@ include file="../student/st_pro/51_pro_stuList.jsp"%>
	</c:if>

	<!-- 강의 듣는 학생 중 출결 추가 -->
	<c:if test="${sessionScope.st_state == 52}">
		<%@ include file="../student/st_pro/52_pro_stuAttend.jsp"%>
	</c:if>

	<!-- 강의 듣는 학생의 성적입력창 -->
	<c:if test="${sessionScope.st_state == 53}">
		<%@ include file="../student/st_pro/53_pro_inputGrade.jsp"%>
	</c:if>

	<c:if test="${sessionScope.st_state == 55}">
		<%@ include file="../student/st_pro/55_inputPresent.jsp"%>
	</c:if>


	<c:if test="${sessionScope.st_state == 57}">
		<%@ include file="../student/st_pro/53_pro_inputPro.jsp"%>
	</c:if>
</div>

<footer>
	<%@ include file="../layout/footer_ara.jsp"%>
</footer>