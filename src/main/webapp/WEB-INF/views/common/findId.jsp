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
	<form name="findForm" class="form-basic" action="findIdPro" onsubmit="return chk();">
		
		<div class="form-title-row">
			<h1>아이디 찾기</h1>
		</div>
		
		<div class="form-row" >
			<label>
				<span>이 름</span>
				<input type="text" name="userName" required>
            </label>
        </div>
        
        <div class="form-row" >
			<label>
				<span>생년월일</span>
				<input type="text" size="6" maxlength="6" name="birth1" required> -
				<input type="text" maxlength="1" size="1" name="birth2" style="width:2px"required>******
            </label>
        </div>
        
		 <div class="form-title">
       		<label>
            	<button type="submit">아이디 찾기</button>
            </label>
        </div>	
					
	</form>
</div>
</body>
</html>