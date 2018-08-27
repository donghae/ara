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
						<div class="left_div" style="width: 50%; min-height: 40%;">
							<h1 style="">공지사항</h1>
							<form action="cy_lec_notice_write_pro" method="post"
								enctype="multipart/form-data">
								<input type="hidden" value="${lec_no}" name="lec_no">
								<table class="st_mint">
									<tr>
										<td>제목</td>
										<td><input class="input" type="text" name="title"
											maxlength="50" style="width: 270px" required="required"></td>
									</tr>
									<tr>
										<td>첨부파일</td>
										<td><input class="input" name="attFile" type="file"
											style="width: 270px; margin: 0px auto;" required="required"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea class="input" rows="10" cols="40"
												name="content" style="width: 270px; resize: none"
												required="required"></textarea></td>
									</tr>
									<tr>
										<th colspan="2"><input class="inputButton" type="submit"
											value="작성"> <input class="inputButton" type="reset"
											value="취소"> <input class="inputButton" type="button"
											value="목록"
											onclick="window.location='cy_lec_main?lec_no=${lec_no}'">
										</th>
									</tr>
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
