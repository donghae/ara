<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
select {
  width: 200px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}

select::-ms-expand {
  display: none;
}
</style>
</head>
<body>
   <div style="width:900px; float: left;">
      <div class="container" style="margin-left: 100px;">
         <div class="mail-box">
            <aside class="lg-side">
               <div class="inbox-head">
                  <div style="width: 60%; float: left;">
                     <br><br>
                     <h1>출결 - ${lec_name}</h1>
                  </div>
                  <div style="width: 30%; margin-left:870px;">
                     <br><br><br><br><br>
                     <h3>출결관리</h3>
                  </div>
               </div>
            </aside>         
            
            <div class="inbox-body">   
               <div class="mail-option">
               <p></p>
               <form action="inputAttend?lec_name=${lec_name}">
               <input type="hidden" value="${lec_name}" name="lec_name">
                  <table class="st_navy" style="text-align:center; width:1000px;">
                     <thead>   
                        <tr>
                           <th>번호</th>
                           <th>이름</th>
                              <c:forEach var="i" begin="0" end="14">
                           <th>${i+1}</th>
                              </c:forEach>
                           <th></th>
                        </tr>
                  </thead>
                                 
                    <tbody>
                              <c:set var="rnum" value="1" />
                              
                           <tr>
                              <td style="border-bottom:1px solid white;">${rnum}</td>
                              <td style="width:10%; border-bottom:1px solid white;">${vo.st_name}
                              <input type="hidden" value="${vo.st_name}" name="st_name"></td>

                              <c:forEach var="dtos2" items="${dtos2}">
                                 <td style="border-bottom:1px solid white;">
                                 <c:choose>
                                    <c:when test="${dtos2.attend_fl == 0}"><!-- 결석 -->Ⅹ</c:when>
                                    <c:when test="${dtos2.attend_fl == 1}"><!-- 정상 -->○</c:when>
                                    <c:when test="${dtos2.attend_fl == 2}"><!-- 지각 -->△</c:when>
                                 </c:choose>
                                 </td>
                                 
                                    <c:set var="rnum" value="${rnum+1}" />
                              </c:forEach>
                              <td></td>
                           </tr>   
                  </tbody>
                  
                     <tfoot>
                     <tr>               
                        <td colspan="14"/><td colspan="4">[O:출석, △:지각, X:결석]</td>
                     </tr>
                     
                        <tr></tr>
                        <tr></tr>
                     
                     <tr>      
                        <td colspan="17">
                        <select id="lec_date" name="lec_date">
                           <c:set var="dto3" value="${dto3}"/>
                           <c:forEach var="i" begin="0" end="14">
                              <fmt:parseDate var="startDate"  value="${dto3}" pattern="yy-MM-dd"/>
                                  <jsp:useBean id="myDate" class="java.util.Date"/>
                                  <c:set target="${myDate}" property="time" value="${startDate.time + (((1000*60*60*24)*7)*(i))}"/>
                              <fmt:formatDate var="lec_date" value="${myDate}"  pattern="yy-MM-dd"/>
                              <option value="${lec_date}">${i+1}주차:${lec_date}</option>
                           </c:forEach>            
                        </select>
                        
                        <select id="attend" name="attend">
                           <option value="0">결석</option>                              
                           <option value="1">출석</option>
                           <option value="2">지각</option>               
                        </select>
                        <input class="btn_navy" type="submit" value="저장" style="color:white">
                        </td>
                        <td colspan="4" />
                     </tr>
                     </tfoot>
                  </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>