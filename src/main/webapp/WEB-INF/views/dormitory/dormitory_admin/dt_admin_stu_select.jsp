<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>

 <style>
	.penalty{
		position: relative;
		top:250px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	top:50px;
	}
</style>

<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
			<table class="st_mint" >			
				<thead>
					<tr>
						<td style="width:7%" align="center"> 글번호 </td>
						<td style="width:16%" align="center"> 학번 </td>
						<td style="width:7%" align="center"> 호실 </td>
						<td style="width:15%" align="center"> 이름 </td>
						<td style="width:15%" align="center"> 기숙사 시작일 </td>
						<td style="width:15%" align="center"> 기숙사 종료일 </td>
						<td style="width:15%" align="center"> 정보 수정 </td>	
					</tr>				
				</thead>
				<!-- 게시글이 있으면 -->
				<tbody>
					<c:if test="${requestScope.dtos!=null}">
						<c:forEach var="dto" items="${dtos}">							
							<tr>
								<td align="center">${number}<c:set var="number"
										value="${number-1}" />
								</td>
								<td > ${dto.st_no} </td>
								<td align="center"> ${dto.dorm_room}</td>
								<td>${dto.st_name}</td>
								
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.dorm_st_dt}" /></td>
								
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.dorm_end_dt}" /></td>
								
								<td align="center"><a href="dormitoty_stu_update?st_no=${dto.st_no}&dorm_room=${dto.dorm_room}&st_name=${dto.st_name}&dorm_st_dt=${dto.dorm_st_dt}&dorm_end_dt=${dto.dorm_end_dt}" style="color: black;">수정</a></td>		
							</tr>
							
							<c:if test="${dto == null}">
								<tr>
									<td colspan="7"> 
										기숙사에 등록 되어 있는 학생이 없습니다.
									</td>
								</tr>
							</c:if>																	
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		
		<br><br>
			<table style="text-align: center">
				<tr>
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음 : ◀◀                                  이전 : ◀-->
							<c:if test="${startPage > pageBlock}">
								<a href="dormitoty_stu_select">◀◀</a>
								<a href="dormitoty_stu_select?pageNum=${startPage-pageBlock}">&nbsp;◀</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="dormitoty_stu_select?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 끝 : ▶▶                                       다음 : ▶-->
							<c:if test="${pageCount > endPage}">
								<a href="dormitoty_stu_select?pageNum=${startPage+pageBlock}">▶&nbsp;</a>
								<a href="dormitoty_stu_select?pageNum=${pageCount}">▶▶</a>
							</c:if>
						</c:if></th>
				</tr>
			</table>
		</div>
	</div>
</c:if>	

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
