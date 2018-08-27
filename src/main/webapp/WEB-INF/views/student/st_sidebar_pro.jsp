<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/sidebar.css">
<body>
	<div style="height: 700px; width: 400px; float: left;">
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
				<div class="collapse navbar-collapse" id="sideNavbar">
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne"><span class="glyphicon glyphicon-book">
									</span>수업 관리<span class="caret"></span></a>
								</h4>
							</div>
							<!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
							<div id="collapseOne" class="panel-collapse collapse in">
								<ul class="list-group">
									<li>
										<a href="st_pro?st_state=50" class="navlink">내 강의실</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>