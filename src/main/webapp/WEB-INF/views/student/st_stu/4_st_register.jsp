<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function openAddr(){
      daum.postcode.load(function(){
             new daum.Postcode({
                 oncomplete: function(data) {
                        document.getElementsByName( "st_zipcode" )[0].value = data.zonecode;
                              document.getElementsByName( "addr1" )[0].value = data.roadAddress;
                 }
             }).open();
         });
     }
     
function nexthp1() {
   if(document.myForm.hp1.value.length>=3) {
      document.myForm.hp2.focus();
   }
}

function nexthp2() {
   if(document.myForm.hp2.value.length>=4) {
      document.myForm.hp3.focus();
   }
}     
</script>
</head>
<style>
   .bg-gray {
      background-color:#E5E7EA;
   }
   
   #pf_img {
      width:140px;
   }
  table {
    width: 100%;
    border: 1px solid #6C6969;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #6C6969;
    padding: 10px;
  }
   
</style>
<body>
   <div style="width: 900px; float: left;">
      <div class="container" style="margin-left: 100px;">
         <div class="mail-box">
            <aside class="lg-side">
               <div class="inbox-head">
                  <div style="width: 30%; float: left;">
                     <br>
                     <br>
                     <h1>기본 정보</h1>
                  </div>
                  <div class="inbox-body">
                  <div class="mail-option">
                     <!-- <div class="container"> -->
                     <div>
                     <form action="StModiPro" method="post" name="myForm">
                        <table>
                           <thead>
                              <tr> <!-- //resources/images/addmission_img/ -->
                                 <th rowspan="4"><img id="pf_img" src="resources/images/addmission_img/${vo.getSt_img()}"></th>
                                 <th class="bg-gray">이름</th>
                                 <td>${vo.getSt_name()}</td>
                                 <th class="bg-gray">입학일</th>
                                 <td>${vo.getSt_ent_dt()}</td>
                              </tr>
                              
                              <tr>
                                 <th scope="row" class="bg-gray">학번</th>
                                 <td>${vo.getSt_no()}</td>
                                 <th class="bg-gray">휴학여부</th>
                                 <td>
                                    <c:if test="${vo.getSt_abs_fl() == 0}">재학</c:if>
                                    <c:if test="${vo.getSt_abs_fl() == 1}">휴학</c:if>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th scope="row" class="bg-gray">전공명</th>
                                 <td>
                                    <c:if test="${vo.getMaj_cd() == 101}">기계공학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 102}">소프트웨어공학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 103}">식품공학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 104}">전기공학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 105}">화학공학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 201}">물리학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 202}">미생물학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 203}">분자생물학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 204}">생명과학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 205}">화학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 301}">경영학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 302}">경제학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 303}">심리학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 304}">정치외교학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 305}">행정학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 401}">도예과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 402}">무용과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 403}">문예창작과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 404}">실용음악과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 405}">조소과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 501}">국어국문학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 502}">사학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 503}">영어영문학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 504}">철학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 505}">포르투갈어과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 601}">국제스포츠학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 602}">생활체육학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 603}">스포츠경영학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 604}">스포츠응용산업학과</c:if>
                                    <c:if test="${vo.getMaj_cd() == 605}">체육교육학</c:if>
                                 </td>
                                 <th class="bg-gray">장애여부</th>
                                 <td>
                                 <c:if test="${vo.getSt_disable_fl() ==0}">
                                    해당사항없음
                                 </c:if>
                                 <c:if test="${vo.getSt_disable_fl() !=0}">
                                    장애있음.
                                 </c:if>                                 
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th scope="row" class="bg-gray">이메일</th>
                                 <td ><input type="email" value="${vo.getSt_email()}" name="email" style="width:200px;"></td>
                                 <th class="bg-gray">전화번호</th>
                                 <td colspan="2">
                                    <c:set var="hpArr" value="${fn:split(vo.getSt_hp(), '-')}"/> 
                                       <input class="input" type="text" name="hp1" maxlength="3"
                                          style="width:40px" onkeyup="nexthp1();" value="${hpArr[0]}">
                                       -   
                                       <input class="input" type="text" name="hp2" maxlength="4"
                                          style="width:40px" onkeyup="nexthp2();" value="${hpArr[1]}">
                                       -   
                                       <input class="input" type="text" name="hp3" maxlength="4"
                                          style="width:40px" value="${hpArr[2]}">
                              </tr>
                              
                              <tr>
                                 <th scope="row" class="bg-gray">주소</th>
                                 <td colspan="4"><input name="st_zipcode" type="text" readonly="readonly" value="${vo.getSt_zipcode()}" style="width:80px;"/>
                  <input name="searchAddrButton" class="btn_navy" value="주소찾기" type="button" onclick="openAddr();"/><br>
                                 <input name="addr1" type="text" value="${vo.getSt_addr1()}" style="width:350px;"/>
                                 <input name="addr2" type="text" value="${vo.getSt_addr2()}" style="width:300px;"/></td>
                              </tr>
                              
                              <tr>
                                 <th scope="row" class="bg-gray">은행</th>
                                 <td><input type="text" name="st_bk" value="${vo.getSt_bk()}">
                                 <td><input type="text" name="st_bkno" value="${vo.getSt_bkno()}"></td>
                                 <th class="bg-gray">예금주명</th>
                                 <td><input type="text" name="st_bk_holder" value="${vo.getSt_bk_holder()}"></td>
                              </tr>
                              
                              <tr>
                                 <td colspan="5">
                                    <input type="submit" class="btn_navy" value="저장" style="margin-left:850px;">
                                 </td>
                              </tr>                                                         
                           </thead>                  
                        </table></form>
                        <form>
                        	<fieldset>
                        		<legend style="color:red">안내</legend>
                        		<ul>
                        			<li>1.기본정보 관련사항(성명,영문명,한자명,주민번호 등) 수정은 소속학과나 학사팀으로 문의하여 주시길 바랍니다.</li>
                        			<li>2.계좌번호 입력 시 반드시 계좌 확인 버튼을 누른 후 저장 하십시오.(은행 서버와 연동해서 계좌 정보 처리를 하고 있습니다.)</li>
                        			<li>계좌 확인 버튼 클릭시 오류가 발생하는 경우에 계좌확인 버튼을 누르지 않고 직접 예금주명을 입력후 저장 처리하여 주시기 바랍니다.</li>
                        		</ul>
                        	</fieldset>
                        </form>
                     </div>
                  </div></div>
                  </div>
            </aside>
         </div>
      </div>         
	</div>            
</body>
</html>