<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css">
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
		url : '${pageContext.request.contextPath}/lib_seat_sub?rdRoom_no='+floor,
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
		
		//빈 좌석일 시
		if(seat_state == 0) {
			
			swal({
				  title: rdRoom_no+"호 "+seat_no+" 좌석을 이용하시겠습니까?",
				  buttons: true,
				  dangerMode: true,
				})
				.then((okay) => {
				  if (okay) {
					  var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
					  sendRequest(seat_callback, "lib_seat_use","post",params);						
				  } else {					  
				    return false;
				  }
				});
				
		}
				
		//이용 취소,중지
		if(seat_state == 1) {
			
			swal({
				  title: rdRoom_no+"호 "+seat_no+" 좌석을 이용 취소 하시겠습니까?",
				  buttons: true,
				  dangerMode: true,
				})
				.then((okay) => {
				  if (okay) {
					  var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
						sendRequest(seat_callback, "lib_seat_useCancle","post",params);						
				  } else {
				    return false;
				  }
				}); 
				
		}
	});	
});


function seat_callback() {
	//응답받은 값을 저장
	var view = document.getElementById("view");
	
	if(httpRequest.readyState == 4) { 
		
		if(httpRequest.status == 200) { //200 : 정상종료
		
			var data = httpRequest.responseText;
			view.innerHTML = data;
			
		} else {
			view.innerHTML = "에러발생";
		}
	} else {
		view.innerHTML = "loading..";
	}	
}	
</script>


<body>
<!-- 헤더 -->
<jsp:include page="../../layout/header_lib.jsp"/>


<!-- 좌석 현황 : 열람실 선택 -->
<section>
	
	<form class="cen_middle" name="seat_view">				
		<!-- 좌석 예약 -->
		<article class="back_white">
			<div id="header_fill" style="height:200px;"></div>
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