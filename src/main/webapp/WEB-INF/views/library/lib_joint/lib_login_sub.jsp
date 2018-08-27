<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body>
	<!-- 로그인 성공 시 -->
	<c:if test="${id != null}">
		<c:set var="admin" value="${id.substring(0,1)}"/>
		
		<c:choose> 
			<c:when test="${admin.equals('0')}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
				<!-- 1초 후에 alert창 띄운 후, 이동 -->
					setTimeout(function() {
						swal('${name} 관리자님 로그인되었습니다');
						opener.parent.location.href="lib_bookSearch_admin";
						self.close();				
					}, 500);
				</script>			
			</c:when>
			
			<c:otherwise>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
				<!-- 1초 후에 alert창 띄운 후, 이동 -->
					setTimeout(function() {
						swal('${name} 님 로그인되었습니다');
						opener.parent.location.reload();
						self.close();				
					}, 500);
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- 로그인 실패 시 -->
	<c:if test="${id == null}">		
		<script type="text/javascript">
			var text = confirm("존재하지 않는 회원정보입니다. 다시 로그인하시겠습니까?");
						
			if(text == true){
				self.opener = self;
			  	self.location.href="lib_loginForm";			  	
			  
			} else if(text == false){
				self.opener = self;
				self.top.location.href="lib_home";
				self.close();
			}					
		</script>
	</c:if>	
</body>