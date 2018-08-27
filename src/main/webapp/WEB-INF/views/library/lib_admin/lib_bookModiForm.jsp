<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/form-basic.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
/*도서 수정 양식 입력여부*/
function bookModiForm_written() {
	if (!document.bookModiForm.global.value || document.bookModiForm.global.value == 0) {
		swal(msg_text);
		document.bookModiForm.global.focus();
		return false;
	}
	if (!document.bookModiForm.category.value || document.bookModiForm.category.value == 0) {
		swal(msg_text);
		document.bookModiForm.category.focus();
		return false;
	}
	if (!document.bookModiForm.isbn.value) {
		swal(msg_text);
		document.bookModiForm.isbn.focus();
		return false;
	}
	if (!document.bookModiForm.title.value) {
		swal(msg_text);
		document.bookModiForm.title.focus();
		return false;
	}
	if (!document.bookModiForm.price.value) {
		swal(msg_text);
		document.bookModiForm.price.focus();
		return false;
	}
	if (!document.bookModiForm.amt.value) {
		swal(msg_text);
		document.bookModiForm.amt.focus();
		return false;
	}
/*	if (!document.bookModiForm.img.value) {
		swal(msg_text);
		document.bookModiForm.img.focus();
		return false;
	}*/
	if (!document.bookModiForm.publish.value) {
		swal(msg_text);
		document.bookModiForm.publish.focus();
		return false;
	}
	if (!document.bookModiForm.year.value) {
		swal(msg_text);
		document.bookModiForm.year.focus();
		return false;
	}
	if (!document.bookModiForm.month.value) {
		swal(msg_text);
		document.bookModiForm.month.focus();
		return false;
	}
	if (!document.bookModiForm.day.value) {
		swal(msg_text);
		document.bookModiForm.day.focus();
		return false;
	}

}

</script>


<body>

<!-- 헤더 -->
<jsp:include page="../../layout/header_lib_admin.jsp"/>

<!-- 섹션 -->
<section>
	
	<div class="main-content" style="padding-top:50px;">	
	<form action="lib_bookModiPro" name="bookModiForm" class="form-basic" method="post" 
		enctype="multipart/form-data" onsubmit="javascript:bookModiForm_written();">
	<input type="hidden" name="b_no" value="${bVO.b_no}">
	
	
		<div class="form-title-row">
			<h1>도서 수정</h1>
		</div>
          
		<div class="form-row">
			<label>
				<span>대 분 류</span>
				<select name="global">					
					<option value="1"
						<c:if test="${bVO.b_global==1}">selected="selected"</c:if>>국 내
					</option>
					<option value="2"
						<c:if test="${bVO.b_global==2}">selected="selected"</c:if>>국 외
					</option>									
				</select>
            </label>
        </div>

        <div class="form-row">
            <label>
                <span>중 분 류</span>
                <select name="category">   
                	<option value="1"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>소 설
					</option>
					<option value="2"
						<c:if test="${bVO.b_category==2}">selected="selected"</c:if>>예 술
					</option>
					<option value="3"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>외 국 어
					</option>
					<option value="4"
						<c:if test="${bVO.b_category==2}">selected="selected"</c:if>>과 학
					</option>
					<option value="5"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>시/에세이
					</option>
				</select>
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>ISBN</span>
                ${bVO.b_no}
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>도 서 명</span>
                <input type="text" name="title" value="${bVO.b_title}" required="required">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>가 격</span>
                <input type="text" name="price" value="${bVO.b_price}" required="required">
            </label>
        </div>
		
		
        <div class="form-row">
            <label>
                <span>저 자</span>
                <input type="text" name="author" value="${bVO.b_author}" required="required">
            </label>
        </div>

        
        <div class="form-row">
            <label>
                <span>출 판 사</span>
                <input type="text" name="publish" value="${bVO.b_publish}" required="required">
            </label>
        </div>
        
        
        <c:set var="b_date" value="${fn:split(b_date,'/')}"/>      
        <div class="form-row">
            <label>
                <span>발 행 일</span>           
                <input type="text" name="year" style="width:100px" placeholder="YYYY" required="required"
                	pattern="\d{4}" title="YYYY" value="${b_date[0]}">&nbsp;년&nbsp;&nbsp;
                <input type="text" name="month" style="width:50px" placeholder="MM" required="required"
                	pattern="\d{2}" title="MM" value="${b_date[1]}">&nbsp;월&nbsp;&nbsp;
                <input type="text" name="day" style="width:50px" placeholder="DD" required="required"
                	pattern="\d{2}" title="DD" value="${b_date[2]}">&nbsp;일
            </label>
        </div>
        

        <div class="form-title-row">
       		<label>
            	<button type="submit">수 정</button>
            </label>
        </div>

        </form>
	</div>

</section>

<%@include file="../../layout/footer_ara.jsp" %>
</body>