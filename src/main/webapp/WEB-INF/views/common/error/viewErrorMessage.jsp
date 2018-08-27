<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>viewErrorMessage.jsp 페이지입니다.</h3>
	요청처리 과정에서 에러가 발생하였습니다.<br>
	빠른 시간안에 문제를 해결하도록 하겠습니다.<br><br>
	
	에러타입 : <%=exception.getClass().getName()%><br>
	에러메시지 : <%=exception.getMessage() %>
</body>
</html>