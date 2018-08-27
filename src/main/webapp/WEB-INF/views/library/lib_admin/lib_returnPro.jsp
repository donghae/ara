<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>

<body>
<c:choose>
	<c:when test="${certiry == 1}">
	<!-- 학생,교수,관리자로 증명되었을 경우 -->
		<c:if test="${fn:length(b_nos) == 1}">		
		<!-- 1권 반납 시 -->						
		<c:choose>
		
			<c:when test="${return_book != null}">
			<!-- 반납 성공 시 -->							
				<script type="text/javascript">
					swal("* 반 납 성 공 *\n\n${return_book} 도서가 반납되었습니다").then((okay) => {
						if (okay) {
							window.location="lib_loanSupervise";
						} else {
							window.location="lib_loanSupervise";
						}
					});	
				</script>
			</c:when>
			
			<c:otherwise>
			<!-- 반납 실패 시 -->
				<c:if test="${fn:length(return_unable) > 0}">
					<script type="text/javascript">
						swal("* 반 납 실 패 *\n\n${return_unable} 은 이미 반납처리된 도서 입니다").then((okay) => {
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
						swal("* 반 납 실 패 *\n\n${non_take} 은 비소장 도서입니다").then((okay) => {
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
		<!-- 1권 이상 반납시 -->
		<c:choose>
		
			<c:when test="${returnCnt > 0}">
			<!-- 반납 성공된 도서가 있을 경우 -->
			<c:choose>
				<c:when test="${fn:length(b_nos) == returnCnt}">
				<!-- 전체 반납 성공 시 -->
					<script type="text/javascript">
						swal("* 반 납 완 료 *\n\n${return_book} 도서가 반납되었습니다").then((okay) => {
							if (okay) {
								window.location="lib_loanSupervise";
							} else {
								window.location="lib_loanSupervise";
							}
						});	
					</script>				
				</c:when>
				
				<c:otherwise>
				<!-- 일부 도서만 반납 성공 시 -->
				<c:choose>
				
					<c:when test="${fn:length(non_take) > 0 && fn:length(return_unable) > 0}">
						<script type="text/javascript">
							swal("누락된 도서가 있습니다\n\n반납 완료  ${return_book}\n반납 불가  ${return_unable}\n비소장 도서  ${non_take}").then((okay) => {
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
							swal("누락된 도서가 있습니다\n\n반납 완료  ${return_book}\n비소장 도서  ${non_take}").then((okay) => {
									if (okay) {
										window.location="lib_loanSupervise";
									} else {
										window.location="lib_loanSupervise";
									}
								});	
						</script>	
					</c:when>
					
					<c:when test="${fn:length(return_unable) > 0}">
						<script type="text/javascript">
							swal("누락된 도서가 있습니다\n\n반납 완료  ${return_book}\n반납 불가  ${return_unable}").then((okay) => {
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
			
				<c:when test="${(fn:length(non_take)>0) and (fn:length(return_unable)>0)}">
					<script type="text/javascript">
						swal("* 반 납 실 패 *\n\n반납 불가  ${return_unable}\n비소장 도서  ${non_take}").then((okay) => {
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
						swal("* 반 납 실 패 *\n\n${non_take} 은 비소장 도서입니다").then((okay) => {
								if (okay) {
									window.location="lib_loanSupervise";
								} else {
									window.location="lib_loanSupervise";
								}
							});	
					</script>	
				</c:when>
				
				<c:when test="${fn:length(return_unable) > 0}">
					<script type="text/javascript">
						swal("* 반 납 실 패 *\n\n${return_unable} 은 이미 반납처리된 도서입니다").then((okay) => {
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
						swal("* 반 납 실 패 *").then((okay) => {
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