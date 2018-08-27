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
	
	#penalty{
		position: relative;
		top:200px;
	}
	#side{
		position: relative;
		top:200px;
	}
	
	#paste{
		width:360px; height:200px; padding:0px;
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

	function penalty_update(){				
		if(document.penalty.dorm_penalty.value == ""){
			swal("벌점을 입력해 주세요.");
			document.penalty.dorm_penalty.focus();
			return false;
		}	
		
		if(document.penalty.penalty_yy.value == 0){
			swal("벌점 부여일을 지정해 주세요.");
			document.penalty.penalty_yy.focus();
			return false;
		}else{
			var penalty_yy = document.penalty.penalty_yy.value;
		}		
		
		if(document.penalty.penalty_mm.value == 0){
			swal("벌점 부여일을 지정해 주세요.");
			document.penalty.penalty_mm.focus();
			return false;
		}else{
			var penalty_mm = document.penalty.penalty_mm.value;
		}

		if(document.penalty.penalty_dd.value == 0){
			swal("벌점 부여일을 지정해 주세요.");
			document.penalty.penalty_dd.focus();
			return false;
		}else{
			var penalty_dd = document.penalty.penalty_dd.value;
		}		
		
		var currentDate = new Date();
		var month = currentDate.getMonth() +1;
		var day = currentDate.getDate();
		var year = currentDate.getFullYear();
		
		if(month < 10){
			month = "0" + month;
		}
		
		if(day < 10){
			day = "0" + day;	
		}
		
		var today = year + "-" + month + "-" + day;
		var overnight = penalty_yy + "-" + penalty_mm + "-" + penalty_dd;
		
		if(today >= overnight){
		}else{
			swal(today + "현재 날짜를 넘을 수 없습니다..");
			document.penalty.penalty_yy.focus();
			return false;
		}
			
		if(document.penalty.dorm_reason.value == ""){
			swal("벌점 사유를 입력해 주세요");
			return false;
		}
	}
  
</script>

</head>
	
<body>
<%@ include file="../../layout/header_dormitory_home.jsp"%>
<section>	
	<div style="width:400px; height:800px; display: inline; float: left; top:300px; left:150px;">
		<%@ include file="../../layout/dt_admin_side.jsp"%>
	</div>	
	<article style="height: 1100px;">					
		<div class="content">

			<div class="cen_middle" style="width:1200px;">	
				<form action="admin_penalty_upd?st_no=${dto.st_no}" name="penalty" id="penalty" method="post" onsubmit="return penalty_update();">			
						 <div >
						 <table class="st_navy" style="width:1000px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>학생 벌점 수정</h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">

								<tr>
									<td style="width:45%;">학 번</td>
									<td>
										<span style="width:400px; text-align: center;">
											${dto.st_no}
										</span>
									</td>
								</tr>
								
								<tr>
									<td style="width:45%;">벌 점</td>
									<td><span style="width:400px; text-align: center;"><input type="text" name="dorm_penalty"  value="${dto.dorm_penalty}" style="width:350px; text-align: center;"></span></td>
								</tr>
								
								<tr>
									<td style="width:55%;">벌점 부여일</td>							
								      <td style="width:45%; position: relative; left:36px;">
								          <span style="width:400px; text-align: center;">
								          	<div class="form-inline">								            
								              <div class="form-group" >
								                <select name="penalty_yy" id="penalty_yy" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Year</option>
								                  <option value="2017" >2017 </option><option value="2018" >2018 </option><option value="2019" >2019 </option><option value="2020" >2020 </option> </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			             
						
									          <div class="form-group">
								                <select name="penalty_mm" id="penalty_mm" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Month</option>
								                  <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;
								              		             
								              <div class="form-group">
								                <select name="penalty_dd" id="penalty_dd" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Date</option>
								                  <option value="01" >1 </option><option value="02" >2 </option><option value="03" >3 </option><option value="04" >4 </option><option value="05" >5 </option><option value="06" >6 </option><option value="07" >7 </option><option value="08" >8 </option><option value="09" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
								              </div>
								              </div>
							              </span>
						           </td>
								</tr>
								
								<tr>
									<td style="width:45%;">벌점 사유</td>
									<td><span style="width:400px; text-align: center;"><textarea id="paste" name="dorm_reason" style="border-radius: 12px; text-align: center;">${dto.dorm_reason}</textarea></span></td>
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
<link rel="stylesheet" href="resources/css/form-basic.css">  
<%@ include file="../../setting.jsp" %>  
<%@ include file="../dorm_setting.jsp" %>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
	
	.form-row span{
		font-size: 20px;		
	}
	.form-row input{
		height:40px;
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
	}
	
	input{
		text-align: center;
		padding:10px;
	}
	
</style>

<body>
<c:if test="${dto == null }">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 	<script type="text/javascript">
		swal("벌점 목록을 불러오는데 실패하였습니다.").then((okay) => {
			  if (okay) {
				  history.back();
				  }
				});	 -->
	</script>
</c:if>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
 function penalty_list(){
 	if(document.penalty.dorm_penalty.value == ""){
 		swal("벌점을 입력해 주세요");
 		return false;
 	}	
 	
 	i/* f(document.penalty.dorm_penalty_dt.value != ""){
 		var today = new Date();
 		var y = today.FullYear();
 		var m = today.getMonth()+1;
 		var d = today.getDate();		
 		
 		if(m < 10){
 			m = "0" + m;
 		}
 		
 		if(d < 10){
 			d = "0" + d;
 		}		
 		var ymdd = y + "-" + m + "-" + d;
 	
 		if(ymdd == document.penalty.dorm_penalty_dt.value){
 		}else{
 			swal("현재 날짜 이전으로 부여해야 합니다.");
 			document.penalty.dorm_penalty_dt.focus();
 			return false;
 		}
 	}else{
 		swal("벌점 부여일을 설정해 주세요");
 		return false;
 	}	 */
 	
 	if(document.penalty.dorm_reason.value == ""){
 		swal("벌점 사유를 입력해 주세요");
 		return false;
 	}	
 	
 	
 }





</script>

<c:if test="${fn:substring(sessionScope.id,0,1) == 0}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="cy_1">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;벌점 수정</h2><br>	
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
					
			 <form action="dt_admin_penalty_update?st_no=${dto.st_no}" name="penalty" method="post" onsubmit="return penalty_list();">			
				<div class="form-row">
		            <label>
		                <span>  학    번 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                ${dto.st_no}
		            </label>
		        </div>
	        
				<br><br>
				<div class="form-row">
		            <label>
		                <span>  벌    점 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="dorm_penalty" value="${dto.dorm_penalty}">
		            </label>
		        </div>
		  		<br><br>
				<div class="form-row">
		            <label>
		                <span> 벌점 부여일 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="date" id="Time" name="dorm_penalty_dt" value="${dto.dorm_penalty_dt}" style="width:189px;">
		            </label>
		        </div>
		        <br><br>		        				
				<div class="form-row">
		            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		               <span>벌점 사유 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="dorm_reason" value="${dto.dorm_reason}" style="width:189px;">
		            </label>
		        </div>		        
		        <br><br>
				<div class="form-row">
		            <label>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="submit" value="수정" style="text-align: center; width:80px; color: navy; background-color: white;" >&nbsp;&nbsp;
		                <input type="button" value="목록" style="text-align: center; width:80px; color: navy; background-color: white;" onclick="history.back()">
		            </label> 
		        </div>			        		   	        												
			</form> 
		</div>
	</div>
</c:if>	

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
 --%>