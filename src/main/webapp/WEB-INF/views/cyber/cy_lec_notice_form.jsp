
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
	<section>
		<article>

			<div class="content">
				<div class="cen_middle">
					<div align="center" style="min-height: 50%;">
						<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
						<div class="left_div" style="width: 80%; min-height: 40%;">
							<form action="cy_lec_notice_update_form" method="post">
								<input type="hidden" name="num" value="${vo.cy_lec_n_no}">
								<input type="hidden" name="lec_no" value="${vo.lec_no}">
								<table class="st_mint">
									<tr>
										<th style="width: 15%">제목</th>
										<td><c:if
												test="${fn:substring(sessionScope.id,0,1) == 0 || fn:substring(sessionScope.id,0,1) == 1}">
												<input type="text" name="title" value="${vo.cy_lec_n_title}">
											</c:if> <c:if test="${fn:substring(sessionScope.id,0,1) == 2}">
							${vo.cy_lec_n_title}
						</c:if></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td><a style="color: black;"
											href="cy_download?fileName=${vo.cy_lec_n_file}">${vo.cy_lec_n_file}</a>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><c:if
												test="${fn:substring(sessionScope.id,0,1) == 0 || fn:substring(sessionScope.id,0,1) == 1}">
												<textarea name="content" class="input" rows="10" cols="40"
													name="content"
													style="width: 80%; resize: none; height: 302px;">${vo.cy_lec_n_content}</textarea>
											</c:if> <c:if test="${fn:substring(sessionScope.id,0,1) == 2}">
												<textarea name="content" class="input" rows="10" cols="40"
													name="content"
													style="width: 80%; resize: none; height: 302px; border: none; outline: none;"
													readonly="readonly">${vo.cy_lec_n_content}</textarea>
											</c:if></td>
									</tr>
									<tr>
										<th colspan="2"><input class="btn_mint" type="button"
											value="목록"
											onclick="window.location='cy_lec_main?pageNum=${pageNum}&lec_no=${lec_no}'">
											<c:if
												test="${fn:substring(sessionScope.id,0,1) == 0 || fn:substring(sessionScope.id,0,1) == 1}">
												<input class="btn_mint" type="submit" value="글 수정">
												<input class="btn_mint" type="button" value="글 삭제"
													onclick="window.location='cy_lec_notice_delete_form?num=${vo.cy_n_no}&lec_no=${lec_no}'">
											</c:if></th>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>

		</article>
	</section>
</body>


<%@ include file="../layout/footer_ara.jsp"%>
