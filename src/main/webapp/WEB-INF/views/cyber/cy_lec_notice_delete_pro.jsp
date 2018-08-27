<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${deleteCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("입력실패").then((okay) => {
				  if (okay) {
					  window.location="cy_lec_main?lec_no=${lec_no}";
					  }
					});
		</script>	
	</c:if>
	<c:if test="${deleteCnt != 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("삭제되었습니다").then((okay) => {
				  if (okay) {
					  window.location="cy_lec_main?lec_no=${lec_no}";
					  }
					});
			
		</script>	
		
	</c:if>
</body>
</html>