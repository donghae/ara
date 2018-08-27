<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp" %>
<html>
<script type="text/javascript"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="resources/boot_cyber/css/bootstrap.css"> -->
<!-- <script src="resources/boot_cyber/js/bootstrap.js"></script> -->
<style>
.wrap_dev1{
	display: inline;
	width: 100%;
	}
	.wrap_dev2{
	width:100%;
	text-align:center;
	background-color: #cacaca;
	}
</style>
<body>
<header>
<jsp:include page="../layout/header_ara.jsp"/>
</header>
<section>
<div class="wrap_dev1">
					<!-- gnb_dep1 영역 -->
					
						<div class="wrap_dev2">
							<div>
								<a href="cy_main"><span style="font-size: 2em;">온라인 강의</span></a>
							
								<a href="cy_add"><span style="font-size: 2em; margin-left: 10%;">강의추가</span></a>
							
								<a href="cy_comm"><span style="font-size: 2em; margin-left: 10%;">커뮤니티</span></a>
								
							</div>

						</div>

					</div>

<div class="container">

	<table class="table table-hover" style="height: 60%; margin-top: 50px;"> 
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임2</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임3</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임2</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임3</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임2</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>16</td>
			<td>이제 곧 Bootstrap 4가 나온다면서요?</td>
			<td>길라임3</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		</tbody>
	</table>
	
	<button class="btn btn-danger" style="padding:0 0 0 0;">글쓰기</button>
 	<div class="text-center">
		
		<button class="btn" style="padding:0 0 0 0;">1</button>
		<button class="btn" style="padding:0 0 0 0;">2</button>
		<button class="btn" style="padding:0 0 0 0;">3</button>
		<button class="btn" style="padding:0 0 0 0;">4</button>
		<button class="btn" style="padding:0 0 0 0;">5</button>
	</div>
</div> 

</section>
<footer>
<%@ include file = "../layout/footer_ara.jsp"%>
</footer>
</body>
</html>