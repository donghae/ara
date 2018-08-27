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
	
	#ovenight_dt{
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

	function overnight_up(){	
		if(document.ovenight_dt.over_yy.value == 0){
			swal("외박 부여일을 지정해 주세요.");
			document.ovenight_dt.over_yy.focus();
			return false;
		}else{
			var over_yy = document.ovenight_dt.over_yy.value;
		}		
		
		if(document.ovenight_dt.over_mm.value == 0){
			swal("외박 부여일을 지정해 주세요.");
			document.ovenight_dt.over_mm.focus();
			return false;
		}else{
			var over_mm = document.ovenight_dt.over_mm.value;
		}

		if(document.ovenight_dt.over_dd.value == 0){
			swal("외박 부여일을 지정해 주세요.");
			document.ovenight_dt.over_dd.focus();
			return false;
		}else{
			var over_dd = document.ovenight_dt.over_dd.value;
		}		
		
		if(document.ovenight_dt.dorm_reason.value == ""){
			swal("외박 사유를 입력해 주세요.");
			document.ovenight_dt.dorm_reason.focus();
			return false;
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
		var overnight = over_yy + "-" + over_mm + "-" + over_dd;
		
		if(today <= overnight){
		}else{
			swal(today + "  이전의 날짜로는 외박신청 할 수 없습니다.");
			document.ovenight_dt.over_yy.focus();
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
				<form action="dt_stu_overnight_revision?st_no=${dto.st_no}&overnight_no=${dto.overnight_no}" name="ovenight_dt" id="ovenight_dt" method="post" onsubmit="return overnight_up();">
						 <div >
						<c:if test="${dto != null }"> 
						 <table class="st_navy" style="width:1100px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>외박 신청 수정</h2></th>
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
									<td style="width:45%;">이 름</td>
									<td><span style="width:400px; text-align: center;">${dto.st_name}</span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">호 실</td>
									<td><span style="width:400px; text-align: center;">${dto.dorm_room}</span></td>
								</tr>
								
								<tr>
									<td style="width:65%;">외박 신청일</td>							
								      <td style="width:40%;">
								          <span style="width:400px; text-align: center;">
								            <div class="form-inline">
								              <div class="form-group" >
								                <select name="over_yy" id="over_yy" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Year</option>
								                  <option value="2017" >2017 </option><option value="2018" >2018 </option><option value="2019" >2019 </option><option value="2020" >2020 </option> </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			             
						
									          <div class="form-group">
								                <select name="over_mm" id="over_mm" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Month</option>
								                  <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
								              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								              		             
								              <div class="form-group">
								                <select name="over_dd" id="over_dd" class="form-control" style=" height:45px; color: navy;">
								                  <option value="0">Date</option>
								                  <option value="01" >1 </option><option value="02" >2 </option><option value="03" >3 </option><option value="04" >4 </option><option value="05" >5 </option><option value="06" >6 </option><option value="07" >7 </option><option value="08" >8 </option><option value="09" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
								              </div>
								              </div>
							              </span>
						           </td>
								</tr>
								
								<tr>
									<td style="width:45%;">외박 신청 사유</td>
									<td><span style="width:400px; text-align: center;"><textarea id="paste" name="dorm_reason" style="border-radius: 12px;"></textarea></span></td>
								</tr>	

								<tr>
									<td style="width:45%;"> </td>
									<td><span style="width:400px; text-align: center;"></span></td>
								</tr>																																														
							</tbody>
						</table>
						</c:if>
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