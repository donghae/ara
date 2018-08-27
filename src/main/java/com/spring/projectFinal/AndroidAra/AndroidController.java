package com.spring.projectFinal.AndroidAra;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.projectFinal.AndroidAra.StudentVO;


@Controller
public class AndroidController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	AndroidDAO dao;

	// 앱 로그인
	@ResponseBody // 웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidLogin")
	public Map<String, Object> androidSignIn(HttpServletRequest req, Model model) {
		log.info("androidLogin()");
		int cnt = 0;
		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("st_no", id);
		map.put("st_pwd", pwd);
		
		// 아이디와 비밀번호가 일치 cnt=1
		cnt = dao.confirmIdPwd(map);
		
		// 웹에서 전달할 값
		Map<String, Object> out = new HashMap<String, Object>();
		if((id.equals("") && pwd.equals("")) || (id != null && pwd != null)) {
			out.put("st_no", "0");
		}
		if (cnt == 1) {
			log.info("로그인 성공 : " + cnt);			
						
			out.put("st_pwd", pwd);
			out.put("st_no", id);
		}  else {
			log.info("로그인 실패");
		}

		return out;
	}

	
	// 앱 출결
	@ResponseBody
	@RequestMapping("androidAttendance")
	public Map<String, Object> androidAttendance(HttpServletRequest req) {
		log.info("androidAttendance()");

		// 회원 정보
		String st_no = req.getParameter("id");
		
		System.out.println("id : " + st_no);

		List<AttendVO> m = dao.getAttendList(st_no);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("attend", m);
		map.put("keyword", "attendance");
		return map;
	}
	// 앱 성적조회
	@ResponseBody
	@RequestMapping("androidScore")
	public Map<String, Object> androidScore(HttpServletRequest req) {
		log.info("androidScore()");

		// 회원 정보
		String st_no = req.getParameter("id");
		
		System.out.println("id : " + st_no);

		List<Gpa_Total_VO> m = dao.getGpaList(st_no);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("score", m);
		map.put("keyword", "score");
		return map;
	}
	// 앱 학적조회
	@ResponseBody
	@RequestMapping("androidMyInfo")
	public Map<String, Object> androidMyInfo(HttpServletRequest req) {
		log.info("androidMyInfo()");

		
		// 회원 정보
		String st_no = req.getParameter("id");
		
		System.out.println("id : " + st_no);

		StudentVO m = dao.getMemberInfo(st_no);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myInfo", m);
		map.put("keyword", "myInfo");
		return map;
	}
	
	// 앱 시간표조회
	@ResponseBody
	@RequestMapping("androidTimetable")
	public Map<String, Object> androidTimetable(HttpServletRequest req) {
		log.info("androidTimetable()");

		
		// 회원 정보
		String st_no = req.getParameter("id");
		
		System.out.println("id : " + st_no);

		String dayStr = req.getParameter("day");
		int day = Integer.parseInt(dayStr);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(day!=5) {
			Map<String, Object> param = new HashMap<>();
			param.put("d", day);
			param.put("st_no", st_no);
			List<Stu_Reg_Lec_VO> m = dao.getLectureInfo(param);
			
			
			map.put("timetable", m);
			map.put("keyword", "timetable");
			
		}else {
			map.put("timetable", null);
			map.put("keyword", "timetable");
		}
		
		return map;
	}
	// 앱 시간표조회
	@ResponseBody
	@RequestMapping("androidTotalTimetable")
	public Map<String, Object> androidTotalTimetable(HttpServletRequest req) {
		log.info("androidTotalTimetable()");

		
		// 회원 정보
		String st_no = req.getParameter("id");
		
		System.out.println("id : " + st_no);

		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<List<Stu_Reg_Lec_VO>> m = new ArrayList<>();
		for(int i=0;i<5;i++) {
			Map<String, Object> param = new HashMap<>();
			param.put("d", i);
			param.put("st_no", st_no);
			m.add(dao.getLectureInfo(param));
		}
		map.put("totaltimetable", m);
		map.put("keyword", "timetable");
			
		
		
		return map;
	}
}
