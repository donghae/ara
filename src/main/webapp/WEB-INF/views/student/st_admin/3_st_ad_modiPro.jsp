<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<html>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("수정완료").then((okay) => {
			  if (okay) {
				  window.location = 'st_adm?st_state=8';
				  }
				});
	</script>
</body>
</html>