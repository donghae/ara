<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript" src="resources/js/student.js"></script> 
<style>
	.bg-gray {
		background-color: #E5E7EA;
	}
	
	#admin_stu_upd{
		position: relative;
		top:200px;
	}
	#side{
		position: relative;
		top:200px;
	}
	
	#paste{
		width:400px; height:200px; padding:0px;
	}	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<head>
	
	<script type="text/javascript">

  var loadFile = function(event) {

    var output = document.getElementById('output');

    output.src = URL.createObjectURL(event.target.files[0]);
  };

	function stu_update(){	
		if(document.admin_stu_upd.dorm_room.value == ""){
			swal("기숙사 호실을 입력해 주세요.");
			document.admin_stu_upd.dorm_room.focus();
			return false;
		}
		
		if(document.admin_stu_upd.dorm_st_dt.value == ""){
			swal("기숙사 시작일을 입력해 주세요");
			return false;
		}else{
			var stDt = document.admin_stu_upd.dorm_st_dt.value;
		}
		
		if(document.admin_stu_upd.dorm_end_dt.value == ""){
			swal("기숙사 종료일을 입력해 주세요");
			return false;			
		}else{
			var enDt = document.admin_stu_upd.dorm_end_dt.value;				
		}
		
		if(stDt < enDt){
		}else{
			swal("기숙사 시작일이 종료일보다 크지 않아야 합니다.");
			document.admin_stu_upd.dorm_st_dt.focus();
			return false;
		}
		
	    /* var startArray = stDt.split('-');
        var endArray = enDt.split('-');  
    
        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);
 
         //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
        if(start_date.getTime() < end_date.getTime()) {
            alert("시작날짜보다 종료날짜가 작아야합니다.");
            return false;
         }         
               
        //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
        if(start_date.getTime() > end_date.getTime()) {
            swal("종료일이 시작날짜 보다 작아야합니다.");
            document.admin_stu_upd.dorm_end_dt.focus();
            return false;
         }   */     
	}  
  
</script>

</head>
	
<body>
<%@ include file="../../layout/header_dormitory_home.jsp"%>
<section>	
	<article style="height: 1100px;">
			<%-- <div id="side" style="width:300px; height:500px; float: left; display: inline-block;">
				<%@ include file="../../layout/dt_admin_side.jsp"%>
			</div> --%>	
			
		<div class="content">

			<div class="cen_middle">	
				<form action="dt_admin_stu_update?st_no=${st_no}" name="admin_stu_upd" id="admin_stu_upd" method="post" onsubmit="return stu_update();">
						 <div >
						 <table class="st_navy" style="width:1100px;">
							<thead class="st_navy">
								<tr>
									<th colspan="2"><h2>학생 정보 수정</h2></th>
								</tr>
							</thead>
							
							<tbody class="st_navy">

								<tr>
									<td style="width:45%;">학 번</td>
									<td>
										<span style="width:400px; text-align: center;">
											${st_no}
										</span>
									</td>
								</tr>
								
								<tr>
									<td style="width:45%;">이 름</td>
									<td><span style="width:400px; text-align: center;">${st_name}</span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">호 실</td>
									<td><span style="width:400px; text-align: center;"><input type="text" name="dorm_room"  value="${dorm_room}" style="width:300px; text-align: center;"></span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">기숙사 시작일</td>
									<td><span style="width:400px; text-align: center;"><input type="Date" name="dorm_st_dt"  value="${dorm_st_dt}" style="width:300px; padding-left:100px;"></span></td>
								</tr>
								
								<tr>
									<td style="width:45%;">기숙사 종료일</td>
									<td><span style="width:400px; text-align: center;"><input type="Date" name="dorm_end_dt"  value="${dorm_end_dt}" style="width:300px; padding-left:100px;"></span></td>
								</tr>
	

								<tr>
									<td style="width:45%;"> </td>
									<td><span style="width:400px; text-align: center;"></span></td>
								</tr>																																														
							</tbody>
						</table>

						</div>
						<div class="form-row" style="padding-top:70px">
							<div class="cen_middle"><br>
								  <input class="btn_navy" type="submit" value="수정" style="font-size:20px;">
								  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								  <input class="btn_navy" type="button" value="목록" style="font-size:20px;" onclick='history.back();'>  
						 	</div> 						 							 	
						</div>
				</form>
			</div>
		</div>
	
	</article>
</section>	
</body>
<%@ include file="../../layout/footer_lib2.jsp"%>
</html>