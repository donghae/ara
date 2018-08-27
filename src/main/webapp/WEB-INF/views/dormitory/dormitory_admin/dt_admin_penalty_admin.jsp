<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${insertCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("벌점 등록에 실했습니다.." +"\n" + "다시 시도해 주세요").then((okay) => {
				  if (okay) {
						  window.location="dormitory_admin_penalty";
					  }
					});
		</script>
	</c:if>

	<c:if test="${insertCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("정상적으로 벌점 등록 되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dormitory_admin_penalty';
					  }
					});
		</script>	
	</c:if>
</body>
</html>