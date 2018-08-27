<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>

<body>
	<c:if test="${updateCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("도서 수정 완료").then((okay) => {
				  if (okay) {
					  window.location="lib_bookSearch_admin";
					  }
					});
			
		</script>
	</c:if>
	<c:if test="${updateCnt != 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("도서 수정 실패").then((okay) => {
				  if (okay) {
					  window.location="lib_bookModiForm?b_no="+${b_no};
					  }
					});
			
		</script>
	</c:if>
	
</body>