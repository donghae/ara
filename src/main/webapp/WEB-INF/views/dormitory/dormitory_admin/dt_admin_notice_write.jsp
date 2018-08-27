<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  

 <style>
	.penalty{
		position: relative;
		top:320px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	}
	
	table td{
		font-size: 20px;
		padding:28px;
		margin-bottom: 5px;
	}
	
	 input{
		height:40px;
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
		 text-align: center;
		 
	}
	
	textarea{
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
		 text-align: center;
		 
	}
	
	table{
		text-align: center;
	}	
	
	form{
		position:relative;
		top:-70px;
		margin-left:250px;
		
	}
</style>

<script type="text/javascript">

	function notice_wr(){
		if(document.notice_ins.ad_no.value == ""){
			alert("관리자 번호를 입력해 주세요");
			return false;
		}	
		
		if(document.notice_ins.dorm_n_title.value == ""){
			alert("제목을 입력해 주세요");
			return false;
		}	
		
		if(document.notice_ins.dorm_n_content.value == ""){
			alert("내용을 입력해 주세요");
			return false;
		}
		
	}

</script>

<body>
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="cy_1">
			<h2>공지 사항</h2>					
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
			<form action="dt_admin_notice_write_ins" name="notice_ins" method="post" onsubmit="return notice_wr();">
				<table>											
					<tr>
						<td align="center" style="width:120px;">관리자 번호</td>
						<td align="left"><input type="text" name="ad_no" style="width:355px;"></td>
					</tr>
					<tr>
						<td align="center" style="width:100px;">제목</td>
						<td align="left"><input type="text" name="dorm_n_title" style="width:355px;"></td>
					</tr>
					<tr>
						<td align="center" style="width:100px;">내용</td>
						<td align="left"><textarea rows="7" cols="32" name="dorm_n_content"></textarea></td>
					</tr>
																										
				</table>
			
		        <br><br>
				<div class="form-row" style="margin-left:-180px;">
		            <label style="margin-left:120px;">
		                <input type="submit" value="등록" style="text-align: center; width:80px; color: navy; background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="button" value="목록" style="text-align: center; width:80px; color: navy; background-color: white;" onclick="history.back()">
		            </label>
		        </div>
		        </form>			
		</div>
	</div>

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
