<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<body>
<!-- 섹션 : 도서 연장 양식 -->

	<form style="padding:0px;" action="lib_renewPro" name="renewForm" class="form-basic" 
		method="post" onsubmit="return loanForm_written();">
	
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
					<h1>도서 연장</h1>
				</div>
		
				<div class="form-row">
					<label>
						<span>이용자 번호</span>
						<input style="display: inline-block;" id="input" type="text" name="user_no" required="required">
		            </label>					           
		        </div>
		        
		        <div class="form-row">
		   			<label class="formplus">
						<span>도서 번호</span>
						<input style="display: inline-block;" type="text" name="b_no" required="required">
						<a href="javascript:void(0);" onclick="addloanForm();return false;">
		    				<img src="resources/images/library_img/plus.png" style="width:40px; padding-left:10px;">
		    			</a>	
		            </label>
		        </div>
		        
		       	<div class="form-row">
				    <div class="cen_middle">
					    <input type="submit" class="btn_navy" style="padding:10px 20px;" value="연 장">
			     	</div>
		     	</div>
	     		</td>
     		</tr>
     	</tbody>
     </table>	
     </div>
    </form> 
</body>