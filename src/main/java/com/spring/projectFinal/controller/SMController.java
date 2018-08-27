package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.projectFinal.service.SM2Service;
import com.spring.projectFinal.service.SMService;

@Controller
public class SMController {

	int st_state = 0;

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(SMController.class);

	@Autowired
	SMService service;
	
	@Autowired
	SM2Service service2;

	// 학생 메인 페이지
	@RequestMapping("st_stu")
	public String st_stu(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {
			// 학적 관리 > 기본 학적
			if (Integer.parseInt(req.getParameter("st_state")) == 10) {
				service.st_profile(req, model);
			}
			// 수업관리 > 시간표
			if (Integer.parseInt(req.getParameter("st_state")) == 21) {
				service.regTimeTable(req, model);
				// service.st_timetable(req, model);
			}

			// 수업관리 > 내 강의실 > 강의목록
			if (Integer.parseInt(req.getParameter("st_state")) == 11) {
				service.st_lectureList(req, model);
			}

			// 수업관리 > 수강 신청
			if (Integer.parseInt(req.getParameter("st_state")) == 12) {
				service.cartList(req, model);
				service.regList(req, model);
				int regfl = service.regfl(req,model);
				model.addAttribute("regfl",regfl);
			}

			// 수업관리 > 수강 계획 도우미
			if (Integer.parseInt(req.getParameter("st_state")) == 13) {
				service.lectureList(req, model);
				service.cartList(req, model);
			}

			// 수업관리 > 강의 시간표(전체용)
			if (Integer.parseInt(req.getParameter("st_state")) == 14) {
				service.lectureList(req, model);
			}

			// 수업관리 > 내 강의실 > 강의목록 > 출결현황
			if (Integer.parseInt(req.getParameter("st_state")) == 19) {
				service.st_attendList(req, model);
				String lec_name = req.getParameter("lec_name");
				req.setAttribute("lec_name", lec_name);
			}

			// 성적관리 > ①금학기 성적 조회
			if (Integer.parseInt(req.getParameter("st_state")) == 15) {

				String semester = req.getParameter("semester");
				req.setAttribute("semester", semester);
				service.st_gpaList(req, model);
			}

			// 장학금관리 > 장학금 수여 내역 조회
			if (Integer.parseInt(req.getParameter("st_state")) == 16) {
				service.gpaList(req, model);
				service.stuTotal(req,model);
			}

			// 등록금관리 > 등록금 납부 조회
			if (Integer.parseInt(req.getParameter("st_state")) == 18) {
				int tuition = service.tuition(req, model); // 등록금 가져오기
				service.rank(req,model);
				model.addAttribute("tuition", tuition);
			}
			System.out.println("ARA university-아라대 학생페이지");
		}
		return "student/st_main_stu";
	}

	// 교수 메인 페이지
	@RequestMapping("st_pro")
	public String st_pro(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {

			// (교수) 수업관리 > 내 강의실(시간표)
			if (Integer.parseInt(req.getParameter("st_state")) == 50) {
				service2.proLecList(req, model);
			}

			// (교수) 수업관리 > 내 강의실 > 해당하는 강의를 듣는 학생 목록
			if (Integer.parseInt(req.getParameter("st_state")) == 51) {
				service2.proStuList(req, model);
			}

	         // (교수) 수업관리 > 내 강의실 > 출결 입력
	         if (Integer.parseInt(req.getParameter("st_state")) == 52) {
	            String st_no = req.getParameter("st_no");
	            String dto3 = req.getParameter("dto3");
	            req.setAttribute("dto3", dto3);
	            req.setAttribute("st_no", st_no);
	            model.addAttribute("st_no", st_no);
	            model.addAttribute("dto3", dto3);
	            service2.attendList(req, model);
	         }

	         // (교수) 수업관리 > 내 강의실 > 성적 입력
	         if (Integer.parseInt(req.getParameter("st_state")) == 53) {
	            String st_name = req.getParameter("st_name");
	            String st_no = req.getParameter("st_no");
	            int maj_cd = Integer.parseInt(req.getParameter("maj_cd"));
	            model.addAttribute("st_name", st_name);
	            model.addAttribute("st_no", st_no);
	            model.addAttribute("maj_cd", maj_cd);            
	            service2.proStuList2(req, model);
	         }         

		}
		System.out.println("ARA university-아라대 교수페이지");
		return "student/st_main_pro";
	}


	// 관리자 메인 페이지
	@RequestMapping("st_adm")
	public String st_adm(HttpServletRequest req, Model model) {
		if (req.getParameter("st_state") != null)
			st_state = Integer.parseInt(req.getParameter("st_state"));
		req.getSession().setAttribute("st_state", st_state);

		if (req.getParameter("st_state") != null) {
			
			 // 전체 학생 조회
	         if (Integer.parseInt(req.getParameter("st_state")) == 1) {
	            service.stuList(req, model);
	         }         

	         // 전체 성적 조회
	         if (Integer.parseInt(req.getParameter("st_state")) == 2) {
	            service.adminGpaList(req, model);
	         }
			
			// 입학신청서조회
			if (Integer.parseInt(req.getParameter("st_state")) == 5) {
				service.applyList(req, model);
			}
			// 합격자목록
			if (Integer.parseInt(req.getParameter("st_state")) == 6) {
				service.applyPassList(req, model);
			}
			// 추가합격자 승인목록
			if (Integer.parseInt(req.getParameter("st_state")) == 7) {
				service.applyExtraList(req, model);
			}
			// 강의목록,검색
			if (Integer.parseInt(req.getParameter("st_state")) == 8) {
				service.lectureList(req, model);
			}
			// 강의 추가
			if (Integer.parseInt(req.getParameter("st_state")) == 9) {
			}
			// 강의 추가
			if (Integer.parseInt(req.getParameter("st_state")) == 100) {
				int lec_no = Integer.parseInt(req.getParameter("lec_no"));
				req.setAttribute("lec_no", lec_no);
				service.lectureModi(req, model);
			}
			// 강의 추가
			if (Integer.parseInt(req.getParameter("st_state")) == 101) {
			}
		}
		System.out.println("ARA university-아라대 관리자페이지");
		return "student/st_main_adm";
	}

	// 입학 희망자 승인버튼
	@RequestMapping("applicationPro")
	public String applicationPro(HttpServletRequest req, Model model) {
		System.out.println("신청자 승인하기");
		service.recognize(req, model);
		int major = Integer.parseInt(req.getParameter("major"));
		req.setAttribute("major", major);
		return "student/st_admin/2_st_ad_applicationPro";
	}

	// 담당 교수 검색하기
	@RequestMapping("searchProf")
	public String searchProf(HttpServletRequest req, Model model) {
		logger.info("searchProf()");
		service.searchProf(req, model);
		return "student/st_admin/3_st_ad_searchProf";
	}

 

	// 강의 추가-등록버튼
	@RequestMapping("lecturePro")
	public String lecturePro(HttpServletRequest req, Model model) {
		logger.info("lecturePro()");
		service.lecturePlus(req, model);
		return "student/st_admin/3_st_ad_lecturePro";
	}

	// 강의 수정 버튼
	@RequestMapping("modiPro")
	public String modiPro(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		req.setAttribute("lec_no", lec_no);
		logger.info("modiPro()");
		service.lectureModiPro(req, model);
		return "student/st_admin/3_st_ad_modiPro";
	}

	// 삭제 처리 페이지
	@RequestMapping("deletePro")
	public String deleteLePro(HttpServletRequest req, Model model) {
		logger.info("deletePro()");
		service.deletePro(req, model);
		return "student/st_admin/3_st_ad_deletePro";
	}

	// 수강신청 계획 추가
	@RequestMapping("regLecCartPlus")
	public String cartPlus(HttpServletRequest req, Model model) {
		logger.info("regLecCartPlus()");
		int cnt = service.cartChk(req, model);
		if (cnt == 0) {
			service.cartPlus(req, model);
			service.cartUpdate(req, model);
		}
		service.cartList(req, model);
		model.addAttribute("cnt", cnt);
		return "student/st_stu/5_st_regLecCartPlus";
	}

	// 수강신청 계획 삭제
	@RequestMapping("regLecCartDel")
	public String cartDel(HttpServletRequest req, Model model) {
		logger.info("regLecCartDel()");
		service.cartDel(req, model);
		service.cartUpdate(req, model);
		service.cartList(req, model);
		return "student/st_stu/5_st_regLecCartDel";
	}

	// 수강신청
	@RequestMapping("regLecPlus")
	public String regPlus(HttpServletRequest req, Model model) {
		logger.info("regLecPlus()");
		int cnt = service.regChk(req, model);
		int personChk = service.personChk(req, model);
		if (cnt == 0 && personChk == 0) {
			service.regPlus(req, model);
			service.regUpdate(req, model);
		}
		int chk = service.regTimeTable(req, model);
		if (cnt == 0 && chk != 0) {
			service.regDel(req, model);
			service.regUpdate(req, model);
		}
		service.regList(req, model);
		model.addAttribute("personChk", personChk);
		model.addAttribute("chk", chk);
		model.addAttribute("cnt", cnt);
		return "student/st_stu/5_st_regLecPlus";
	}

	// 수강신청 계획 삭제
	@RequestMapping("regLecDel")
	public String regDel(HttpServletRequest req, Model model) {
		logger.info("regLecDel()");
		service.regDel(req, model);
		service.regUpdate(req, model);
		service.regList(req, model);
		return "student/st_stu/5_st_regLecDel";
	}

	// 수강신청 계획 시간표 보기
	@RequestMapping("cartTimeTable")
	public String cartTimeTable(HttpServletRequest req, Model model) {
		logger.info("cartTimeTable()");
		service.cartTimeTable(req, model);
		return "student/st_stu/5_st_timetable";
	}

	// 수강신청 시간표 보기
	@RequestMapping("regTimeTable")
	public String regTimeTable(HttpServletRequest req, Model model) {
		logger.info("regTimeTable()");
		service.regTimeTable(req, model);
		return "student/st_stu/5_st_timetable";
	}
	// 수강신청 시간표 보기
	@RequestMapping("regStart")
	public String regStart(HttpServletRequest req, Model model) {
		logger.info("regStart()");
		service.regStart(req, model);
		return "student/st_main_adm";
	}
	// 수강신청 시간표 보기
	@RequestMapping("regEnd")
	public String regEnd(HttpServletRequest req, Model model) {
		logger.info("regEnd()");
		service.regEnd(req, model);
		return "student/st_main_adm";
	}
	
	// 합격자 학번제공
	@RequestMapping("provideSt_no")
	public String provideSt_no(HttpServletRequest req, Model model) {
		logger.info("provideSt_no()");
		service.provideSt_no(req, model);
		return "student/st_admin/2_st_ad_providePro";
	}
	
	
	
	
	
	//아름
	
	// 성적 Insert 처리 페이지
   @RequestMapping("inputGradePro")
   public String inputGradePro(HttpServletRequest req, Model model) {
      logger.info("inputGradePro()");
      String lec_name = req.getParameter("lec_name");
      String st_no =req.getParameter("st_no");
      req.setAttribute("st_no", st_no);
      req.setAttribute("lec_name", lec_name);
      model.addAttribute("st_no", st_no);
      service2.inputPro(req, model);
      service2.inputTotal(req, model);
      return "student/st_pro/53_pro_inputPro";
   }

   // 출결 Insert 처리 페이지
   @RequestMapping("inputAttend")
   public String inputAttend(HttpServletRequest req, Model model) {
      logger.info("inputAttend()");
      String lec_name = req.getParameter("lec_name");
      req.setAttribute("lec_name", lec_name);
      model.addAttribute("lec_name", lec_name);
      String st_name = req.getParameter("st_name");
      req.setAttribute("st_name", st_name);
      service2.inputPresent(req, model);
      return "student/st_pro/55_inputPresent";
   }

   // 학적 관리 > 기본 학적 - 정보수정 처리
   @RequestMapping("StModiPro")
   public String StModiPro(HttpServletRequest req, Model model) {
      logger.info("StModiPro()");
      service.st_profileModiPro(req, model);
      return "student/st_stu/4_st_modiPro";
   }
}
