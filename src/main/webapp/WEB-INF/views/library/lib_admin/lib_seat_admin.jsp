<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css">

<!-- request.js를 resources 폴더안에 넣는다 -->
<script src="resources/js/request.js"></script>
<script type="text/javascript" src="${path}resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function floor_change(){
	
	$('#del').remove();
	
	if(floor.value != null) {		
		getSeatView();
	}
}


function getSeatView() {
	
	var floor = document.getElementById("floor").value;	

	$.ajax({
		url : '${pageContext.request.contextPath}/lib_seat_sub_admin?rdRoom_no='+floor,
		type : 'GET', 	
		data : 'text',
		
		success : function(data) {
			$('#view').html(data);
		}, 
		error : function() {
			return false;
		}
	});	
	
	setTimeout("getSeatView()", 1000);
}


$(document).ready(function(){
	$(document).on("click", ".seat_color", function() {
		
		
		//열람실 번호
		var rdRoom_no = document.getElementById("floor").value;
		//좌석 번호- attr('속성명') : 속성의 이름을 가져온다
		var data = $(this).attr('id');
		var seat_no = data.split("_")[0];
		var seat_state = data.split("_")[1];

		//이용중 좌석일 시, 이용자의 정보를 확인
		if(seat_state == 1) {
			
			var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
			sendRequest(user_callback, "lib_seat_user","post",params);						
		}
		
		//이용중 좌석이 아닐 시, 이용등록
		if(seat_state == 0) {	
			
			var id = prompt("아이디를 입력하세요.", "ARA UNIVERSITY LIBRARY"); 
			if(id!=null){ 
				window.location="lib_seat_use_admin?seat_no="+seat_no+"&rdRoom_no="+rdRoom_no+"&user_no="+id;
			} else {
				return false;
			}									    				
		}		
	 }); 
});

//빈 줄 없애기
function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g,"");
}


function user_callback() {
	
	if(httpRequest.readyState == 4) { 		
		if(httpRequest.status == 200) { //200 : 정상종료
			
			var data = trim(httpRequest.responseText);
			var result = data.split("|");

			var seat_stop = confirm(result[0]+result[1]+"\n"+result[2]+"\n"+result[3]+"\n"+result[4]+"\n"+result[5]);			
			if(seat_stop == true) {				
				
				var room = result[1].split(":")[1];
				var seat = result[2].split(":")[1];
				var userr = result[3].split("(")[1];
				var user = userr.split(")")[0];
				
				window.location="lib_seat_stopPro?user_no="+user+"&seat_no="+seat+"&rdRoom_no="+room;
			} else {
				return false;
			}
		
		} else {
			alert("에러발생");
		}
	}
}

</script>




<jsp:include page="../../layout/header_lib_admin.jsp"/>


<body>

<!-- 좌석 현황 : 열람실 선택 -->
<section>		
	<form class="cen_middle" name="seat_view">				
		<!-- 좌석 예약 -->
		<article class="back_white">						
			
			<div class="content">
				
				<div>
					<select id="floor" class="vertical" style="width:90px;" onchange="floor_change();">		
						<option id="del">층</option>			
						<option value="101">1F</option>
						<option value="201">2F</option>
						<option value="301">3F</option>
					</select>				
				</div>
				<br><br><br>
				
				
				<div id="view" style="magin:0px; padding:0px; height:800px;"></div>
			</div>					
		</article>
	</form>		
</section>


<jsp:include page="../../layout/footer_ara.jsp"/>
</body>