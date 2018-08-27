<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/box_mon.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/font_common.css">
<link rel="stylesheet" href="resources/css/footer_ara.css">
<link rel="stylesheet" href="resources/css/form-basic.css">
<link rel="stylesheet" href="resources/css/header_ara.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">

</head>
<body>
   <div style="width: 900px; float: left;">
      <div class="container" style="margin-left: 100px;">
         <div class="mail-box">
            <aside class="lg-side">
            <div class="inbox-head">
               <div style="width: 30%; float: left;">
                  <br> <br>
                  <h1>성적 관리</h1><br><br>
               </div>
               <!-- <div style="width: 30%; float: right;">
                  <br> <br>
                  <h3> ----- </h3>
               </div> -->
            </div>
            
            <div class="inbox-body">
               <div class="mail-option">
                  <table class="st_mint" style="width:700px;">
                     <tr>
                        <th>학기</th>
                        <th>강의명</th>
                        <th>학번</th>
                        <th>이름</th>
                        <th>성적</th>
                     </tr>
                     <c:if test="${cnt>0}">
                        <c:forEach var="dto" items="${dtos}">
                           <tr>
                              <td>${dto.gpa_semester}</td>
                              <td>${dto.lec_name}</td>
                              <td>${dto.st_no}</td>
                              <td>${dto.st_name}</td>      
                              <td>${dto.gpa}</td>
                           </tr>
                        </c:forEach>
                     </c:if>

                     <c:if test="${cnt==0}">
                        <tr>
                           <td colspan="6" align="center">학생이 없습니다.</td>
                        </tr>
                     </c:if>
                     
                  </table>
                  
               </div>
            </div>
            </aside>
         </div>
      </div>
   </div>
</body>