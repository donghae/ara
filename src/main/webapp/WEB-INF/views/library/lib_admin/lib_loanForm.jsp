<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<script type="text/javascript" src="${path}resources/js/library.js"></script>   


<body>
<!-- 섹션 : 도서 대여 양식 -->
<form action="lib_loanPro" name="loanForm" class="form-basic" 
	method="post" onsubmit="loanForm_written();" style="padding:0px;" >
	
	<div class="main-content" style="padding:0px;">	
	<table class="responsive-table" >
		<thead class="responsive-table">
			<tr>
				<th></th>
			</tr>
		</thead>
		<tbody class="responsive-table">
			<tr>
			<td>
				<div class="form-title-row">
					<h1>도서 대여</h1>
				</div>
		
				<div class="form-row">
					<label>
						<span>이용자 번호</span>
						<input style="display: inline-block;" type="text" name="user_no" required>
				    </label>
				</div> 
				
				<div class="form-row">
					<label class="formplus">
						<span>도서 번호</span>
						<input style="display: inline-block;" type="text" name="b_no" required>
						<a href="javascript:void(0);" onclick="addloanForm();return false;">
							<img src="resources/images/library_img/plus.png" style="width:40px; padding-left:10px;">
						</a>	
				   </label>	           
				</div>
		
		  		<div class="form-row">
					<div class="cen_middle">
						  <input type="submit" id="loanBtn" class="btn_navy" style="padding:10px 20px;" value="대 여">
				 	</div>
				</div>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
</form>
</body>