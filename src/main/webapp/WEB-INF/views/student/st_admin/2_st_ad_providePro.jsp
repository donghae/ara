<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<html>
<body>
<c:if test="${insertCnt==1}">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("제공완료").then((okay) => {
			  if (okay) {
				  window.location = 'st_adm?st_state=6&major='+${dto.ent_maj};
				  }
				});
	</script>
</c:if>
<c:if test="${insertCnt!=1}">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("이미 제공된 학생입니다.").then((okay) => {
			  if (okay) {
				  window.location = 'st_adm?st_state=6&major='+${dto.ent_maj};
				  }
				});
	</script>
</c:if>
</body>
</html>