<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>

 <style>
	.penalty{
		position: relative;
		top:235px;
	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	top:50px;
	}
	
	table td{
		font-size: 20px;
		padding:40px;
		margin-bottom: 5px;
	}
	
	.form-row input{
		height:40px;
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
	}
	
	table{
		text-align: center;
	}	
</style>
<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<c:if test="${dto !=null}">
		<div  style="width: 1200px; height: 80%;">
			<table>			
				<tr>
					<td align="center" >글번호</td>
					<td align="left">${dto.dorm_n_no}</td>	
				</tr>
				
				<tr>
					<td align="center" >조회수</td>
					<td align="left">${dto.dorm_n_cnt}</td>
				</tr>				
				
				<tr>
					<td align="center">작성자</td>
					<td align="left">
						<c:if test="${dto.ad_no == '018104001'}">
							박희현
						</c:if>
						<c:if test="${dto.ad_no == 018202001}">
							김동해
						</c:if>
						<c:if test="${dto.ad_no == 018304001}">
							이아름
						</c:if>											
						<c:if test="${dto.ad_no == 018401001}">
							이승희
						</c:if>						
						<c:if test="${dto.ad_no == 018505001}">
							최유민
						</c:if>
						<c:if test="${dto.ad_no == 018601001}">
							김광민
						</c:if>																	
					</td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td align="left">${dto.dorm_n_title}</td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td align="left">${dto.dorm_n_content}</td>
				</tr>
																										
			</table>
			<form action="dt_admin_notice_modify?dorm_n_no=${dto.dorm_n_no}&ad_no=${dto.ad_no}&dorm_n_dt=${dto.dorm_n_dt}" method="post" name="notice">
		        <br><br>
				<div class="form-row">
		            <label>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="submit" value="수정" style="text-align: center; width:80px; color: navy; background-color: white;" 
		                		>&nbsp;&nbsp;
		                <input type="button" value="목록" style="text-align: center; width:80px; color: navy; background-color: white;" onclick="history.back()">
		            </label>
		        </div>
		    </form>    			
			</div>
		</c:if>		
		</div>
</c:if>	

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
