<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp"%>
<body>
	<c:choose>
		<c:when test="${insertCnt == amt && insertCnt > 0}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
			swal(
					{
						  title: "도서 등록 완료",
						  text: "다른 도서를 등록하시겠습니까?",
						  buttons: true,
						  dangerMode: true,
						}
			).then((okay) => {
				  if (okay) {
					  window.location="lib_bookAddForm";
					  } else {
						  window.location="lib_bookSearch_admin";
					  }
					});
		</script>
		</c:when>

		<c:when test="${insertCnt != amt && insertCnt > 0}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
			swal("도서 등록에 누락된 도서가 있습니다. 확인바랍니다").then((okay) => {
				  if (okay) {
					  window.location="lib_bookSearch_admin";
					  }
					});
			
		</script>
		</c:when>

		<c:otherwise>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
			swal("도서 등록 실패").then((okay) => {
				  if (okay) {
					  window.location="lib_bookAddForm";
					  }
					});
			
		</script>
		</c:otherwise>
	</c:choose>
</body>