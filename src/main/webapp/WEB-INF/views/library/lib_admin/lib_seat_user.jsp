<%@page import="com.spring.projectFinal.LIVO.SeatVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<% 
	SeatVO sVO = (SeatVO)request.getAttribute("sVO");		
%>

<fmt:formatDate value="${sVO.getSeat_st_dt()}" pattern="yyyy년  MM월 dd일"/>
|열람실 :<%= sVO.getRdRoom_no()%>|좌석번호 :<%= sVO.getSeat_no()%>|이름 :<%= sVO.getUser_name()%> (<%= sVO.getUser_no()%>)|이용시간 : <fmt:formatDate value="${sVO.getSeat_st_dt()}" pattern="HH:mm:ss"/> - <fmt:formatDate value="${sVO.getSeat_end_dt()}" pattern="HH:mm:ss"/>
|이용 중지 하시겠습니까?