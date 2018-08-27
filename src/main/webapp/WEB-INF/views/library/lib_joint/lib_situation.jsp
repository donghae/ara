<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>  


<body>
<!-- 헤더 -->
<%@include file="../../layout/header_lib.jsp" %>
	
<!-- 도서관 현황 -->
<section>
	<article style="padding:230px 0px 25px;">
		<div id="header_fill"></div>
	</article>
	
		<div class="popular page_section" style="padding:0px;">
			<div class="content">
			<div class="container" style="max-width:80%; width:100%; magin:0 auto; padding:0px;">
				<div class="row">
					<div class="col">
						<div class="section_title text-center">
							<h1>도서관 현황</h1>
						</div>
					</div>
				</div>

				<div class="row course_boxes">
					
					<!-- Popular Course Item -->
					<div class="col-lg-12 course_box">
						<div class="card">
							<img class="card-img-top" src="resources/boot_library/img/courses_background.jpg" >
							<div class="card-body text-center">
							
								<div class="card-title" style="height:50px;"></div>
								
								<div class="card-text">
									<!-- <label>도서자료</label> -->
									<table class="table" style="text-align:center;">
										
											<thead class="thead-dark">
												<tr style="padding:15px;">
													<th style="padding:5px;width:10%;">구 분</th>
													<th style="padding:5px;width:10%;">소 설</th>
													<th style="padding:5px;width:10%;">예 술</th>
													<th style="padding:5px;width:10%;">외 국 어</th>
													<th style="padding:5px;width:10%;">과 학</th>
													<th style="padding:5px;width:10%;">시/에세이</th>
													<th style="padding:5px;width:10%;">합 계</th>
													<th style="padding:5px;width:10%;">총 계</th>
												</tr>
											</thead>
											<tbody>
								
													
												<tr style="padding:15px;">
													<td style="padding:5px;width:10%;">국 외</td>
													<td style="padding:5px;width:10%;">${stuVOs[0].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[1].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[2].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[3].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[4].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[5].booksum}</td>
													<td rowspan="2" style="vertical-align:center;width:10%;">${stuVOs[12].booksum}</td>
												</tr>
											
												<tr style="padding:15px;">
													<td style="padding:5px;width:10%;">국 외</td>
													<td style="padding:5px;width:10%;">${stuVOs[6].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[7].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[8].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[9].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[10].booksum}</td>
													<td style="padding:5px;width:10%;">${stuVOs[11].booksum}</td>													
												</tr>
										</tbody>
										
									</table>
								</div>
							</div>							
						</div>
					</div>
					
				</div>
			</div>		
		</div>
	</div>
</section>


<%@include file="../../layout/footer_ara.jsp" %>
</body>