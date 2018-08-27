<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../setting.jsp" %>

<script type="text/javascript">
	function changeDuration(){
		var video = document.getElementById("video");
		var totalTime = document.getElementById("totalTime");
		var currentTime = document.getElementById("currentTime");
		var duration = video.duration;
		var durationmin = Math.floor(duration / 60);
		var durationsec = Math.floor(duration - (durationmin * 60));
		if (durationmin < 10) {
		    durationmin = "0" + durationmin;
		}
		if (durationsec < 10) {
		    durationsec = "0" + durationsec;
		}
		var durationTotal = durationmin + ":" + durationsec;
		totalTime.innerHTML = durationTotal;
		
	/*  */
	
	
        var current = video.currentTime;
        var currentmin = Math.floor(current / 60);
        var currentsec = Math.floor(current - (currentmin * 60));
        if (currentmin < 10) {
            currentmin = "0" + currentmin;
        }
        if (currentsec < 10) {
            currentsec = "0" + currentsec;
        }
        var currentTotal = currentmin + ":" + currentsec;
        currentTime.innerHTML = currentTotal;
	}
	function startTime(){
		var startTime = document.getElementById("startTime");
		var date = new Date();
		
		var startYear = document.getElementById("startYear");
		var startMonth = document.getElementById("startMonth");
		var startDate = document.getElementById("startDate");
		var startHours = document.getElementById("startHours");
		var startMinutes = document.getElementById("startMinutes");
		var startSeconds = document.getElementById("startSeconds");
		
		startYear.value = date.getFullYear();
		startMonth.value = (date.getMonth() + 1);
		startDate.value = date.getDate();
		startHours.value = date.getHours();
		startMinutes.value = date.getMinutes();
		startSeconds.value = date.getSeconds();
		
		var time = startYear.value+"/"+
					startMonth.value+"/"+
					startDate.value+"-"+
					startHours.value+":"+
					startMinutes.value+":"+
					startSeconds.value;
		startTime.innerHTML = time;
	}
	function endTime(round_no){
		var endTime = document.getElementById("endTime");
		var playTime = document.getElementById("playTime");
		
		var startYear = document.getElementById("startYear").value;
		var startMonth = document.getElementById("startMonth").value;
		var startDate = document.getElementById("startDate").value;
		var startHours = document.getElementById("startHours").value;
		var startMinutes = document.getElementById("startMinutes").value;
		var startSeconds = document.getElementById("startSeconds").value;
		
		var date = new Date();
		
		date.setFullYear(startYear);
		date.setMonth(startMonth);
		date.setDate(startDate);
		date.setHours(startHours);
		date.setMinutes(startMinutes);
		date.setSeconds(startSeconds);
		
		var endDate = new Date();
				
		var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - date);

		var time = endDate.getFullYear()+"/"+
					(endDate.getMonth() + 1)+"/"+
					endDate.getDate()+"-"+
					timeGap.getHours()+":"+
					timeGap.getMinutes()+":"+
					timeGap.getSeconds();
		endTime.innerHTML = time
		playTime.innerHTML = timeGap.getHours();
		/* var tt = opener.document.getElementById("totalTime").value * 1;
		var ts = 0;
		var tm = 0;
		if(((tt%100)+timeGap.getSeconds())>59){
			ts = ((tt%100)+timeGap.getSeconds())%60;
			tm += 1;
		}else{
			ts = (tt%100)+timeGap.getSeconds()*1;
		}
		tm += parseInt(tt/100) + timeGap.getMinutes()*1;
		opener.document.getElementById("totalTime").value = parseInt(tm*100 + ts); */
		var tt = opener.document.getElementById("totalTime_"+round_no).value * 1;
		var ts = (timeGap.getHours() * 3600) + (timeGap.getMinutes()*60) + timeGap.getSeconds();
		
		opener.document.getElementById("totalTime_"+round_no).value = parseInt(ts+tt);
		opener.document.getElementById("totalTime2_"+round_no).value = (parseInt(ts+tt)/60)+"분 "+(parseInt(ts+tt)%60)+"초";
	}
	function watch_time(beforeStr){		
		var param = beforeStr.toString().split("|");
		/* alert(beforeStr); */
		var lec_no = param[0];
		var round_no = param[1];
		/* alert(lec_no +" && "+ round_no); */
		var endTime = document.getElementById("endTime");
		var playTime = document.getElementById("playTime");
		
		var startYear = document.getElementById("startYear").value;
		var startMonth = document.getElementById("startMonth").value;
		var startDate = document.getElementById("startDate").value;
		var startHours = document.getElementById("startHours").value;
		var startMinutes = document.getElementById("startMinutes").value;
		var startSeconds = document.getElementById("startSeconds").value;
		
		var date = new Date();
		
		//기존에 있던 시간을 가져옴
		date.setFullYear(startYear);
		date.setMonth(startMonth);
		date.setDate(startDate);
		date.setHours(startHours);
		date.setMinutes(startMinutes);
		date.setSeconds(startSeconds);
		
		//현재시간을 가져온다
		var endDate = new Date();
				
		//현재시간에서 기존시간을 뺀다(시간차이 구함)
		var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - date);

		//부모창에 있는 값을 가져옴		
		var tt = opener.document.getElementById("totalTime_"+round_no).value * 1;
		
		//시간차이를 초로 바꿈
		var ts = (timeGap.getHours() * 3600) + (timeGap.getMinutes()*60) + timeGap.getSeconds();
		
		//두 값을 더함
		var time = parseInt(ts+tt);
		
		//서비스로 시간을 가져간다
		window.location = "cy_attendance?lec_no="+lec_no+"&round_no="+round_no+"&time="+time;
		
	}
</script>

<body>
	<%-- <%@include file="../layout/header_ara.jsp"%> --%>

		
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<!-- Popular -->

	<div class="main-content">
		<video id="video" width="750" height="550" 
		controls ondurationchange="changeDuration()" ontimeupdate="changeDuration()" onplay="startTime()" onpause="endTime(${round_no})">
		    <source src="./resources/video/${file_name}" type="video/mp4">
		    
		</video>
		<input type="hidden" id="startYear">
		<input type="hidden" id="startMonth">
		<input type="hidden" id="startDate">
		<input type="hidden" id="startHours">
		<input type="hidden" id="startMinutes">
		<input type="hidden" id="startSeconds">
		<button class="btn_mint" type="button" id="close" onclick="video.pause(); watch_time('${lec_no}|${round_no}'); ">종료</button>
		<button class="btn_mint" type="button" id="play" class="btn_play">재생</button>
		<!-- <button type="button" id="pause" class="btn_pause" style="display:none">일시정지</button>
		<button type="button" id="stop" class="btn_stop">정지</button>
		<button type="button" id="mute" class="btn_mute">음소거</button>
		<button type="button" id="unmute" class="btn_vm" style="display:none">볼륨있음</button>
		<button type="button" id="vmup" class="btn_vmup">볼륨UP</button>
		<button type="button" id="vmdown" class="btn_vmdown">볼륨DOWN</button>
		<button type="button" id="full" class="btn_fullscreen">전체화면</button> -->
		<div id="currentTime" class="current_time" style="display:none">00:00</div>
		<div id="totalTime" class="total_time" style="display:none">00:00</div>
		<div id="startTime" class="startTime" style="display:none">00:00</div>
		<div id="endTime" class="endTime" style="display:none">00:00</div>
		<div id="playTime" class="playTime" style="display:none">00:00</div>
		        
    </div>
	<%-- <%@include file="../layout/footer_lib.jsp"%> --%>
</body>
</html>