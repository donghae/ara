<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp"%>


<!-- 헤더 -->
<jsp:include page="../layout/header_ara.jsp" />

<!-- 본문 : 배너 -->
<header id="gtco-header" role="banner">
   <img src="resources/images/common_img/UNI/collage2.jpg" width="100%" height="900px">
</header>



		<!-- 게시판/바로가기 -->
		
		<div class="gtco-services gtco-section" style="background:#C4E8F6; padding:0">
			<div class="gtco-container" style="background:#C4E8F6; padding:50px 0 0">
				<div class="row row-pb-md">
				
					<div class="col-md-7 col-md-7 service-wrap">
						<h2>공지 사항</h2>								
					</div>	
					
					<div class="col-md-5 col-md-5 service-wrap">
						<h2>바로 가기</h2>								
					</div>	
							
					<div class="col-md-7 col-sm-7 service-wrap" >
						<div class="service" style="background:#C4E8F6;text-align:left;padding:50px 0 0px" >
							
			                  <ul>
			                     <li style="margin-bottom:5px; font-size:17px;">◆ 2018-1학기 수강신청 확인 및 포기 가능 기간 정정 안내</li>
			                  </ul>			
			                  <ul>
			                     <li style="margin-bottom:5px; font-size:17px;">◆ 2018학년도 1학기 등록금 고지서 출력 및 납부안내</li>
			                  </ul>			
			                  <ul>
			                     <li style="margin-bottom:5px; font-size:17px;">◆ 2018-1학기 개설 교과목 중 폐강 강좌 안내</li>
			                  </ul>			
			                  <ul>
			                     <li style="margin-bottom:5px; font-size:17px;">◆ 2018-1학기 사이버강의 수강방법 안내</li>
			                  </ul>			
			                  <ul>
			                     <li style="margin-bottom:5px; font-size:17px;">◆ 2018-1학기 "JSP" 분반 추가개설 안내</li>
			                  </ul>
						</div>						
					</div>
					
					<div class="col-md-5 col-sm-5 service-wrap">
						<div class="service" style="background:#C4E8F6; padding:0">
														
							<c:if test="${sessionScope.id == null}">
								<table style="width:100%">
									<tr style="width:100%">
										<td>
											<ul style="margin:20px">
												<li><img src="resources/images/common_img/icons/education.png" width="70px">
												<li>학사정보										
											</ul>
										</td>
										<td>
											<ul style="margin:20px">
												<li>
													<a href="cy_main">
														<img src="resources/images/common_img/icons/cyber.png" width="70px">
													</a>
												<li>온라인강의										
											</ul>										
										</td>
										<td>
											<ul style="margin:20px">
												<li><img src="resources/images/common_img/icons/mypage.png" width="70px">
												<li>마이페이지										
											</ul>										
										</td>
									</tr>
									
									<tr style="width:100%">
										<td>
											<ul style="margin:20px">
												<li>
													<a href="lib_home">
														<img src="resources/images/common_img/icons/library.png" width="70px">
													</a>
												<li>도서관										
											</ul>
										</td>
										<td>
											<ul style="margin:20px">
												<li>
													<a href="dormitory">
														<img src="resources/images/common_img/icons/dormi.png" width="70px">
													</a>
												<li>기숙사										
											</ul>										
										</td>
										<td>
											<ul style="margin:20px">
												<li>
													<a href="bus_list">
														<img src="resources/images/common_img/icons/schoolbus.png" width="70px">
													</a>
												<li>스쿨버스										
											</ul>										
										</td>
									</tr>
								</table>
							</c:if>
							
							
							<c:if test="${sessionScope.id != null}">
							<c:set var="id" value="${sessionScope.id.substring(0,1)}"/>
								
								<c:if test="${id == '0'}">
									<table style="width:100%">
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_adm?st_state=1&major=101">
															<img src="resources/images/common_img/icons/education.png" width="70px">
														</a>
													<li>학사정보										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="cy_main">
															<img src="resources/images/common_img/icons/cyber.png" width="70px">
														</a>
													<li>온라인강의										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_adm?st_state=10">
															<img src="resources/images/common_img/icons/mypage.png" width="70px">
														</a>
													<li>마이페이지										
												</ul>										
											</td>
										</tr>
										
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="lib_home">
															<img src="resources/images/common_img/icons/library.png" width="70px">
														</a>
													<li>도서관										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="dormitory">
															<img src="resources/images/common_img/icons/dormi.png" width="70px">
														</a>
													<li>기숙사										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="bus_list">
															<img src="resources/images/common_img/icons/schoolbus.png" width="70px">
														</a>
													<li>스쿨버스										
												</ul>										
											</td>
										</tr>
									</table>
							
								</c:if>
							
								<c:if test="${id == '1'}">
									<table style="width:100%">
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_pro?st_state=50">
															<img src="resources/images/common_img/icons/education.png" width="70px">
														</a>
													<li>학사정보										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="cy_main">
															<img src="resources/images/common_img/icons/cyber.png" width="70px">
														</a>
													<li>온라인강의										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_pro?st_state=50">
															<img src="resources/images/common_img/icons/mypage.png" width="70px">
														</a>
													<li>마이페이지										
												</ul>										
											</td>
										</tr>
										
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="lib_home">
															<img src="resources/images/common_img/icons/library.png" width="70px">
														</a>
													<li>도서관										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="dormitory">
															<img src="resources/images/common_img/icons/dormi.png" width="70px">
														</a>
													<li>기숙사										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="bus_list">
															<img src="resources/images/common_img/icons/schoolbus.png" width="70px">
														</a>
													<li>스쿨버스										
												</ul>										
											</td>
										</tr>
									</table>							
								</c:if>
								
								<c:if test="${id == '2'}">
									<table style="width:100%">
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_stu?st_state=15">
															<img src="resources/images/common_img/icons/education.png" width="70px">
														</a>
													<li>학사정보										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="cy_main">
															<img src="resources/images/common_img/icons/cyber.png" width="70px">
														</a>
													<li>온라인강의										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="st_stu?st_state=10">
															<img src="resources/images/common_img/icons/mypage.png" width="70px">
														</a>
													<li>마이페이지										
												</ul>										
											</td>
										</tr>
										
										<tr style="width:100%">
											<td>
												<ul style="margin:20px">
													<li>
														<a href="lib_home">
															<img src="resources/images/common_img/icons/library.png" width="70px">
														</a>
													<li>도서관										
												</ul>
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="dormitory">
															<img src="resources/images/common_img/icons/dormi.png" width="70px">
														</a>
													<li>기숙사										
												</ul>										
											</td>
											<td>
												<ul style="margin:20px">
													<li>
														<a href="bus_list">
															<img src="resources/images/common_img/icons/schoolbus.png" width="70px">
														</a>
													<li>스쿨버스										
												</ul>										
											</td>
										</tr>
									</table>							
								</c:if>
							
							</c:if>												
							
						</div>						
					</div>
										
				</div>
		   </div>
		</div>



		<div class="gtco-services gtco-section">
			<div class="gtco-container">
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h1>아라 소식</h1>
						<p>새로운 학기를 맞아 특강 프로그램 안내</p>
					</div>
				</div>
				
				<div class="row row-pb-md">
				
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-pie-chart"></i> 단과대학(전공)별 취업특강</h3>
							<p>단과대학(전공)별 채용동향 및 취업전략</p>
							<img src="resources/images/common_img/mainImg/b1.jpg" width="282px">
						</div>						
					</div>

					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-ruler-pencil"></i> 진로설정을 위한 심리검사</h3>
							<p>다중지능검사, 애니어그램, CTI진로사고검사 시행</p>
							<img src="resources/images/common_img/mainImg/b4.jpg" width="282px">
						</div>						
					</div>
					
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-settings"></i> 기초 취업준비 릴레이 워크숍</h3>
							<p>대학생활을 주제로 진행되는 릴레이 특강</p>
							<img src="resources/images/common_img/mainImg/b2.jpg" width="282px">
						</div>						
					</div>

					<div class="clearfix visible-md-block visible-sm-block"></div>

					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-pie-chart"></i> 창업특강</h3>
							<p>창업가의 성공사례 및 기업가 정신 교육</p>
							<img src="resources/images/common_img/mainImg/b3.jpg" width="282px">
						</div>						
					</div>
					
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-ruler-pencil"></i> 외국계기업 취업아카데미</h3>
							<p>외국계기업 취업지원을 위한 단계별 프로그램</p>
							<img src="resources/images/common_img/mainImg/b5.png" width="282px">
						</div>						
					</div>
					
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-settings"></i> Development</h3>
							<p></p>
						</div>
					</div>
					
     			</div>
			</div>
		</div>
		<!-- END .gtco-services -->


		<div class="gtco-section gtco-testimonial gtco-gray">
			<div class="gtco-container">
				
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h1>연구 / 산학</h1>
						<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					 -->
					</div>
				</div>


				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="resources/images/common_img/mainImg/profimg/prof.park.jpg" alt="박희현 교수님"></div>
							<blockquote>
								<p>&ldquo;광 에너지는 환경 친화적이고 무한 에너지원이라는 장점으로 차세대 에너지원으로 우선적으로 부각되고 있으나 이의 실용화를 위해서는 
								태양전지와 같이 광을 에너지로 바꾸기 위한 효율적이며 기능적인 소자 개발이 필수적으로 요구되고 있습니다. 이와 같은 미래 광 에너지 소자에 대한 원천기술 개발은 본 센터의 주 연구 분야인 첨단 광 에너지 소재 개발로 이루어 질 수 있을 것입니다..&rdquo; 
								<cite class="author">&mdash; 박희현 광에너지소재연구센터</cite></p>
							</blockquote>	
						</div>
					</div>
				
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="resources/boot_main/images/person_2.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo; 광진단 분야의 세계적 연구 기관인 Beckman Laser Institute와 의료용 레이저 개발 경험이 풍부한 단국대학교 의학레이저 연구센터가 상호간의 원천 기술을 공유하고 이를 바탕으로 광진단 및 치료기기를 
								연구 개발하고 국내 광의료 분야 연구를 세계 일류 수준으로 끌어올리기 위하여 한국베크만 광의료기기 연구센터(BLI-Korea)를 설립함.&rdquo;
								<cite class="author">&mdash; Steve Jobs 한국베크만광의료기기연구센터</cite></p>
							</blockquote>	
						</div>
					</div>	
									
				</div>
				
				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="resources/boot_main/images/person_1.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;
								IT+CT(정보기술+문화기술) 중심 특성화의 콘트롤 타워 역할 수행을 목적으로 기존의 정보통신융합기술원과 미디어콘텐츠연구원의 
								두 연구원을 통합한 형태로 2015년 3월에 설립된 교책중점연구기관입니다. 
								본 연구원은 IT+CT 특성화를 위한 핵심 R&D 과제를 발굴, 기획, 추진하기 위한 기반 조성 및 교류 확대를 핵심 목표로 하고 있습니다.&rdquo; 
								<cite class="author">&mdash; Ferdinand A. Porsche 정보문화기술연구원</cite></p>
							</blockquote>	
						</div>
					</div>
				
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="resources/boot_main/images/person_2.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;
								에너지의 복합성과 에너지 및 기후변화 문제의 통합성을 고려하여, 에너지 연구 및 교육에 복합학문적(poly-disciplinary)인 접근 방법을 강화하고, 
								국내외 교육 및 연구기관은 물론 국내 산업계 전문 인력을 활용하고 상호교류를 추진한다. 
								또한 에너지 전략의 중요성과 에너지의 기술, 경제, 사회, 정치 등 복합적인 특성을 고려하여 학제간 접근방법을 통한 유능 전문인력을 양성하고 있다.&rdquo; 
								<cite class="author">&mdash; Steve Jobs 에너지시스템연구센터</cite></p>
							</blockquote>	
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="gtco-services gtco-section" style="background:#C4E8F6">
			<div class="gtco-container">
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h1>아라대 단과대학</h1>
						<p>학과별보기</p>						
					</div>
				</div>		


			    <div class="gtco-testimony gtco-left">
			         <table class="st_beige" >
			         	<tbody class="st_beige" style="width:100%;">
				            <tr style="border-bottom:0px;">
				               <th style="width:120px;">공 학 대 학</th>
				               <td style="width:130px;"><a style="color:#001E42" href="" onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop22.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 기계공학</a></td>
				               <td style="width:130px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop50.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 소프트웨어공학</a></td>
				               <td style="width:120px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop30.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 식품공학</a></td>
				               <td style="width:150px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop12.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 전기공학</a></td>
				               <td style="width:120px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop15.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 화학공학</a></td>
				            </tr>
				
				            <tr style="border-bottom:0px;">
				               <th style="width:100px;">과 학 대 학</a></th>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop54.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 물리학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/molecular_movie.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 미생물학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/molecular_movie.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 분자생물학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop18.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 생명과학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop15.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 화학</a></td>
				            </tr>
				
				            <tr style="border-bottom:0px;">
				               <th style="width:100px;">사 회 대 학</th>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop19.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 경영학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop36.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 경제학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop13.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 심리학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop24.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 정치외교학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				               onclick="javascript:window.open
				               ('http://ipsi.dankook.ac.kr/pop/movie_pop26.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				               title="새창으로 열림">- 행정학</a></td>
				            </tr>
				
				            <tr style="border-bottom:0px;">
				               <th style="width:100px;">예 술 대 학</th>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop42.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 도예</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop46.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 무용</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop42.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 문예창작</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop46.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 실용음악</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop42.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 조소</a></td>
				            </tr>
				
				            <tr style="border-bottom:0px;">
				               <th style="width:100px;">인 문 대 학</th>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop47.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 국어국문학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop48.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 사학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop49.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 영어영문학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop14.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 철학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop31.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 포르투칼어</a></td>
				            </tr>
				
				            <tr style="border-bottom:0px;">
				               <th style="width:100px;">체 육 대 학</th>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop52.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 국제스포츠학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop52.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 생활체육학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop57.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 스포츠경영학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop52.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 스포츠응용산업학</a></td>
				               <td style="width:100px;"><a style="color:#001E42" href="" 
				                  onclick="javascript:window.open
				                  ('http://ipsi.dankook.ac.kr/pop/movie_pop57.php','','width=580,height=450,top=0,left=0,scrollbars=yes');" 
				                  title="새창으로 열림">- 체육교육학</a></td>
				            </tr>
				         </tbody>
			         </table>
      </div>
   </div>
</div>
<%@ include file="../layout/footer_ara.jsp"%>