<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css"> 
<script src="resources/js/request.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	var checkFirst = true; 
	var loopSendKeyword = false; 
	var lastKeyword = null;	
	
	$(function() {		
		$('input[name=word]').keydown(function(e) {//데이터 입력이 끝났을 때:keyup(),  데이터 입력 중:keydown()

			hide("list");
			var word = $('input[name=word]').val();			
		
			if(word != lastKeyword){
				
				lastKeyword = word;
				var params = "word="+word;				
				
				$.ajax({
					type : 'get',
					url : 'lib_bookSearchResult',
					data : params,
					
					success : function(data) {
						$('#suggestlist').html(data);
					},
					error : function() {
						alert('검색 오류');
					}
					
				});
			}		
		});
	});
	
	
	//검색입력시	
	function startSuggest() {
		
		hide("list");
		
		if(checkFirst == true) {
			loopSendKeyword = true; 
			/* setTimeout("sendKeyword()", 500); */
			sendKeyword();
		}
		checkFirst = false; 
	}
	
		 
	function sendKeyword() {
		
		/* if(loopSendKeyword == false) {
			return false;
		}  */
		
		hide("list");
		var word = document.search.word.value;
		
		if(word != lastKeyword){
			
			lastKeyword = word;			
			var params = "word="+word;
			
			sendRequest(result_callback, "lib_bookSearchResult", "GET", params);
		} 
	 
		/* setTimeout("sendKeyword()", 500); */
		
	}
	
	
	
	function result_callback() {
		var suggestlist = document.getElementById("suggestlist");
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				var data = httpRequest.responseText;
				suggestlist.innerHTML = data;
				
			} else {
				suggestlist.innerHTML = "에러발생";
			}
		
		} else {
			suggestlist.innerHTML = "검색 중..";
		}
	}
	
	
	function select(book) {
		document.search.word.value = book;		
		loopSendKeyword = false;	
		
		checkFirst = true;	
		hide("divSuggest");
	}
	
	
	function show(str) {
		var element = document.getElementById(str);
		
		if(element) {
			element.style.display=""; 
		}
	}
	function hide(str) {
		var element = document.getElementById(str);
		
		if(element) {
			element.style.display="none"; 
		}
	}
</script>


<body>
<!-- 헤더 -->
<%@include file="../../layout/header_lib.jsp" %>


<!-- 본문 : 도서 검색 -->
<section>
	
	<form name="search" >
	
		<!-- 검색칸 -->
		<article style="padding:230px 0px 0px;">
			<div id="header_fill"></div>
				<div class="content">
				<div class="cen_middle">
								
					<span style="padding:0px 3px;">					
						<input class="vertical" type="text" name="word" onkeyup="javascript:sendKeyword();"
							placeholder="제목 또는 작가를 검색하세요" style="width:60%;">
					</span>
					
				</div>
			</div>	
		</article>					
	</form>		
	

	<!-- 목록 조회 -->
	<article class="back_white" id="list" style="height:80%; padding:10px 0px 50px;">
		<div class="content" id="suggestlist_main">
			<table class="st_beige">
				<thead class="st_beige">
					<tr>
						<th style="width:12%;">도서번호</th>
						<th style="width:10%;">대 분 류</th>
						<th style="width:10%;">중 분 류</th>
						<th style="width:22%;">제 목</th>
						<th style="width:16%;">저 자</th>
						<th style="width:13%;">출 판 사</th>
						<th style="width:10%;">상 태</th>
					</tr>
				</thead>
				
				<tbody class="st_beige">
					<c:if test="${cnt == 0}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
					
					<c:if test="${cnt > 0}">
					<c:forEach var="bVOs" items="${bVOs}">
						<tr>
							<td style="width:12%;">${bVOs.b_no}</td>
							
							<c:if test="${bVOs.b_global == 1}">
								<td style="width:10%;">국내</td>							
							</c:if>
							<c:if test="${bVOs.b_global == 2}">
								<td style="width:10%;">국외</td>							
							</c:if>
							
							<c:if test="${bVOs.b_category == 1}">
								<td style="width:7.5%;">소설</td>							
							</c:if>
							<c:if test="${bVOs.b_category == 2}">
								<td style="width:7.5%;">예술</td>							
							</c:if>
							<c:if test="${bVOs.b_category == 3}">
								<td style="width:7.5%;">외국어</td>							
							</c:if>
							<c:if test="${bVOs.b_category == 4}">
								<td style="width:7.5%;">과학</td>							
							</c:if>
							<c:if test="${bVOs.b_category == 5}">
								<td style="width:7.5%;">시/에세이</td>							
							</c:if>
							
							<td style="width:22%; text-align:left;">${bVOs.b_title}</td>
							<td style="width:16%;">${bVOs.b_author}</td>
							<td style="width:13%;">${bVOs.b_publish}</td>
										
							<c:if test="${bVOs.b_state_fl == 1}">
								<td style="width:10%;">대여 가능</td>								
							</c:if>
							<c:if test="${bVOs.b_state_fl == 2}">
								<td style="width:10%;">대여 불가</td>
							</c:if>
												
						</tr>
					</c:forEach>
					</c:if>	
					
				</tbody>
			</table>
			
			
			
			<br><br>
			<!-- 페이지 컨트롤 버튼 -->
			<div class="cen_middle">
				<c:if test="${cnt > 0}">
					<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="lib_bookSearch?word=${word}">[◀◀]</a>						
						<a href="lib_bookSearch?word=${word}&pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch?word=${word}&pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch?word=${word}&pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch?word=${word}&pageNum${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>	
		</div>
	</article>

		
	<div id="divSuggest">		
		<div id="suggestlist"></div>
	</div>
</section>
			
			
<!-- 푸터 -->
<%@include file="../../layout/footer_ara.jsp" %>		
</body>