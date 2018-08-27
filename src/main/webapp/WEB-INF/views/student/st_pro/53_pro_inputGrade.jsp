<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
   <div style="width:900px; float: left;">
      <div class="container" style="margin-left: 100px;">
         <div class="mail-box">
            <aside class="lg-side">
               <div class="inbox-head">
                  <div style="width:50%; float: left;">
                     <br><br>
                     <h1>성적</h1>
                  </div>
                  <div style="width: 30%; margin-left:680px;">
                     <br><br><br><br><br>
                     <h3>성적관리</h3>
                  </div>
               </div>
            </aside>         
                     
            <div class="inbox-body">   
               <div class="mail-option">
               <form action="inputGradePro" name="inputGradeForm">
                  <input type="hidden" value="${lec_name}" name="lec_name">

                  <table class="st_navy" style="text-align:center;">
                     <thead>   
                        <tr>
                           <th style="width:30%">강의명</th>   
                           <th>학번</th>
                           <th>전공</th>               
                           <th>이름</th>
                        </tr>
                        
                        <tr>
                        
                           <td>${lec_name}</td>                           
                           <td>${st_no}<input type="hidden" value="${st_no}" name="st_no"></td>
                           <td>
                              <c:if test="${maj_cd == 101}">기계공학</c:if>
                                 <c:if test="${maj_cd == 102}">소프트웨어공학</c:if>
                                 <c:if test="${maj_cd == 103}">식품공학</c:if>
                                 <c:if test="${maj_cd == 104}">전기공학</c:if>
                                 <c:if test="${maj_cd == 105}">화학공학</c:if>
                                 
                                 <c:if test="${maj_cd == 201}">물리학</c:if>
                                 <c:if test="${maj_cd == 202}">미생물학</c:if>
                                 <c:if test="${maj_cd == 203}">분자생물학</c:if>
                                 <c:if test="${maj_cd == 204}">생명과학</c:if>
                                 <c:if test="${maj_cd == 205}">화학</c:if>
                                 
                                 <c:if test="${maj_cd == 301}">경영학</c:if>
                                 <c:if test="${maj_cd == 302}">경제학</c:if>
                                 <c:if test="${maj_cd == 303}">심리학</c:if>
                                 <c:if test="${maj_cd == 304}">정치외교학</c:if>
                                 <c:if test="${maj_cd == 305}">행정학</c:if>
                                 
                                 <c:if test="${maj_cd == 401}">도예</c:if>
                                 <c:if test="${maj_cd == 402}">무용</c:if>
                                 <c:if test="${maj_cd == 403}">문예창작</c:if>
                                 <c:if test="${maj_cd == 404}">실용음악</c:if>
                                 <c:if test="${maj_cd == 405}">조소</c:if>
                                 
                                 <c:if test="${maj_cd == 501}">국어국문학</c:if>
                                 <c:if test="${maj_cd == 502}">사학</c:if>
                                 <c:if test="${maj_cd == 503}">영어영문학</c:if>
                                 <c:if test="${maj_cd == 504}">철학</c:if>
                                 <c:if test="${maj_cd == 505}">포르투갈어</c:if>
                                 
                                 <c:if test="${maj_cd == 601}">국제스포츠학</c:if>
                                 <c:if test="${maj_cd == 602}">생활체육학</c:if>
                                 <c:if test="${maj_cd == 603}">스포츠경영학</c:if>
                                 <c:if test="${maj_cd == 604}">스포츠응용산업학</c:if>
                                 <c:if test="${maj_cd == 605}">체육교육학</c:if>
                           </td>
                           <td>${st_name}</td>
                        </tr>
                        
                        <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>                        
                  </thead>
                  
                  <tbody>
                     <tr>
                        <td colspan="4">* 점수를 입력해주세요. *</td>
                     </tr>
                  
                     <tr>
                        <td style="width:25%">출결(20점)</td>
                        <td style="width:25%">중간고사(30점)</td>
                        <td style="width:25%">기말고사(30점)</td>
                        <td style="width:25%">태도(20점)</td>
                     </tr>
                  
                     <tr>
                        <td><input type="number" name="attend" min="1" max="20"></td>
                        <td><input type="number" name="midterm" min="1" max="30"></td>
                        <td><input type="number" name="finalterm" min="1" max="30"></td>
                        <td><input type="number" name="attitude" min="1" max="20"></td>
                     </tr>         
                  </tbody>
                     
                  <tfoot>   
                     <tr>
                        <td colspan="4">
                           <input class="btn_navy" type="submit" value="저장" style="float:right; color:white;">
                        </td>
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