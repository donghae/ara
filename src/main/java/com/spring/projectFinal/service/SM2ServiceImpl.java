package com.spring.projectFinal.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Attend_Lec_VO;
import com.spring.projectFinal.SMVO.GpaVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_Stu_VO;
import com.spring.projectFinal.SMVO.Gpa_Total_VO;
import com.spring.projectFinal.SMVO.Lec_Reg_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.StudentVO;
import com.spring.projectFinal.persistence.SM2DAO;

@Service
public class SM2ServiceImpl implements SM2Service {

   @Autowired
   SM2DAO dao2;
   
   //희현
   
   @Override
   public void inputTotal(HttpServletRequest req, Model model) {
	   String st_no = (String) req.getAttribute("st_no");
	   System.out.println("qweds : "+st_no);
	   Gpa_Total_VO vo = new Gpa_Total_VO();
	   float gpa_total = dao2.total(st_no);
	   vo.setGpa_total(gpa_total);
	   vo.setGpa_semester("2018-1");
	   vo.setSt_no(st_no);
	   int cnt = dao2.totalCnt(st_no);
	  if(cnt == 0) {
	     int insertCnt = dao2.insertTotal(vo);
	     model.addAttribute("insertCnt", insertCnt);
	     System.out.println("인서트 : "+insertCnt );
	  } else {
	     int updateCnt = dao2.updateTotal(vo);
	     model.addAttribute("updateCnt", updateCnt);
	     System.out.println("업데이트 : "+updateCnt );
	  }
   }
   
   
   
   //아름
   
   // 교수 - 내 강의 목록
   @Override
   public void proLecList(HttpServletRequest req, Model model) {
      String id = (String) req.getSession().getAttribute("id");
      ArrayList<Lec_Reg_Prof_VO> proLecList = new ArrayList<>();
      String[][] timeTable = new String[5][14];
      String[][] lecRoom = new String[5][14];
      for(int i=0;i<5;i++) {
         Map<String, Object> map = new HashMap<>();
         map.put("d", i);
         map.put("prof_no", id);
         proLecList = dao2.proLecList(map);
         for(Lec_Reg_Prof_VO vo : proLecList) {
            int startTime = vo.getLec_dt()-9;
            int endTime = vo.getLec_dt()+vo.getLec_point() - 9;
            
            for(int j = startTime;j<endTime;j++) {
               timeTable[i][j] = vo.getLec_name();
               lecRoom[i][j] = vo.getLec_room_no();
            }
         }
      }      
      model.addAttribute("lecRoom", lecRoom);
      model.addAttribute("timeTable", timeTable);
   }

   // (교수) 수업관리 > 내 강의실 > 해당하는 강의를 듣는 학생 목록
   @Override
   public void proStuList(HttpServletRequest req, Model model) {
      String lec_name = req.getParameter("lec_name");
      String st_no = req.getParameter("st_no");
      
      System.out.println(lec_name+" : name");
      String dto3 = dao2.lecStart(dao2.changeLec(lec_name));
      
      req.setAttribute("dto3", dto3);
      model.addAttribute("dto3", dto3);      
      
      int cnt = dao2.proStuCnt(lec_name);
      if (cnt > 0) {
         Map<String, Object> map = new HashMap<>();
         map.put("lec_name", lec_name);
         map.put("st_no", st_no);
         ArrayList<Gpa_Lec_Stu_VO> dtos = dao2.proStuList(map);
         model.addAttribute("dtos", dtos);
         model.addAttribute("lec_name",lec_name);   
         System.out.println("dtos : "+dtos);
      }      
      model.addAttribute("cnt", cnt);
      model.addAttribute("lec_name", lec_name);
   }
   
   @Override
   public void inputPro(HttpServletRequest req, Model model) {
      String st_no = (String) req.getAttribute("st_no");
      String lec_name = (String) req.getAttribute("lec_name");
      GpaVO vo = new GpaVO();
      vo.setSt_no(st_no);
      vo.setLec_no(dao2.changeLec(lec_name));
      
      int gpa = Integer.parseInt(req.getParameter("attend"))
                  + Integer.parseInt(req.getParameter("midterm"))
                  + Integer.parseInt(req.getParameter("finalterm"))
                  + Integer.parseInt(req.getParameter("attitude"));
      float b= 0;
      if(95 <= gpa) {
         b = (float) 4.5; //a+
      } else if(90 <= gpa) {
         b = (float) 4; //a
      } else if(85 <= gpa) {
         b = (float) 3.5; //b+
      } else if(80 <= gpa) {
         b = (float) 3; //b
      } else if(75 <= gpa) {
         b = (float) 2.5; //c+
      } else if(70 <= gpa) {
         b = (float) 2; //c
      } else if(65 <= gpa){
         b = (float) 1.5;   //d+
      } else if(60 <= gpa) {
         b =(float) 1; //d
      } else {
         b = (float) 0; //f
      }
      vo.setGpa(b);
      vo.setGpa_semester("2018-1");
      int cnt = dao2.gradeCnt(st_no);
      if(cnt == 0) {   //성적이 없을때
         int insertCnt = dao2.insertGrade(vo);
         model.addAttribute("insertCnt", insertCnt);
      } else {   // 성적이 있을때
         int updateCnt = dao2.updateGrade(vo);
         model.addAttribute("updateCnt", updateCnt);
      }
      model.addAttribute("lec_name",lec_name);
      model.addAttribute("st_no", st_no);
   }
   // 출석
   @Override
   public void attendList(HttpServletRequest req, Model model) {
      String lec_name = req.getParameter("lec_name");
      String st_no = req.getParameter("st_no");
      
      String dto3 = dao2.lecStart(dao2.changeLec(lec_name));
      req.setAttribute("dto3", dto3);
      System.out.println("dto3 : " + dto3);
      model.addAttribute("dto3", dto3);
      
      int cnt = dao2.proStuCnt(lec_name);
      System.out.println("cnt : " + cnt);
      if (cnt > 0) {
         Gpa_Lec_Stu_VO vo = new Gpa_Lec_Stu_VO();
         Map<String, Object> map = new HashMap<>();
         map.put("lec_name", lec_name);
         map.put("st_no", st_no);
         vo = dao2.proStuList2(map);
         
         Map<String, Object> map2 = new HashMap<>();
         map2.put("st_no", st_no);
         map2.put("lec_no", dao2.changeLec(lec_name));
         ArrayList<Attend_Lec_VO> dtos2 = dao2.getAttendLi(map2);

         model.addAttribute("vo", vo);
         model.addAttribute("lec_name",lec_name);
         model.addAttribute("st_no", st_no);   
         model.addAttribute("dtos2", dtos2);
      }   
   }

   @Override
   public void inputPresent(HttpServletRequest req, Model model) {      
      String lec_name = req.getParameter("lec_name");   
      String dto3 = dao2.lecStart(dao2.changeLec(lec_name));
      model.addAttribute("dto3", dto3);      
      
      String st_name = req.getParameter("st_name");
      int attend_fl = Integer.parseInt(req.getParameter("attend"));
      
      Date td = new Date();
      String b = new String("");
      SimpleDateFormat format = new SimpleDateFormat(req.getParameter("lec_date"));
      b = format.format(td);
      
      AttendVO vo = new AttendVO();
      vo.setSt_no(dao2.changeStu(st_name));
      vo.setLec_no(dao2.changeLec(lec_name));
      vo.setAttend_fl(attend_fl);
      vo.setLec_dt(b);
      
      Map<String, Object> map = new HashMap<>();
      map.put("lec_dt", b);
      map.put("st_no", dao2.changeStu(st_name));
      map.put("lec_no", dao2.changeLec(lec_name));
      int cnt = dao2.sameDateCnt(map);
      
      if(cnt == 0) { //같은 날짜에 출결이 없을때
         int insertCnt = dao2.inputAttend(vo);
         model.addAttribute("insertCnt", insertCnt);
      } else { // 같은 날짜에 출결이 있을때
         int updateCnt = dao2.updateAttend(vo);
         System.out.println("같은날짜에 출결이 있을때 updateCnt : " + updateCnt);
         model.addAttribute("updateCnt", updateCnt);
      }
   }

   @Override
   public void proStuList2(HttpServletRequest req, Model model) {
      String lec_name = req.getParameter("lec_name");
      String st_no = req.getParameter("st_no");
      
      String dto3 = dao2.lecStart(dao2.changeLec(lec_name));
      System.out.println("dto3 : " + dto3);
      model.addAttribute("dto3", dto3);      
      
      int cnt = dao2.proStuCnt(lec_name);
      if (cnt > 0) {   
         Map<String, Object> map = new HashMap<>();
         map.put("lec_name", lec_name);
         map.put("st_no", st_no);
         
         Gpa_Lec_Stu_VO vo = new Gpa_Lec_Stu_VO();
         vo = dao2.proStuList2(map);
         model.addAttribute("vo", vo);
         model.addAttribute("lec_name",lec_name);      
      }      
      model.addAttribute("cnt", cnt);
      model.addAttribute("lec_name", lec_name);
   }
}