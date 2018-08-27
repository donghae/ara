<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>
<body>

	<c:choose>		
		<c:when test="${updateCnt == 1}">
		<!-- 좌석 이용중지 성공 시 -->	
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>		
			<script type="text/javascript">
				swal("${rdRoom_no}-${seat_no} 의 좌석 이용이 취소되었습니다").then((okay) => {
					  if (okay) {
						  window.location="lib_seat_admin";
						  }
						});
				
				
			</script>			
		</c:when>
		
		
		<c:when test="${updateCnt == 0}">
		<!-- 좌석 이용중지 실패 시 -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
				swal("이용 취소 오류. 다시 시도해주시기 바랍니다").then((okay) => {
					  if (okay) {
						  window.location="lib_seat_admin";
						  }
						});
				
			</script>
		</c:when>
	</c:choose>

</body>
