<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../setting.jsp" %>



<body>
	<%-- <%@include file="../layout/header_ara.jsp"%> --%>

		
	<c:if test="${updateCnt == null && insertCnt == null}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("입력실패");
		</script>	
	</c:if>
	<c:if test="${updateCnt != null || insertCnt != null}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			opener.location.reload();
			swal("시청시간 반영되었습니다.").then((okay) => {
				  if (okay) {
					  self.close();
					  }
					});
			
		</script>	
		
	</c:if>
</body>
</html>