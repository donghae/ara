<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<div class="cen_middle_box">
	<div>
		<div class="content_w50" style="margin-top:0px; margin-bottom:50px; text-align:left">
			
		</div>
		<div class="content_w50" style="margin-top:0px; text-align:right">
			<p style="padding:15px;">
				<img src="${path}resources/images/library_img/seat/seat.png" width="10px"> 이용가능&nbsp;&nbsp;			
				<img src="${path}resources/images/library_img/seat/full.png" width="10px">	이용중&nbsp;&nbsp;
				<img src="${path}resources/images/library_img/seat/selected.png" width="10px"> 내 좌석&nbsp;
			</p>
		</div>
	</div>
	
	<table class="seat_table">
		<tr>			
		<c:forEach var="sVO" items="${sVOs}">				
			<td>		
				<!-- 내 좌석이 있을 경우 -->
				<c:if test="${mySeat != null}">
					<c:set var="myrd" value="${mySeat.rdRoom_no}"/>
					<c:set var="myseat" value="${mySeat.seat_no}"/>
				</c:if>	
					
				<!-- 빈 좌석/이용가능 좌석 -->		
				<c:if test="${sVO.seat_state == 0}">
					<c:if test="${myrd != null && myseat != null}">
					<!-- 내 좌석이 있을 시에는 다른 좌석 등록 못함 -->
						${sVO.seat_no}
						<img src="${path}resources/images/library_img/seat/seat.png" width="60px">
					</c:if>
					
					<c:if test="${myrd == null && myseat == null}">
						<a class="seat_color" id="${sVO.seat_no}_${sVO.seat_state}">
							${sVO.seat_no}
							<img src="${path}resources/images/library_img/seat/seat.png" width="60px">
						</a>
					</c:if>
				</c:if>	
				
				<!-- 이용중 좌석 -->
				<c:if test="${sVO.seat_state == 1}">				
					<c:choose>						
						<c:when test="${myrd == sVO.rdRoom_no && myseat == sVO.seat_no}">
						<!-- 내 좌석 -->
							<a class="seat_color" id="${sVO.seat_no}_${sVO.seat_state}">
								${sVO.seat_no}
								<img src="${path}resources/images/library_img/seat/selected.png" width="60px">
							</a>
						</c:when>
												
						<c:otherwise>
						<!-- 이용중 좌석 -->							
							${sVO.seat_no}
							<img src="${path}resources/images/library_img/seat/full.png" width="60px">
						</c:otherwise>	
					</c:choose>		
				</c:if>	
				
				<!-- 사용불가 좌석 -->
				<c:if test="${sVO.seat_state == 2}">
							
				</c:if>	
											
			</td>
			<c:if test="${sVO.seat_no % 8 == 0}">
				</tr>
				<tr>
			</c:if>
			
		</c:forEach>
		</tr>	
	</table>

	
	<br><br><br>
</div>	
</body>