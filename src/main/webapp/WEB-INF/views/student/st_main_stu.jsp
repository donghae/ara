<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>


<jsp:include page="../layout/header_ara.jsp" />

<div style="height: inherit; width: 1300px; display: inline-block;">

	<%@ include file="../student/st_sidebar_stu.jsp"%>

	<c:if test="${sessionScope.st_state == 10}">
		<%@ include file="../student/st_stu/4_st_register.jsp"%>
	</c:if>
	<!-- 시간표 -->
	<c:if test="${sessionScope.st_state == 21}">
		<%@ include file="../student/st_stu/5_st_timetable.jsp"%>
	</c:if>

	<!-- 내 강의목록 -->
	<c:if test="${sessionScope.st_state == 11}">
		<%@ include file="../student/st_stu/5_st_MylecList.jsp"%>
	</c:if>
	
	<!-- 수강 신청 -->
	<c:if test="${sessionScope.st_state == 12}">
		<%@ include file="../student/st_stu/5_st_regLec.jsp"%>
	</c:if>
	
	<!-- 수강 신청 계획서 -->
	<c:if test="${sessionScope.st_state == 13}">
		<%@ include file="../student/st_stu/5_st_regLecCart.jsp"%>
	</c:if>
	
	<!-- 강의 시간표(전체용) -->
	<c:if test="${sessionScope.st_state == 14}">
		<%@ include file="../student/st_admin/3_st_ad_lecture.jsp"%>
	</c:if>

	<!-- 출결현황 -->
	<c:if test="${sessionScope.st_state == 19}">
		<%@ include file="../student/st_stu/5_st_attend.jsp"%>
	</c:if>

	<!-- 성적관리 > 성적조회 -->
	<c:if test="${sessionScope.st_state == 15}">
		<%@ include file="../student/st_stu/6_st_gpa.jsp"%>
	</c:if>

	<!-- 장학금관리 > 장학금 신청 -->
	<c:if test="${sessionScope.st_state == 16}">
		<%@ include file="../student/st_stu/7_st_scholarAppli.jsp"%>
	</c:if>
	<!-- 등록금관리 > 등록금 납부 조회 -->
	<c:if test="${sessionScope.st_state == 18}">
		<%@ include file="../student/st_stu/8_st_tuition.jsp"%>
	</c:if>

</div>

<footer>
	<%@ include file="../layout/footer_ara.jsp"%>
</footer>
