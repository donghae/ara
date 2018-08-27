<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<jsp:include page="../layout/header_ara.jsp" />

<div style="height:inherit; width: 1300px; display:inline-block;">
	<%@ include file="../student/st_sidebar_adm.jsp"%>
	
	<c:if test="${sessionScope.st_state==1}">
      <%@ include file="../student/st_admin/1_st_ad_studentList.jsp"%>
   </c:if>   
   
   <c:if test="${sessionScope.st_state==2}">
      <%@ include file="../student/st_admin/1_st_ad_gpaList.jsp"%>
   </c:if>
	<c:if test="${sessionScope.st_state==5}">
		<%@ include file="../student/st_admin/2_st_ad_application.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==6}">
		<%@ include file="../student/st_admin/2_st_ad_passer.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==7}">
		<%@ include file="../student/st_admin/2_st_ad_extraPasser.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==8}">
		<%@ include file="../student/st_admin/3_st_ad_lecture.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==9}">
		<%@ include file="../student/st_admin/3_st_ad_lecturePlus.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==100}">
		<%@ include file="../student/st_admin/3_st_ad_lectureModi.jsp"%>
	</c:if>
	<c:if test="${sessionScope.st_state==101}">
		<%@ include file="../student/st_admin/3_st_ad_reg_lecture.jsp"%>
	</c:if>
</div>

<footer>
	<%@ include file="../layout/footer_ara.jsp"%>
</footer>
