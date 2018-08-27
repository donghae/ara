<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<body>
	<c:if test="${chkCnt==0}">
	<c:if test="${insertcnt==1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("신청 완료").then((okay) => {
				  if (okay) {
					  window.location = 'admission';
					  }
					});
		</script>
	</c:if>
	<c:if test="${insertcnt!=1}">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("신청서를 다시 확인하세요.").then((okay) => {
				  if (okay) {
					 history.back();
					  }
					});
		</script>
	</c:if>
	</c:if>
	<c:if test="${chkCnt==1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("신청완료된 학생입니다.").then((okay) => {
				  if (okay) {
					  window.location = 'admission';
					  }
					});
		</script>
	</c:if>
</body>
</html>