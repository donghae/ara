<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/form-basic.css">
<script type="text/javascript">
	function loginChk(){
		if(!document.loginForm.userId.value){
			document.loginForm.userId.focus();
			return false;
		}else if(!document.loginForm.passwd.value){
			document.loginForm.passwd.focus();
			return false;
		}
	}
	function findId(){
		var url = "findId";
		window.open(url, "아이디찾기", "menubar=no, width=700, height=500");
	}
	function findPwd(){
		var url = "findPwd";
		window.open(url, "비밀번호찾기", "menubar=no, width=700, height=700");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<jsp:include page="../layout/header_ara.jsp" />
<section style="height:71%;">	
	<article>
	
	
			<div class="main-content" style="padding-top:50px;">
				<form name="loginForm" action="login" method="post" class="form-basic" onsubmit="return loginChk();">
					
					<div class="form-title-row">
						<h1>로그인</h1>
					</div>
						
					<div class="form-row">
			            <label>
			                <span>아이디</span>
			                <input type="text" name="userId" id="userId" required/>
			            </label>
			        </div>
			        
			        <div class="form-row">
			            <label>
			                <span>비밀번호	</span>
			                <input type="password" name="passwd" id="passwd" required/>
			            </label>
			        </div>
					
					<div class="form-title">
			       		<label>
			            	<button type="submit">LOGIN</button>
			            </label>
			        </div>		
					
					<div class="cen_middle" style="padding-top:20px;">			       		
		            	<input type="button" value="아이디 찾기" class="btn_navy" style="padding:10px" onclick="findId();">&nbsp;&nbsp;
						<input type="button" value="비밀번호 찾기" class="btn_navy" style="padding:10px" onclick="findPwd();">
			        </div>			
				
				</form>
			</div>

	</article>
</section>
	<%@ include file="../layout/footer_ara.jsp"%>
</body>
</html>