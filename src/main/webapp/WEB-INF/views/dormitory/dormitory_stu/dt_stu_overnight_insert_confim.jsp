<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<c:if test="${sessionScope.id != null}">
	<c:set var="st_no" value="${sessionScope.id}" />
</c:if>

	<c:if test="${insertCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("외박 신청 중 오류가 발생했습니다. "+"\n" + "다시 시도해 주세요.").then((okay) => {
				  if (okay) {
						history.back();
				 		 }
					  });
		</script>
	</c:if>

	<c:if test="${insertCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
				swal("외박 신청 되었습니다.").then((okay) => {
					  if (okay) {
							window.location='dormitoty_stu_overnight_select?st_no=${st_no}';
					  	}
					  });					
		</script>	
	</c:if>
</body>
</html>