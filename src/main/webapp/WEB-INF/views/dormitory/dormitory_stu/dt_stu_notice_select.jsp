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
	
	#form{
		position: relative;
		top:200px;
		margin:30px;
	}
	#side{
		position: relative;
		top:200px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<head>
	
	<script>

  var loadFile = function(event) {

    var output = document.getElementById('output');

    output.src = URL.createObjectURL(event.target.files[0]);

  };

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

				<form action="appPro" method="post" enctype="multipart/form-data" name="myForm" id="form" onsubmit="return inputCheck();">
						 <div >
						<c:if test="${dto != null }"> 
						 <table class="st_navy" style="width:1100px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>공 지 사 항</h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">
								<tr>
									<td style="width:45%;">공 지 번 호</td>
									<td><span style="width:400px; text-align: center;">${number}<c:set var="number" value="${number-1}" /></span></td>
								</tr>

								<tr>
									<td style="width:45%;">작 성 자</td>
									<td>
										<span style="width:400px; text-align: center;">
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
										</span>
									</td>
								</tr>
								
								<tr>
									<td style="width:45%;">제 목</td>
									<td><span style="width:400px; text-align: center;">${dto.dorm_n_title }</span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">내 용</td>
									<td><span style="width:400px; text-align: center;">${dto.dorm_n_content }</span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">작 성 일</td>
									<td><span style="width:400px; text-align: center;">${dto.dorm_n_dt }</span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">조 회 수 </td>
									<td><span style="width:400px; text-align: center;">${dto.dorm_n_cnt }</span></td>
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
							<div class="cen_middle">
								  <input class="btn_navy" type="submit" value="신청하기" style="font-size:20px;"> 
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



