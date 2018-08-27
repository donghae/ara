<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body>
<!-- 관리자 로그인 시 -->
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
				<!-- 빈 좌석 -->		
				<c:if test="${sVO.seat_state == 0}">
					<a class="seat_color" id="${sVO.seat_no}_${sVO.seat_state}">												
						${sVO.seat_no}
						<img src="${path}resources/images/library_img/seat/seat.png" width="60px">
					</a>					
				</c:if>	
				<!-- 이용중 좌석 -->
				<c:if test="${sVO.seat_state == 1}">
					<a class="seat_color" id="${sVO.seat_no}_${sVO.seat_state}">
						${sVO.seat_no}
						<img src="${path}resources/images/library_img/seat/full.png" width="60px">
					</a>			
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