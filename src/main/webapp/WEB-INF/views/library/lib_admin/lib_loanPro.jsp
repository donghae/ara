<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp"%>

<body>

<c:choose>
	<c:when test="${certiry == 1}">
	<!-- 학생,교수,관리자로 증명되었을 경우 -->
		<c:if test="${fn:length(b_nos) == 1}">		
		<!-- 1권 대여 시 -->						
		<c:choose>
		
			<c:when test="${laon_book != null}">
			<!-- 대여 성공 시 -->							
				<script type="text/javascript">
					swal("* 대 여 성 공 *\n\n${laon_book} 도서가 대여되었습니다").then((okay) => {
						if (okay) {
							window.location="lib_loanSupervise";
						} else {
							window.location="lib_loanSupervise";
						}
					});	
				</script>
			</c:when>
			
			<c:otherwise>
			<!-- 대여 실패 시 -->
				<c:if test="${fn:length(loan_unable) > 0}">
					<script type="text/javascript">
						swal("* 대 여 실 패 *\n\n${loan_unable} 은 대여 중인 도서 입니다").then((okay) => {
							if (okay) {
								window.location="lib_loanSupervise";
							} else {
								window.location="lib_loanSupervise";
							}
						});	
					</script>	
				</c:if>
				
				<c:if test="${fn:length(non_take) > 0}">
					<script type="text/javascript">
						swal("* 대 여 실 패 *\n\n${non_take} 은 비소장 도서입니다").then((okay) => {
							if (okay) {
								window.location="lib_loanSupervise";
							} else {
								window.location="lib_loanSupervise";
							}
						});	
					</script>
				</c:if>
			</c:otherwise>
									
		</c:choose>
		</c:if>	
	
		
		<c:if test="${fn:length(b_nos) > 1}">
		<!-- 1권 이상 대여시 -->
		<c:choose>
		
			<c:when test="${loanCnt > 0}">
			<!-- 대여 성공된 도서가 있을 경우 -->
			<c:choose>
				<c:when test="${fn:length(b_nos) == loanCnt}">
				<!-- 전체 대여 성공 시 -->
					<script type="text/javascript">
						swal("* 대 여 완 료 *\n\n${laon_book} 도서가 대여되었습니다").then((okay) => {
							if (okay) {
								window.location="lib_loanSupervise";
							} else {
								window.location="lib_loanSupervise";
							}
						});	
					</script>				
				</c:when>
				
				<c:otherwise>
				<c:choose>
				
					<c:when test="${fn:length(non_take) > 0 && fn:length(loan_unable) > 0}">
						<script type="text/javascript">
							swal("누락된 도서가 있습니다\n\n대여 완료  ${laon_book}\n대여 불가  ${loan_unable}\n비소장 도서  ${non_take}").then((okay) => {
									if (okay) {
										window.location="lib_loanSupervise";
									} else {
										window.location="lib_loanSupervise";
									}
								});	
						</script>	
					</c:when>
					
					<c:when test="${fn:length(non_take) > 0}">
						<script type="text/javascript">
							swal("누락된 도서가 있습니다\n\n대여 완료  ${laon_book}\n비소장 도서  ${non_take}").then((okay) => {
									if (okay) {
										window.location="lib_loanSupervise";
									} else {
										window.location="lib_loanSupervise";
									}
								});	
						</script>	
					</c:when>
					
					<c:when test="${fn:length(loan_unable) > 0}">
						<script type="text/javascript">
							swal("누락된 도서가 있습니다\n\n대여 완료  ${laon_book}\n대여 불가  ${loan_unable}").then((okay) => {
									if (okay) {
										window.location="lib_loanSupervise";
									} else {
										window.location="lib_loanSupervise";
									}
								});	
						</script>	
					</c:when>
					
				</c:choose>
				</c:otherwise>				

			</c:choose>
			</c:when>
			
			
			<c:otherwise>
			<!-- 전체 대여 실패 시  -->	
			<c:choose>
			
				<c:when test="${(fn:length(non_take)>0) and (fn:length(loan_unable)>0)}">
					<script type="text/javascript">
						swal("* 대 여 실 패 *\n\n대여 불가  ${loan_unable}\n비소장 도서  ${non_take}").then((okay) => {
								if (okay) {
									window.location="lib_loanSupervise";
								} else {
									window.location="lib_loanSupervise";
								}
							});	
					</script>	
				</c:when>
				
				<c:when test="${fn:length(non_take) > 0}">
					<script type="text/javascript">
						swal("* 대 여 실 패 *\n\n${non_take} 은 비소장 도서입니다").then((okay) => {
								if (okay) {
									window.location="lib_loanSupervise";
								} else {
									window.location="lib_loanSupervise";
								}
							});	
					</script>	
				</c:when>
				
				<c:when test="${fn:length(loan_unable) > 0}">
					<script type="text/javascript">
						swal("* 대 여 실 패 *\n\n${loan_unable} 은 대여 중인 도서입니다").then((okay) => {
								if (okay) {
									window.location="lib_loanSupervise";
								} else {
									window.location="lib_loanSupervise";
								}
							});	
					</script>	
				</c:when>
				
				<c:otherwise>
					<script type="text/javascript">
						swal("* 대 여 실 패 *").then((okay) => {
								if (okay) {
									window.location="lib_loanSupervise";
								} else {
									window.location="lib_loanSupervise";
								}
							});	
					</script>
				</c:otherwise>
			
			</c:choose>
			</c:otherwise>
			
		</c:choose>
		</c:if>	
	</c:when>
	
	<c:otherwise>
		<script type="text/javascript">
			swal("도서관 이용 권한이 없습니다").then((okay) => {
					if (okay) {
						window.location="lib_loanSupervise";
					} else {
						window.location="lib_loanSupervise";
					}
				});	
		</script>	
	</c:otherwise>
	
</c:choose>				
</body>