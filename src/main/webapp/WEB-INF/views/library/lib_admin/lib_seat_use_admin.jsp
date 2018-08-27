<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp"%>

<body>
	<c:choose>
		<c:when test="${certiry == -1}">
			<!-- 증명 실패했을 경우 -->
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
				swal("도서관 이용권한이 없습니다").then((okay) => {
					  if (okay) {
						  window.location = "lib_seat_admin";
						  }
						});
				
			</script>
		</c:when>

		<c:when test="${certiry != -1}">
			<!-- 학생,교수,관리자로 증명되었을 경우 -->
			<c:if test="${selectCnt == 1}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
					swal("이미 이용 중인 좌석이 있습니다").then((okay) => {
						  if (okay) {
							  window.location = "lib_seat_admin";
							  }
							});
					
				</script>
			</c:if>
			
			<c:if test="${selectCnt != 1}">
				<c:if test="${insertCnt == 1}">
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
					<script type="text/javascript">
						swal("${rdRoom_no} - ${seat_no} 등록 완료되었습니다").then((okay) => {
							  if (okay) {
								  window.location = "lib_seat_admin";
								  }
								});
					</script>
				</c:if>
			</c:if>
		</c:when>
	</c:choose>
</body>