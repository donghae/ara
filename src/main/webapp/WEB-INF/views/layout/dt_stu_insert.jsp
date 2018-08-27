<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

body {
    background: #48FFFF;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;
	height:600px;
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#48FFFF;
}
</style>
<script type="text/javascript">
 	function stu_inserts(){
		if(document.signup.st_no.value == ""){
			swal("학번을 입력해 주세요");
			return false;
		}
		
		
		
	} 


</script>
</head>
<body>

<div class="container" style="margin-left:550px;">
	<div class="row">
    <div class="col-md-8">
      <section>      
        <h1 class="entry-title"><span style="text-align: center;">학생등록</span> </h1>
        <hr>
            <form action="admin_stu_insert" class="form-horizontal" method="post" name="signup" id="signup" onsubmit="return stu_inserts();" enctype="multipart/form-data" >        
        <div class="form-group">
          <label class="control-label col-sm-3">학번<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="st_no" id="emailid" placeholder="학번을 입력해 주세요" value="">
            </div>
            </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">호실 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="text" class="form-control" name="dorm_room" id="password" placeholder="호실을 입력해 주세요" value="">
           </div>   
          </div>
        </div>
          
                
        <div class="form-group" style="margin-left: 5px;">
          <label class="control-label col-sm-3">기숙사 시작일  <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
              <div class="form-group">
                <select name="start_dd" class="form-control" style=" height:35px;">
                  <option value="">Date</option>
                  <option value="1" >1 </option><option value="2" >2 </option><option value="3" >3 </option><option value="4" >4 </option><option value="5" >5 </option><option value="6" >6 </option><option value="7" >7 </option><option value="8" >8 </option><option value="9" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <select name="start_mm" class="form-control" style=" height:35px;">
                  <option value="">Month</option>
				  <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div class="form-group" >
                <select name="start_yy" class="form-control" style=" height:35px;">
                  <option value="0">Year</option>
               <option value="2017" >2017 </option><option value="2018" >2018 </option><option value="2019" >2019 </option><option value="2020" >2020 </option>                </select>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group" style="margin-left: 5px;">
          <label class="control-label col-sm-3">기숙사 종료일  <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
              <div class="form-group">
                <select name="end_dd" class="form-control" style=" height:35px;">
                  <option value="0">Date</option>
                  <option value="1" >1 </option><option value="2" >2 </option><option value="3" >3 </option><option value="4" >4 </option><option value="5" >5 </option><option value="6" >6 </option><option value="7" >7 </option><option value="8" >8 </option><option value="9" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div class="form-group">
                <select name="end_mm" class="form-control" style=" height:35px;">
                  <option value="0">Month</option>
                  <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
              </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div class="form-group" >
                <select name="end_yy" class="form-control" style=" height:35px;">
                  <option value="0">Year</option>
                                 <option value="2017" >2017 </option><option value="2018" >2018 </option><option value="2019" >2019 </option><option value="2020" >2020 </option> </select>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="submit" value="등록" class="btn btn-primary">
          </div>
        </div>
      </form>
      </section>
    </div>
</div>
</div>
</body>
</html>