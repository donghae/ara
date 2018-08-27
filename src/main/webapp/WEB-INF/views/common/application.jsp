<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript" src="resources/js/student.js"></script> 
<style>
.bg-gray {
	background-color: #E5E7EA;
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

<jsp:include page="../layout/header_ara.jsp" />
<section>	
	<article>
	
		<div class="content">
			<div class="cen_middle">

				<form action="appPro" method="post" enctype="multipart/form-data" name="myForm" onsubmit="return inputCheck();">
						 <table class="st_navy" style="width:1000px;">
							<thead class="st_navy">
								<tr>
									<th colspan="3"><h2>입 학 신 청 서</h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">
								<tr>
									<td style="width:13%;">성 명</td>
									<td><span style="float:left;"><input type="text" name="name"></span></td>
									<td rowspan="3" style="width:20%;">									
										<input type="file" name="image" id="image" accept="image/*"  onchange="loadFile(event)" style="width: 250px;">
										<img id="output" width="250" height="250"/>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">주민등록번호</td>
									<td>
										<span style="float:left;">
											<input type="text" name="REGI_NO1" maxlength="6" style="width: 120px"> - 									
											<input type="text" name="REGI_NO2" maxlength="7" style="width: 140px">
										</span>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">학 과</td>
									<td>
										<span style="float:left;">
											<select class="input" name="major">
												<option value="101">기계공학</option>
												<option value="102">소프트웨어공학</option>
												<option value="103">식품공학</option>
												<option value="104">전기공학</option>
												<option value="105">화학</option>
												
												<option value="201">물리학</option>
												<option value="202">미생물학</option>
												<option value="203">분자생물학</option>
												<option value="204">생명과학</option>
												<option value="205">화학</option>
												
												<option value="301">경영학</option>
												<option value="302">경제학</option>
												<option value="303">심리학</option>
												<option value="304">정치외교학</option>
												<option value="305">행적학</option>
												
												<option value="401">도예</option>
												<option value="402">무용</option>
												<option value="403">문예창작</option>
												<option value="404">실용음악</option>
												<option value="405">조소</option>
												
												<option value="501">국어국문학</option>
												<option value="502">사학</option>
												<option value="503">영어영문학</option>
												<option value="504">철학</option>
												<option value="505">포르투갈어</option>
												
												<option value="601">국제스포츠학</option>
												<option value="602">생활체육학</option>
												<option value="603">스포츠경영학</option>
												<option value="604">스포츠응용산업학</option>
												<option value="605">체육교육학</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">성 적</td>
									<td colspan="2">
										<span style="float:left;"><input type="text" name="grade"></span>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">출신 학교</td>
									<td colspan="2">
										<span style="float:left;"><input type="text" name="highSchool"></span>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">이메일</td>
									<td colspan="2">
										<span style="float:left;">
											<input type="text" name="email1" maxlength="10" style="width: 150px"> @ 
											<input type="text" name="email2" maxlength="20" style="width: 220px">
											<select class="input" name="email3" onchange="selectEmailCheck();">
												<option value="0">직접 입력</option>
												<option value="gmail.com">구글</option>
												<option value="daum.net">다음</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td style="width:13%;">연락처</td>
									<td colspan="2">
										<span style="float:left;">
											<input type="text" name="hp1" maxlength="3" style="width: 80px"> - 
											<input type="text" name="hp2" maxlength="4" style="width: 80px"> - 
											<input type="text" name="hp3" maxlength="4" style="width: 100px">
										</span>
									</td>									
								</tr>
								<tr>
									<td>장애 여부</td>	
									<td colspan="2">				
										<span style="float:left;">
											<select class="input" name="disability">
												<option value="0">이상 없음</option>
												<option value="1">장애 있음</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td rowspan="3" style="width:13%;">주 소</td>
									<td colspan="2">
										<span style="float:left;">
											<input name="zipcode" type="text" readonly="readonly" style="width:150px" />
											<input name="searchAddrButton" value="주소 검색" type="button" 
												onclick="openAddr();" class="btn_navy" style="width:70px;color:white;padding:4px"/>
										</span>
									</td>							
								</tr>
								<tr>
									<td colspan="2">
										<span style="float:left;">
											<input style="width:400px"  name="address1" type="text" readonly="readonly"/>
										</span>
									</td>
									
								</tr>
								<tr>
									<td colspan="2" style="border-bottom:1px solid">	
										<span style="float:left;">
											<input style="width:400px"  name="address2" type="text" />
										</span>
									</td >
								</tr >
							</tbody>
						</table>
						
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
<%@ include file="../layout/footer_lib2.jsp"%>
</html>



