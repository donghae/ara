<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/form-basic.css">

</body>
<!-- 헤더 -->
<jsp:include page="../../layout/header_lib_admin.jsp"/>


<!-- 섹션 : 도서 등록 양식 -->
<section>
	
	<div class="main-content" style="padding-top:50px;">	
	<form action="lib_bookAddPro" name="bookAddForm" class="form-basic" 
		method="post" enctype="multipart/form-data" onsubmit="return bookAddForm_written();">
	
		<div class="form-title-row">
			<h1>도서 등록</h1>
		</div>
          
		<div class="form-row" >
			<label>
				<span>대 분 류</span>
				<select name="global" >
					<option value="0" selected="selected">대 분 류</option>			
					<option value="1">국 내</option>
					<option value="2">국 외</option>					
				</select>
            </label>
        </div>

        <div class="form-row">
            <label>
                <span>중 분 류</span>
                <select name="category" >
                	<option value="0" selected="selected">중 분 류</option>
					<option value="1">소 설</option>
					<option value="2">예 술</option>
					<option value="3">외 국 어</option>
					<option value="4">과 학</option>
					<option value="5">시/에세이</option>
				</select>
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>ISBN</span>
                <input type="text" name="isbn" required="required">
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>도 서 명</span>
                <input type="text" name="title" required="required">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>가 격</span>
                <input type="text" name="price" required="required">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>수 량</span>
                <input type="text" name="amt" required="required">
            </label>
        </div>
		
		
        <div class="form-row">
            <label>
                <span>저 자</span>
                <input type="text" name="author" required="required">
            </label>
        </div>

        
        <div class="form-row">
            <label>
                <span>출 판 사</span>
                <input type="text" name="publish" required="required">
            </label>
        </div>
        
        
        <div class="form-row">
            <label>
                <span>발 행 일</span>
                <input type="text" name="year" placeholder="YYYY" style="width:100px" required="required"
                	pattern="\d{4}" title="YYYY">&nbsp;년&nbsp;&nbsp;
                <input type="text" name="month" placeholder="MM" style="width:50px" required="required"
                	pattern="\d{2}" title="MM">&nbsp;월&nbsp;&nbsp;
                <input type="text" name="day" placeholder="DD" style="width:50px" required="required"
                	pattern="\d{2}" title="DD">&nbsp;일
            </label>
        </div>
        

        <div class="form-title">
       		<label>
            	<button type="submit">등 록</button>
            </label>
        </div>

        </form>
	</div>

</section>

<%@include file="../../layout/footer_ara.jsp" %>
<body>