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
	
	.page{
		position: relative;
		
	}
</style>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function del(){
	swal({
		  title: "정말 삭제하시겠습니까??",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((okay) => {
		  if (okay) {
		    swal("삭제되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dt_stu_overnight_del_list'
					  }
					});
		  } else {
		    swal("삭제 취소되었습니다.").then((okay) => {
				  if (okay) {
					  history.back()
					  }
					});
		  }
		});
}
</script>

<c:if test="${fn:substring(sessionScope.id,0,1) == 2}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="cy_1">
			<h2>외박 신청 결과</h2>	
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1300px; height: 80%;">
			<table class="st_mint" style="margin-top:60px;">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 10%">학번</th>
						<th style="width: 10%">이름</th>
						<th style="width: 5%">호실</th>
						<th style="width: 10%">외박점수</th>
						<th style="width: 15%">외박신청일</th>
						<th style="width: 30%">외박사유</th>	
						<th style="width: 15%">진행상황</th>		
					</tr>
					
				</thead>
				<!-- 게시글이 있으면 -->
				<tbody>
					<c:if test="${requestScope.dtos !=null}">
						<c:forEach var="dto" items="${dtos}">
						<input type="hidden" value="${dto.st_no }" name="st_no">
							<tr>
								<td align="center">${number}<c:set var="number"
										value="${number-1}" />
								<td align="center">${dto.st_no}</td>
								<td align="center">${dto.st_name}</td>
								<td align="center">${dto.dorm_room}</td>
								<td align="center">${dto.dorm_on_sc}</td>
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.dorm_ex_dt}" /></td>
								<td align="center">${dto.dorm_reason}</td>
								<td align="center">
									<c:if test="${dto.dorm_ex_fl == 2}">
											승인 완료
									</c:if>
									<c:if test="${dto.dorm_ex_fl == 1}">
									<a href="dt_stu_overnight_update?overnight_no=${dto.overnight_no}&st_no=${dto.st_no}" style="color: black;">수정</a>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="dt_stu_overnight_del_list?overnight_no=${dto.overnight_no}&st_no=${dto.st_no}" onclick="return del();" style="color: black;">삭제</a>
									</c:if>									
								</td>
							</tr>																																								
						</c:forEach>														
					</c:if>
					<c:if test="${dtos == null}">
						<tr>
							<td align="center" colspan="8">
								외박 신청 현황이 없습니다.
							</td>
						</tr>
					</c:if>						
				</tbody>
			</table>
		
<!-- 			<div class="page" style="width:500px; height:150px; background: blue;">
			
			</div> -->
		
			<table style="text-align: center">
				<c:set var="dto" value="${sessionScope.id}" />
				<tr>
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음 : ◀◀                                  이전 : ◀-->
							<c:if test="${startPage > pageBlock}">
								<a href="dormitoty_stu_overnight_select">◀◀</a>
								<a href="dormitoty_stu_overnight_select?pageNum=${startPage-pageBlock}">&nbsp;◀</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="dormitoty_stu_overnight_select?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 끝 : ▶▶                                       다음 : ▶-->
							<c:if test="${pageCount > endPage}">
								<a href="dormitoty_stu_overnight_select?pageNum=${startPage+pageBlock}}">▶&nbsp;</a>
								<a href="dormitoty_stu_overnight_select?pageNum=${pageCount}">▶▶</a>
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
