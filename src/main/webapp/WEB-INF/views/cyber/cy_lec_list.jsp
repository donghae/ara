<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<style>
.cy_1 {
	margin-top: 21px;
}

.tab1 {
	width: 100%;
	height: 80%;
	border: 1px solid;
	border-collapse: collapse;
	margin: 5px auto;
}

.tab1 tr td {
	border-top: 1px solid;
	border-left: 1px solid;
	text-align: center;
	border-collapse: collapse;
	height: 10%;
}

.section_0 {
	width: 100%;
	height: 1000px;
	display: inline;
	text-align: center;
	align-items: center;
}

.cy_2 {
	width: 100%;
}

.cy_h4 {
	
}

.cy_3 {
	width: 100%;
}

.th_1 {
	text-align: center;
	background-color: #C4E8F6;
}

.wrap_dev1 {
	display: inline;
	width: 100%;
	height: 40%;
}

.wrap_dev2 {
	text-align: center;
	background-color: #cacaca;
}


.right_div {
	width: 40%;
	display: inline-flex;
}
</style>


<body>
	<jsp:include page="../layout/header_ara.jsp" />
	<c:if test="${sessionScope.id == null}">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("권한이 없습니다.").then((okay) => {
				  if (okay) {
					  window.history.back();
					  }
					});
			
		</script>
	</c:if>
	<section>
		<article>

			<div class="content">
				<div class="cen_middle">
					<div align="center" style="min-height: 50%; ">
						<%@ include file="../cyber/cy_sidebar_stu.jsp"%>
						<div class="left_div" style="width: 80%; min-height: 40%;">
							<h1 style="text-align: left;max-width: 70%;">강의 목록</h1>
							<br>
							<table class="st_mint">
								<thead>
									<tr>
										<th style="width: 10%">강의번호</th>
										<th style="width: 50%">강의명</th>
										<th style="width: 20%">교수명</th>
										<th style="width: 10%">학점</th>
										<th style="width: 10%">수강인원</th>
									</tr>
								</thead>
								<!-- 게시글이 있으면 -->
								<tbody>
									<c:if test="${requestScope.dtos!=null}">

										<c:forEach var="vo" items="${dtos}">
											<tr>
												<td align="center">${vo.lec_no}</td>
												<td><c:set var="l_no" value="${vo.lec_no}" /> <a
													href="cy_select_lec_list?lec_no=${vo.lec_no}"
													style="color: black;"> ${vo.lec_name} </a></td>
												<td align="center">${vo.prof_name}(${vo.prof_no})</td>
												<td align="center">${vo.lec_point}</td>
												<td align="center"><c:if
														test="${lecPersonCnt[l_no]!=0}">
											${lecPersonCnt[l_no]} 
										</c:if> <c:if test="${lecPersonCnt[l_no]==0}">
											0 
										</c:if> / ${vo.max_person}</td>

											</tr>
										</c:forEach>
									</c:if>
									<!-- 게시글이 없으면 -->
									<c:if test="${requestScope.dtos==null}">
										<tr>
											<th colspan="6" align="center">강의가 없습니다.</th>
										</tr>
									</c:if>
								</tbody>
							</table>


						</div>
					</div>
				</div>
			</div>

		</article>
	</section>
</body>


<%@ include file="../layout/footer_ara.jsp"%>
