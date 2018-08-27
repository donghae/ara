<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>외박 신청 삭제</title>
</head>
<c:if test="${sessionScope.id != null}">
	<c:set var="id" value="${sessionScope.id}" />
</c:if>
<body>
	<c:if test="${deleteCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("외박 신청 삭제 중 오류가 발생했습니다. "+"\n" + "다시 시도해 주세요.").then((okay) => {
				  if (okay) {
					  history.back();
					  }
					});
			
		</script>
	</c:if>

	<c:if test="${deleteCnt == 1}">
	<input type="hidden" value="${id}" name="st_no">	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("외박 신청 삭제 되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dormitory';
				 		}		
			 		});
		</script>	
	</c:if>
</body>
</html>