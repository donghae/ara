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
  
  
	function penaltys(){		
		 if(document.penalty.st_no.value == ""){
			swal("학번을 입력해 주세요.");
			document.penalty.st_no.focus();
			return false;
		}
		
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
			swal(today + "  이후의 날짜로는 벌점 등록 할 수 없습니다.");
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
<c:if test="${sessionScope.id != null}">
	<c:set var="st_no" value="${sessionScope.id}" />
</c:if>	
<body>
<%@ include file="../../layout/header_dormitory_home.jsp"%>
<section>	
	<div style="width:400px; height:800px; display: inline; float: left; top:300px; left:150px;">
		<%@ include file="../../layout/dt_admin_side.jsp"%>
	</div>
	
	<article style="height: 1100px;">
			<%-- <div id="side" style="width:300px; height:500px; float: left; display: inline-block;">
				<%@ include file="../../layout/dt_admin_side.jsp"%>
			</div> --%>	
			
		<div class="content" >
			<div class="cen_middle">	
				<form action="dt_admin_penalty_admin" name="penalty" id="penalty" method="post" onsubmit="return penaltys();">	
						 <div >
						 <table class="st_navy" style="width:800px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>벌 점 </h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">
								<tr>
									<td style="width:45%;">학 번 </td>
									<td><span style="width:400px; text-align: center;"><input type="text" name="st_no" id="st_no" style="width:390px; text-align: center;"></span></td>
								</tr>

								<tr>
									<td style="width:45%;">벌 점</td>
									<td><span style="width:400px; text-align: center;"><input type="text" name="dorm_penalty" id="dorm_penalty" style="width:390px; text-align: center;"></span></td>
								</tr>																
								
								<tr>
									<td style="width:49%;">벌점 부여일</td>							
								      <td style="width:45%;">
								          <span style="width:400px; text-align: center;">
								            <div class="form-inline">
								              <div class="form-group" >
								                <select name="penalty_yy" id="penalty_yy" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Year</option>
								                  <option value="2017" >2017 </option><option value="2018" >2018 </option><option value="2019" >2019 </option><option value="2020" >2020 </option> </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			             
						
									          <div class="form-group">
								                <select name="penalty_mm" id="penalty_mm" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Month</option>
								                  <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								              		             
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
									<td><span style="width:400px; text-align: center;"><textarea id="paste" name="dorm_reason" style="border-radius: 12px;"></textarea></span></td>
								</tr>
									
								<tr>
									<td style="width:45%;"></td>
									<td><span style="width:400px; text-align: center;"></span></td>
								</tr>											
							</tbody>
						</table>
						</div>
						<div class="form-row" style="padding-top:70px">
							<div class="cen_middle"><br>
								  <input class="btn_navy" type="submit" value="등록" style="font-size:20px;">
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