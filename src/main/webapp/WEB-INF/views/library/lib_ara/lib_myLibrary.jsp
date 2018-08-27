<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/box_mon.css"> 



<body>
<!-- 헤더 -->
<%@include file="../../layout/header_lib.jsp" %>


<!-- 본문 : 마이라이브러리 -->
<section>
	
	<form name="myLibrary" >	
		<!-- 검색칸 -->
		<article style="padding:230px 0px 0px;">
			<div id="header_fill"></div>			
		</article>					
	</form>		
	

	<!-- 목록 조회 -->
	<article class="back_white" id="list" style="padding:10px 0px 50px;">		
		<table class="st_beige">
			<thead class="st_beige">
				<tr>
					<th style="width:12%;">대 여 일</th>
					<th style="width:12%;">isbn</th>
					<th style="width:22%;">제 목</th>
					<th style="width:16%;">저 자</th>
					<th style="width:13%;">반 납 일</th>
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
				<c:forEach var="i" begin="0" end="${cnt-1}">
					<tr>
						<td style="width:12%;"><fmt:formatDate value="${bloanVOs[i].loan_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td style="width:7.5%;">${bVOs[i].b_isbn}</td>
						<td style="width:22%; text-align:left;">${bVOs[i].b_title}</td>
						<td style="width:16%;">${bVOs[i].b_author}</td>
						<td style="width:13%;"><fmt:formatDate value="${bloanVOs[i].return_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<!-- 대출상태(0:정상반납, 1:대여중, 11:반납예정, 12:정상반납, 3:미반납, 31:장기미납) -->			
						<c:if test="${bloanVOs[i].loan_state == 0 || bloanVOs[i].loan_state == 12}">
							<td style="width:7%;">정상반납</td>								
						</c:if>
						<c:if test="${bloanVOs[i].loan_state == 1}">
							<td style="width:7%;">대여중</td>
						</c:if>
						<c:if test="${bloanVOs[i].loan_state == 3}">
							<td style="width:7%;">미반납</td>
						</c:if>	
						<c:if test="${bloanVOs[i].loan_state == 31}">
							<td style="width:7%;">장기미납</td>
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
					<a href="lib_myLibrary">[◀◀]</a>
					<a href="lib_myLibrary?pageNum=${startPage - pageBlock}">[◀]</a>					
				</c:if>
			
				<!-- 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<!-- 현재 페이지와 i가 같은 경우 -->
					<c:if test="${i == currentPage}">
						<span><b>[${i}]</b></span>
					</c:if>
					<!-- 현재 페이지와 i가 다를 경우 -->
					<c:if test="${i != currentPage}">
						<a href="lib_myLibrary?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
				<c:if test="${pageCount > endPage}">
					<a href="lib_myLibrary?pageNum=${startPage + pageBlock}">[▶]</a>
					<a href="lib_myLibrary?pageNum=${pageCount}">[▶▶]</a>
				</c:if>
			</c:if>
		</div>	

	</article>
</section>	
	
<!-- 푸터 -->
<%@include file="../../layout/footer_ara.jsp" %>		

</body>