<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${StudentCnt == null}">
	<c:if test="${insertCnt != 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("학생 등록에 실패하였습니다." +"\n" + "다시 시도해 주세요").then((okay) => {
				  if (okay) {
					  window.location="dormitoty_stu_insert";
					  }
					});
		</script>
	</c:if>

	<c:if test="${insertCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("정상적으로 학생 등록 되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dormitoty_stu_select';	
					  }
					});
		</script>	
	</c:if>
	</c:if>
	
	<c:if test="${StudentCnt != null}">
		<c:if test="${selectCnt != 1 }">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
				swal("아라대학교에 등록된 학번이 아닙니다" +"\n" + "다시 시도해 주세요.").then((okay) => {
					  if (okay) {
						  window.location="dormitoty_stu_insert";
						  }
						});
			</script>
		</c:if>
	</c:if>
	
		<c:if test="${dormStudentCnt == 1}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
				swal("이미 등록된 학번입니다." +"\n" + "다시 시도해 주세요.").then((okay) => {
					  if (okay) {
						  window.location="dormitoty_stu_insert";
						  }
						});
			</script>
		</c:if>

</body>
</html>