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
	<form name="findForm" class="form-basic" action="findPwdPro">
	
		<div class="form-title-row">
			<h1>비밀번호 찾기</h1>
		</div>
				
		<div class="form-row">
            <c:if test="${idList!=null}">
            	<label>
                	이메일로 비밀번호가 전송되었습니다.
            	</label>							
			</c:if>
			<c:if test="${idList==null}">
				<label>
                	비밀번호 찾기에 실패했습니다.
            	</label>							
			</c:if>
        </div>
	
		<div class="form-title">
       		<label>
            	<input type="button" value="닫기" class="btn_navy" onclick="self.close();">	
            </label>
        </div>
	</form>
</div>
</body>
</html>