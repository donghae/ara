<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>


<body>
	<c:if test="${deleteCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("도서 삭제 완료").then((okay) => {
				  if (okay) {
					  window.location="lib_bookSearch_admin";
					  }
					});
			
		</script>
	</c:if>
	<c:if test="${deleteCnt != 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("도서 삭제 실패").then((okay) => {
				  if (okay) {
					  window.location="lib_bookSearch_admin";
					  }
					});
			
		</script>
	</c:if>
</body>