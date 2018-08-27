<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/form-basic.css">
<script type="text/javascript" src="${path}resources/js/library.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script type="text/javascript">
function libLogin_written() {

	if (!document.libLoginForm.userId.value) {
		swal("아이디를 입력하세요").then((okay) => {
			  if (okay) {
				  document.libLoginForm.userId.focus();
					return false;
				  }
				});
		
	}
	if (!document.libLoginForm.passwd.value) {
		swal("비밀번호를 입력하세요").then((okay) => {
			  if (okay) {
				  document.libLoginForm.passwd.focus();
					return false;
				  }
				});
	}
	
	document.libLoginForm.submit();

}
</script>
<body>

</head>
	<div class="main-content" style="padding-top:0px;" id="hidelibInput">	
		<form style="magin:0px;" action="lib_loginPro" name="libLoginForm" class="form-basic" 
			method="post" onsubmit="return libLogin_written();">
		
			<div class="form-title-row">
				<h1>로 그 인</h1>
			</div>
	
			<div class="form-row" >
				<label>
					<span>ID</span>
					<input style="display:inline-block; width:180px;" type="text" name="userId">
	            </label>
	        </div>
	 		
			<div class="form-row">
	            <label>
	                <span>PW</span>
	                <input style="display:inline-block; width:180px;" type="password" name="passwd">
	            </label>
	        </div>
		
	        <div class="form-title-row" style="height:0px;">
	       		<label>
	            	<button type="submit">LOGIN</button>
	            </label>
	        </div>
	
	    </form>
	</div>
	
</body>
</html>