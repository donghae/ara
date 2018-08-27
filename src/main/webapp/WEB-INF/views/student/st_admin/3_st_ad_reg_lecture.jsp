<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function regStart() {
		swal("수강신청을 시작합니다.").then((okay) => {
			  if (okay) {
				  window.location = 'regStart';
				  }
				});
	}
	function regEnd() {
		swal("수강신청을 종료합니다.").then((okay) => {
			  if (okay) {
				    window.location = 'regEnd';
				  }
				});
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/student.js"></script>
<style>
.bg-gray {
	background-color: #E5E7EA;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
</head>
<body>
	<div style="height: inherit; width: 500px; display: inline-block;">
		<div style="width: 1300px; height: 850px; float: left;">
			<div class="container" style="margin-left: 100px;">
				<div style="width: 30%; float: left;">
					<br> <br>
					<h1>수강 신청 관리</h1>
				</div>
				<div class="mail-box" style="top: 30px;">
					<form action="lecturePro" method="post"
						enctype="multipart/form-data" name="myForm"
						onsubmit="return inputCheck();">
						<input type="hidden" name="prof_no">
						<table style="width: 800px; margin-left: 0px;" align="center">
							<tr style="text-align: center; background-color: #001E42;">
								<th colspan="4" style="color: white; height: 80px;"><h2>수강
										신청</h2></th>
							</tr>
							<tr>
								<td style="padding-bottom: 0px; padding-top: 10px;"></td>
							</tr>
							<tr class="bg-gray">
								<td style="text-align: center" colspan="3">수강신청 시작</td>
							</tr>
							<tr>
								<td style="text-align: center" colspan="3"><input
									style="width: 100px; height: 50px;" class="btn_navy"
									type="button" value="Start" onclick="regStart();"></td>
							</tr>
							<tr class="bg-gray">
								<td style="text-align: center" colspan="3">수강신청 종료</td>
							</tr>
							<tr>
								<td style="text-align: center" colspan="3"><input
									style="width: 100px; height: 50px;" class="btn_navy"
									type="button" value="End" onclick="regEnd();"></td>
							</tr>
							<tr class="bg-gray">
								<th style="text-align: center" colspan="2"></th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



