<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	 $(document).on("click", ".video_popup", function() {
	   	var data = $(this).attr('id');
	   	var file_name = data.split("|");
	   	
	  	var url = "cy_form?file_name="+file_name[0]+"&round_no="+file_name[1]+"&lec_no="+file_name[2];
		window.open(url, "동영상", "menubar=no, width=800, height=600");
	 });
});
</script>
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

					<div align="center" style="min-height: 50%;">
						<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
						<div class="left_div" style="width: 80%; min-height: 40%;">
							<h1 style="text-align: left;max-width: 70%;">수업 목차</h1>
							<br>
							<table class="st_mint" style="">
								<thead>
									<tr>
										<th style="width: 10%">주차</th>
										<th style="width: 50%">강의명</th>
										<th style="width: 15%">강의 시간</th>
										<th style="width: 15%">시청 시간</th>
										<th style="width: 5%">출결 여부</th>
										<th style="width: 5%">시청</th>
									</tr>
								</thead>
								<!-- 게시글이 있으면 -->
								<tbody>

									<c:if test="${requestScope.dtos!=null}">

										<c:forEach var="vo" items="${dtos}">
											<tr>
												<td align="center">${vo.round_no}주차</td>
												<td>${vo.round_name}</td>
												<c:set var="round" value="${vo.round_no}" />
												<td align="center"><c:if test="${vo.file_len > 59}">
														<fmt:parseNumber value="${vo.file_len/60}"
															integerOnly="true" />분 <fmt:parseNumber
															value="${vo.file_len%60}" integerOnly="true" />초
									</c:if> <c:if test="${vo.file_len < 60}">
										${vo.file_len}초
									</c:if></td>
												<td align="center"><input type="hidden"
													id="totalTime_${vo.round_no}" value="${watchTime[round]}">
													<c:if test="${watchTime[round] > 59}">
														<fmt:parseNumber value="${watchTime[round]/60}"
															integerOnly="true" />분 <fmt:parseNumber
															value="${watchTime[round]%60}" integerOnly="true" />초
										
									</c:if> <c:if test="${watchTime[round] < 60}">
														<input style="border: none; text-align: center;"
															type="text" id="totalTime2_${vo.round_no}"
															value="${watchTime[round]}" readonly="readonly">초
									</c:if></td>
												<td align="center"><c:choose>
														<c:when test="${watchTime[round]>=(vo.file_len*0.9)}">
											O
										</c:when>
														<c:otherwise>
											X
										</c:otherwise>
													</c:choose></td>
												<c:if test="${fn:substring(sessionScope.id,0,1) == 2 }">
													<td align="center"><input class="video_popup"
														type="button" value="시청하기"
														id="${vo.file_name}|${vo.round_no}|${lec_no}"></td>
												</c:if>
												<c:if test="${fn:substring(sessionScope.id,0,1) != 2 }">
													<td></td>
												</c:if>
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

							<table style="width: 1000px; text-align: center;">
								<tr>
									<th align="center"><c:if test="${cnt>0}">
											<!-- 처음 : ◀◀                                  이전 : ◀-->
											<c:if test="${startPage > pageBlock}">
												<a href="cy_select_lec_list?lec_no=${lec_no}">◀◀</a>
												<a
													href="cy_select_lec_list?lec_no=${lec_no}&pageNum=${startPage-pageBlock}">&nbsp;◀</a>
											</c:if>

											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${i==currentPage}">
													<span><b>${i}</b></span>
												</c:if>
												<c:if test="${i!=currentPage}">
													<a href="cy_select_lec_list?lec_no=${lec_no}&pageNum=${i}">${i}</a>
												</c:if>
											</c:forEach>

											<!-- 끝 : ▶▶                                       다음 : ▶-->
											<c:if test="${pageCount > endPage}">
												<a
													href="cy_select_lec_list?lec_no=${lec_no}&pageNum=${startPage+pageBlock}">▶&nbsp;</a>
												<a
													href="cy_select_lec_list?lec_no=${lec_no}&pageNum=${pageCount}">▶▶</a>
											</c:if>
										</c:if></th>
								</tr>
							</table>
							<c:if
								test="${fn:substring(sessionScope.id,0,1) == 0 || fn:substring(sessionScope.id,0,1) == 1}">
								<input class="btn_mint" type="button"
									onclick="window.location='cy_select_lec_add?lec_no=${lec_no}'"
									value="강의 추가" style="margin-left: 200px;">
							</c:if>
						</div>
					</div>
				</div>
			</div>

		</article>
	</section>
</body>


<%@ include file="../layout/footer_ara.jsp"%>
