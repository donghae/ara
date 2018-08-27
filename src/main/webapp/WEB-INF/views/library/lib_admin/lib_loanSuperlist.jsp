<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<!-- 대여 현황 -->
	<table class="responsive-table">
		<thead class="responsive-table">
			<c:choose>
				
				<c:when test="${viewNum == 1}"><!-- 대여 목록 -->
					<tr>
						<th style="width:15%">대 여 일</th>
						<th style="width:10%">도서번호</th>
						<th style="width:10%">아 이 디</th>
						<th style="width:15%">반 납 예 정 일</th>
					</tr>
				</c:when>
			
				<c:when test="${viewNum == 2}"><!-- 반납 목록 -->
					<tr>
						<th style="width:15%">반 납 일</th>
						<th style="width:10%">도서번호</th>
						<th style="width:10%">아 이 디</th>
						<th style="width:15%">대 여 일</th>
					</tr>
				</c:when>
					
			</c:choose>								
		</thead>
		<tbody >
			<c:if test="${cnt == 0}">
				<tr>
					<td></td>
					<td colspan="7">검색 결과가 없습니다</td>							
				</tr>
			</c:if>
			
			<c:if test="${cnt > 0}">					
				<c:forEach var="i" begin="0" end="${cnt}">
					<c:choose>
						<c:when test="${bloanVOs[i].loan_state == 1}"><!-- 대여 목록 -->
							<tr>
								<td style="width:15%"><fmt:formatDate value="${bloanVOs[i].loan_dt}" 
									pattern="yyyy/MM/dd HH:mm:ss"/></td>
								<td style="width:10%">${bloanVOs[i].b_no}</td>
								<td style="width:10%">${bloanVOs[i].user_no}</td>
								<td style="width:15%">${bloanVOs[i].return_sche}</td>																			
							</tr>
						</c:when>
					
						<c:when test="${bloanVOs[i].loan_state == 12}"><!-- 반납 목록 -->
							<tr>
								<td style="width:15%"><fmt:formatDate value="${bloanVOs[i].return_dt}" 
									pattern="yyyy/MM/dd HH:mm:ss"/></td>
								<td style="width:10%">${bloanVOs[i].b_no}</td>
								<td style="width:10%">${bloanVOs[i].user_no}</td>
								<td style="width:15%"><fmt:formatDate value="${bloanVOs[i].loan_dt}" 
									pattern="yyyy/MM/dd HH:mm:ss"/></td>																				
							</tr>
						</c:when>
						
					</c:choose>
					
				</c:forEach>
			
				<tr>
					<td colspan="4">
						<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="lib_bookLoanlist">[◀◀]</a>
							<a href="lib_bookLoanlist?pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
					
						<!-- 페이지 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<!-- 현재 페이지와 i가 같은 경우 -->
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<!-- 현재 페이지와 i가 다를 경우 -->
							<c:if test="${i != currentPage}">
								<a href="lib_bookLoanlist?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="lib_bookLoanlist?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="lib_bookLoanlist?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</td>
				</tr>
			</c:if>		
		</tbody>
	</table>	
</body>		