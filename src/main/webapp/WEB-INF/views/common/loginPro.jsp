<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.id == null}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("잘못된 입력입니다.").then((okay) => {
				  if (okay) {
					  window.location="loginPage";
					  }
					});
		</script>	
	</c:if>
	<c:if test="${sessionScope.id != null}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("환영합니다.").then((okay) => {
				  if (okay) {
					  window.location="ara";
					  }
					});
		</script>	
		
	</c:if>
</body>
</html>