<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


<div class="main-content" style="padding-top:50px;">
	<form name="findForm" class="form-basic" action="findPwd">
	
		<div class="form-title-row">
			<h1>아이디 찾기</h1>
		</div>
		
		<c:if test="${idList!=null}">
			<div class="form-row">
	            <label>
	                <span>아이디</span>
	                <c:forEach var="id" items="${idList}">
						${id}<input type="hidden" name="id" value="${id}">
					</c:forEach>
	            </label>
	        </div>
		</c:if>
		
		<c:if test="${idList==null}">	
			<div class="form-row">
	            <label>
	                <span>아이디</span>
	                	아이디가 없습니다
	            </label>
	        </div>	
		</c:if>

		<div class="form-title">
			<label>
			<c:if test="${idList!=null}">
				<button type="submit">비밀번호 찾기</button>
			</c:if>
				<input type="button" value="닫기" class="btn_navy" onclick="self.close();">
            </label>
        </div>
				
	</form>
</div>
</body>
</html>