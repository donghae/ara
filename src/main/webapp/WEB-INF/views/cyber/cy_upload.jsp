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
	<c:if test="${insertCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("강의 추가 실패").then((okay) => {
				  if (okay) {
					  window.location="cy_select_lec_list?lec_no=${lec_no}";
					  }
					});
		</script>	
	</c:if>
	<c:if test="${insertCnt != 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("강의가 추가되었습니다.").then((okay) => {
				  if (okay) {
					  window.location="cy_select_lec_list?lec_no=${lec_no}";
					  }
					});
			
		</script>	
		
	</c:if>
</body>
</html>