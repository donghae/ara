<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript" src="resources/js/student.js"></script> 
<style>
	.bg-gray {
		background-color: #E5E7EA;
	}
	
	#admin_stu_ins{
		position: relative;
		top:200px;
	}
	#side{
		position: relative;
		top:200px;
	}
	
	#paste{
		width:400px; height:200px; padding:0px;
	}	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<head>
	
	<script type="text/javascript">

  var loadFile = function(event) {

    var output = document.getElementById('output');

    output.src = URL.createObjectURL(event.target.files[0]);
  };

	function stu_insert(){	
		if(document.admin_stu_ins.st_no.value == ""){
			swal("학번을 입력해 주세요.");
			document.admin_stu_ins.st_no.focus();
			return false;
		}
		
		if(document.admin_stu_ins.dorm_room.value == ""){
			swal("기숙사 호실을 입력해 주세요.");
			document.admin_stu_ins.dorm_room.focus();
			return false;
		}
		
		if(document.admin_stu_ins.dorm_st_dt.value == ""){
			swal("기숙사 시작일을 입력해 주세요");
			return false;
		}else{
			var stDt = document.admin_stu_ins.dorm_st_dt.value;
		}
		
		if(document.admin_stu_ins.dorm_end_dt.value == ""){
			swal("기숙사 종료일을 입력해 주세요");
			return false;			
		}else{
			var enDt = document.admin_stu_ins.dorm_end_dt.value;				
		}
		
		if(stDt < enDt){
		}else{
			swal("기숙사 시작일이 종료일보다 크지 않아야 합니다.");
			document.admin_stu_ins.dorm_st_dt.focus();
			return false;
		}
		
	}  
  
</script>

</head>
	
<body>
<%@ include file="../../layout/header_dormitory_home.jsp"%>
<section>	
	<article style="height: 1100px;">
			<%-- <div id="side" style="width:300px; height:500px; float: left; display: inline-block;">
				<%@ include file="../../layout/dt_admin_side.jsp"%>
			</div> --%>	
			
		<div class="content">

			<div class="cen_middle">	
				<form action="admin_stu_insert" name="admin_stu_ins" id="admin_stu_ins" method="post" onsubmit="return stu_insert();">
						 <div >
						 <table class="st_navy" style="width:1100px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>학생 등록</h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">

								<tr>
									<td style="width:45%;">학 번</td>
									<td>
										<span style="width:400px; text-align: center;"><input type="text" name="st_no" style="width:300px; text-align: center;"></span>
									</td>
								</tr>
								
								
								<tr>
									<td style="width:45%;">호 실</td>
									<td><span style="width:400px; text-align: center;"><input type="text" name="dorm_room"  style="width:300px; text-align: center;"></span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">기숙사 시작일</td>
									<td><span style="width:400px; text-align: center;"><input type="Date" name="dorm_st_dt"   style="width:300px; padding-left:100px;"></span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">기숙사 종료일</td>
									<td><span style="width:400px; text-align: center;"><input type="Date" name="dorm_end_dt"   style="width:300px; padding-left:100px;"></span></td>
								</tr>
	

								<tr>
									<td style="width:45%;"> </td>
									<td><span style="width:400px; text-align: center;"></span></td>
								</tr>																																														
							</tbody>
						</table>

						</div>
						<div class="form-row" style="padding-top:70px">
							<div class="cen_middle"><br>
								  <input class="btn_navy" type="submit" value="수정" style="font-size:20px;">
								  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								  <input class="btn_navy" type="button" value="목록" style="font-size:20px;" onclick='history.back();'>  
						 	</div> 						 							 	
						</div>
				</form>
			</div>
		</div>
	
	</article>
</section>	
</body>
<%@ include file="../../layout/footer_lib2.jsp"%>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<%@ include file="../dorm_setting.jsp" %>

 <style>
	.penalty{
		position: relative;
		top:250px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	top:50px;
	}
</style>

<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">

		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
	
		<div>
			<%@ include file="../../layout/dt_stu_insert.jsp" %>
		</div>



	</div>
</c:if>	

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
 --%>