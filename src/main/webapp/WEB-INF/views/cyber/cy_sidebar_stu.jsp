<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/sidebar.css">
<body>
	<div style="min-height: 40%;float: left;">
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3">
			<div id="sidenav1">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#sideNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="sideNavbar" style="margin-left: -10%;margin-top: -150%">
					<div class="panel-group" id="accordion">
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_lec_list">강의목록</a>
								</h4>
							</div>							
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_main">공지사항</a>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>