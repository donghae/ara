package com.spring.projectFinal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.projectFinal.controller.SMController;
import com.spring.projectFinal.service.ARAService;
import com.spring.projectFinal.service.SMService;

@Controller
public class AraController {

	@Autowired
	SMService service;	
	
	@Autowired
	ARAService araService;
	
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(SMController.class);

	@RequestMapping("ara")
	public String ara(HttpServletRequest req, Model model) {
		System.out.println("arauniversity-아라대 홈");
		return "common/ara_main";
	}

	@RequestMapping("admission")
	public String admission(HttpServletRequest req, Model model) {
		System.out.println("admission-원서접수");
		return "common/admission";
	}

	// 입학신청서 폼
	@RequestMapping("application")
	public String application(HttpServletRequest req, Model model) {
		System.out.println("application-입학지원서");
		return "common/application";
	}

	// 신청확인
	@RequestMapping(value = "appPro", method = RequestMethod.POST)
	public String appPro(MultipartHttpServletRequest req, Model model) {
		int chkCnt = service.juminChk(req, model);
		if (chkCnt == 0) {
			service.appPro(req, model);
		}
		return "common/applicationPro";
	}

	// 합격자조회 페이지
	@RequestMapping("chk")
	public String chk(HttpServletRequest req, Model model) {
		logger.info("chk()");
		return "student/st_stu/2_st_applicantsCheck";
	}

	// 합격자 조회 버튼 - 이름, 주민등록번호 확인
	@RequestMapping("confirmJumin")
	public String confirmJumin(HttpServletRequest req, Model model) {
		logger.info("confirmJumin()");
		service.passChkPro(req, model);	
		return "student/st_stu/2_st_applicantsCheckPro";
	}

	// 합격자조회후 페이지
	@RequestMapping("chk2")
	public String chk2(HttpServletRequest req, Model model) {
		logger.info("chk2()");
		String name = req.getParameter("name");
		int major = Integer.parseInt(req.getParameter("major"));
		String regi_no=req.getParameter("regi_no");
		req.setAttribute("regi_no", regi_no);
		service.st_no(req, model);	
		model.addAttribute("name",name);
		model.addAttribute("major",major);
		return "student/st_stu/2_st_applicantsResult";
	}
	
	// 로그인
	@RequestMapping("loginPage")
	public String loginPage(HttpServletRequest req, Model model) {
		logger.info("loginPage()");
		/*service.st_profile(req, model);*/
		return "common/login";
	}
	// 로그인
	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		logger.info("login()");
		araService.login(req, model);
		return "common/loginPro";
	}
	// 로그아웃
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest req, Model model) {
		logger.info("logout()");
		req.getSession().invalidate();
		return new ModelAndView("redirect:/ara");
	}
		
	// 아이디찾기
	@RequestMapping("findId")
	public String findId(HttpServletRequest req, Model model) {
		logger.info("findId()");
		/*service.st_profile(req, model);*/
		return "common/findId";
	}
	
	// 아이디찾기
	@RequestMapping("findIdPro")
	public String findIdPro(HttpServletRequest req, Model model) {
		logger.info("findIdPro()");
		araService.findIdPwd(req, model);
		return "common/findIdPro";
	}
	
	// 아이디찾기
	@RequestMapping("findPwd")
	public String findPwd(HttpServletRequest req, Model model) {
		logger.info("findPwd()");
		model.addAttribute("id", req.getParameter("id"));
		/*service.st_profile(req, model);*/
		return "common/findPwd";
	}
	
	// 아이디찾기
	@RequestMapping("findPwdPro")
	public String findPwdPro(HttpServletRequest req, Model model) {
		logger.info("findPwdPro()");
		araService.findIdPwd(req, model);
		return "common/findPwdPro";
	}
}
