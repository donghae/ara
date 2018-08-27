<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>   
<link rel="stylesheet" href="resources/css/form-basic.css">
<script src="${path}resources/js/request.js"></script>

<script type="text/javascript">

//도서 기록 조회
function tab_change(){	
	//대여 현황
	if(document.getElementById("tab1").checked) {
		
		var state = "loan_state=1&viewNum=1";
		sendRequest(loanlist_callback, "lib_loanSuperlist","post",state);
	}
 	//반납 현황
	if(document.getElementById("tab2").checked) {
		
		var state = "loan_state=12&viewNum=2";
		sendRequest(loanlist_callback, "lib_loanSuperlist","post",state);
	}	
} 


//도서 기록 결과
function loanlist_callback() {
	//응답받은 값을 저장
	var viewList = document.getElementsByClassName( "viewList" ); 
	
	if(viewList != null) {		
		for(var i=0; i<viewList.length; i++) {
			if(httpRequest.readyState == 4) { 
							
				if(httpRequest.status == 200) { //200 : 정상종료
					
					var data = httpRequest.responseText;
					viewList[i].innerHTML = data;
								
				} else {
					viewList[i].innerHTML = "에러발생";
				}
			} else {
				viewList[i].innerHTML = "loading..";
			}
		}
	}
}


//도서 처리 양식 결과
function tabForm_change() {
	//대여 
	if(document.getElementById("tab1_2").checked) {	
		
		var string = $("form[name=loanForm]").serialize();
		sendRequest(loanForm_callback, "lib_loanForm","get",string);
	}
	//반납
	if(document.getElementById("tab2_2").checked) {	
		
		var string = $("form[name=returnForm]").serialize();
		sendRequest(loanForm_callback, "lib_returnForm","get",string);
	}
 	//연장
	if(document.getElementById("tab3_2").checked) {	
		
		 var string = $("form[name=renewForm]").serialize();
		 sendRequest(loanForm_callback, "lib_renewForm","get",string);		
	}  
}


//도서 처리 양식
function loanForm_callback() {
	//응답받은 값을 저장
	var viewForm = document.getElementsByClassName("viewForm"); 
	
	if(viewForm != null) {		
		for(var i=0; i<viewForm.length; i++) {
			if(httpRequest.readyState == 4) { 
							
				if(httpRequest.status == 200) { //200 : 정상종료
					
					var data = httpRequest.responseText;
					viewForm[i].innerHTML = data;
								
				} else {
					viewForm[i].innerHTML = "에러발생";
				}
			} else {
				viewForm[i].innerHTML = "loading..";
			}
		}
	}
}
</script>


<body>
<!-- 도서관 관리자 헤더 -->
<jsp:include page="../../layout/header_lib_admin.jsp"/>


<!-- 섹션 : 도서 대여 관리 페이지 -->
<section onload="BookRecord();">
	
		<div class="content_w50" >		
			<!-- <div class="tab_box">	 -->
				<input id="tab1" type="radio" name="tab" checked="checked" onclick="tab_change();"/>				
		        <input id="tab2" type="radio" name="tab" onclick="tab_change();"/>		       
				
				<!-- 라벨 : 화면에 표시되는 탭 제목 -->
		        <label for="tab1">대여 현황</label>
		        <label for="tab2">반납 현황</label>
		       
			<!-- </div> -->
			
	        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->     
			<div class="viewList"> <!-- 대여 현황 -->				
			</div>
					
			<div class="viewList"><!-- 반납 현황 -->				
			</div>
		
		</div>
		
	         
	        
		
		<div class="content_w50_2">
			
			<input id="tab1_2" type="radio" name="tab2" checked="checked" onclick="tabForm_change();"/>
	        <input id="tab2_2" type="radio" name="tab2" onclick="tabForm_change();"/>
	        <input id="tab3_2" type="radio" name="tab2" onclick="tabForm_change();"/>
	        
	        <!-- 라벨 : 화면에 표시되는 탭 제목 -->
	        <label for="tab1_2">대여</label>
	        <label for="tab2_2">반납</label>
	        <label for="tab3_2">연장</label>
	        			
	        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->     
			<div class="viewForm" style="width:100%;"> <!-- 대여 -->				
			</div>
			
			<div class="viewForm" style="width:100%;"> <!-- 반납-->				
			</div>
			
			<div class="viewForm" style="width:100%;"> <!-- 연장-->				
			</div>
			
		</div>

</section>
</body>