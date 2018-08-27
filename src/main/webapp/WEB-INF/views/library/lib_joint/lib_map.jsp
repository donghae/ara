<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>  

<script type="text/javascript">
      function initMap() {
        var uluru = {lat: 37.478792, lng: 126.878710};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgIFYQqibR8JtdW6rTX2Js3k7t3_5PDgU&callback=initMap">
</script>


<body>
<!-- 헤더 -->
<%@include file="../../layout/header_lib.jsp" %>
	
<!-- 도서관 위치 지도 -->
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
							<h1>찾아오는 길</h1>
						</div>
					</div>
				</div>
				
				<div class="row course_boxes">
				
					<!-- Popular Course Item -->
					<div class="col-lg-12 course_box">
						<div class="card">							
							<div class="card-body text-center">
								<div class="card-text">
									<label></label>
									<div id="map" style="width: 100%; height: 50%;"></div>									
								</div>
								<div class="card-title"></div>
							</div>
							
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울특별시 금천구 가산동 1550 아라대학교</p>							
						</div>
					</div>
					
				</div>
			</div>		
		</div>
		
	</div>
</section>

<!-- 푸터 -->
<%@include file="../../layout/footer_ara.jsp" %>
</body>