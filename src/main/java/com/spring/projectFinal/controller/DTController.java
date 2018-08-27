package com.spring.projectFinal.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;
import com.spring.projectFinal.persistence.ARADAO;
import com.spring.projectFinal.persistence.DTDAO;
import com.spring.projectFinal.service.DTServiceImpl;

@Controller
public class DTController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	DTServiceImpl service;

	@Autowired
	ARADAO dao;

	// 학생 기숙사 컨트롤러

	// 학생 기숙사 홈
	@RequestMapping("dormitory")
	public String dormitory(HttpServletRequest req, Model model) {

		System.out.println("dormitory-기숙사 홈");

		return "dormitory/dormitory_home";
	}

	// 학생 기숙사 조회
	@RequestMapping("dormitory_reference")
	public String dormitory_reference(HttpServletRequest req, Model model) {
		System.out.println("dormitory_reference-기숙사 조회");
		
		service.dtStuSelect(req, model);
		
		return "dormitory/dormitory_stu/dt_stu_reference";
	}

	// 학생 외박 신청 페이지
	@RequestMapping("dormitory_stu_overnight_insert")
	public String dormitory_stu_overnight_insert(HttpServletRequest req, Model model) {
		System.out.println("dormitory_stu_overnight_insert-외박 신청 페이지");

		return "dormitory/dormitory_stu/dt_stu_overnight_insert";
	}

	// 학생 외박 신청 등록
	@RequestMapping("dt_stu_overnight_insert")
	public String dt_stu_overnight_insert(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_overnight_insert-외박 신청 ");

		service.dtStuNightInsert(req, model);

		return "dormitory/dormitory_stu/dt_stu_overnight_insert_confim";
	}

	// 학생 외박 신청 결과 조회
	@RequestMapping("dormitoty_stu_overnight_select")
	public String dormitoty_stu_overnight_select(HttpServletRequest req, Model model) {
		System.out.println("dormitoty_stu_overnight_select-외박 신청 결과 조회 ");	
		
		service.dtStuOVERNightSelect(req, model);

		return "dormitory/dormitory_stu/dt_stu_overnight_select";
	}	

	// 학생 외박 수정 목록 뿌리기
	@RequestMapping("dt_stu_overnight_update")
	public String dt_stu_overnight_upd_pwd(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_overnight_upd_pwd-외박 수정 목록 뿌리기 ");

		service.dtStuNightupd(req, model);

		return "dormitory/dormitory_stu/dt_stu_overnight_update";
	}

	// 학생 외박 수정 update
	@RequestMapping("dt_stu_overnight_revision")
	public String dt_stu_overnight_revision(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_overnight_revision-외박 수정 업데이트 ");

		service.dtStuNightrevision(req, model);

		return "dormitory/dormitory_stu/dt_stu_overnight_update_check";
	}

	// 학생 외박 신청 삭제
	@RequestMapping("dt_stu_overnight_del_list")
	public String dt_stu_overnight_del_list(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_overnight_del_list-학생 외박 삭제 ");
		
		service.dtStuNightDeletelist(req, model);

		return "dormitory/dormitory_stu/dt_stu_overnight_delete_confirm";
	}

	// 학생 벌점 폼 페이지
	@RequestMapping("dormitory_stu_penalty")
	public String dt_stu_penalty_select(HttpServletRequest req, Model model) {
		System.out.println("dormitory_stu_penalty-학생 벌점 조회");

		return "dormitory/dormitory_stu/dt_stu_penalty";
	}

	// 학생 벌점 조회
	@RequestMapping("dt_stu_penalty_sel")
	public String dt_stu_penalty_sel(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_penalty_sel-학생 벌점 조회");
	
		service.dtStuPenalty(req, model);

		return "dormitory/dormitory_stu/dt_stu_penalty_sel";
	}

	// 학생 공지사항 조회
	@RequestMapping("dt_stu_notice_sel")
	public String dt_stu_notice_sel(HttpServletRequest req, Model model) {
		System.out.println("dt_stu_notice_sel-학생 공지사항 조회");

		service.dtStuNotice(req, model);

		return "dormitory/dormitory_stu/dt_stu_notice_sel";
	}

	// 학생 공지사항 상세 조회
	  @RequestMapping("dt_stu_notice_select")
	  public String dt_stu_notice_select(HttpServletRequest req,Model model) {
	  System.out.println("dt_stu_notice_select-학생 공지사항 조회");
	  
	  service.dtStuNoticeSelect(req,model);
	  
	  return "dormitory/dormitory_stu/dt_stu_notice_select"; 
	  }
	

	
	// 관리자 로그인 성공 여부
	@RequestMapping("dormitory_admin_login")
	public String dormitory_admin_login(HttpServletRequest req, Model model) {
		System.out.println("dormitory_admin_login-관리자 로그인 성공여부");

		service.dtAdminLogin(req, model);

		return "dormitory/dormitory_admin/dt_admin_login_confirm";
	}

	// 관리자 기숙사 학생관리
	@RequestMapping("dormitory_admin_stu")
	public String dormitory_admin_stu(HttpServletRequest req, Model model) {

		System.out.println("dormitory_admin_stu-관리자 기숙사 학생 관리");

		return "dormitory/dormitory_admin/dt_admin_stu_ins";
	}

	// 관리자 학생 등록 폼
	@RequestMapping("dormitoty_stu_insert")
	public String dt_stu_ins(HttpServletRequest req, Model model) {
		System.out.println("dormitoty_stu_insert-관리자 학생 등록 폼");

		return "dormitory/dormitory_admin/dt_admin_stu_insert";
	}

	// 관리자 학생 등록 클릭
	@RequestMapping("admin_stu_insert")
	public String admin_stu_insert(HttpServletRequest req, Model model) {
		System.out.println("admin_stu_insert-관리자 학생 등록 클릭");

		service.addDormStInfo(req, model);

		return "dormitory/dormitory_admin/dt_admin_stu_insert_confirm";
	}

	// 관리자 학생 수정
	@RequestMapping("dormitoty_stu_update")
	public String dormitoty_stu_update(HttpServletRequest req, Model model) {
		log.info("dormitoty_stu_update-관리자 학생 수정");

		String st_no = req.getParameter("st_no");
		int dorm_room = Integer.parseInt(req.getParameter("dorm_room"));
		String st_name = req.getParameter("st_name");
		String dorm_st = req.getParameter("dorm_st_dt");
		String dorm_end = req.getParameter("dorm_end_dt");
		java.sql.Date dorm_st_dt = java.sql.Date.valueOf(dorm_st);
		java.sql.Date dorm_end_dt = java.sql.Date.valueOf(dorm_end);
		
		model.addAttribute("st_no",st_no);
		model.addAttribute("dorm_room",dorm_room);
		model.addAttribute("st_name",st_name);
		model.addAttribute("dorm_st_dt",dorm_st_dt);
		model.addAttribute("dorm_end_dt",dorm_end_dt);
	
		return "dormitory/dormitory_admin/dt_admin_stu_update";
	}

	// 관리자 학생 수정
	@RequestMapping("dt_admin_stu_update")
	public String dt_admin_stu_insert(HttpServletRequest req, Model model) {
		log.info("dt_admin_stu_insert-관리자 학생 수정 등록");

		service.dtAdminStuUpdate(req, model);

		return "dormitory/dormitory_admin/dt_admin_stu_update_confirm";
	}

	// 관리자 학생 조회
	@RequestMapping("dormitoty_stu_select")
	public String dormitoty_stu_select(HttpServletRequest req, Model model) {
		log.info("dormitoty_stu_update-관리자 학생 조회");

		service.getDormStInfoLiDormSt(req, model);

		return "dormitory/dormitory_admin/dt_admin_stu_select";
	}

	// 관리자 학생 삭제
	@RequestMapping("dormitoty_stu_delete")
	public String dormitoty_stu_delete(HttpServletRequest req, Model model) {
		log.info("dormitoty_stu_delete-관리자 학생 삭제");

		return "dormitory/dormitory_admin/dt_admin_stu_delete";
	}

	// 관리자 공지사항 폼 페이지
	@RequestMapping("dormitory_admin_notice")
	public String dormitoty_notice(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice-관리자 공지사항 폼");

		return "dormitory/dormitory_admin/dt_admin_notice";
	}

	// 관리자 공지사항 조회 클릭
	@RequestMapping("dt_admin_notice_sel")
	public String dt_admin_notice_sel(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_sel-관리자 공지사항 조회");

		service.getDormNoticeList(req, model);

		return "dormitory/dormitory_admin/dt_admin_notice_sel";
	}

	// 관리자 공지사항 제목 클릭
	@RequestMapping("dt_admin_notice_board")
	public String dt_admin_notice_board(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_board-관리자 공지사항 제목 클릭");

		service.getDormNoticeDetail(req, model);

		return "dormitory/dormitory_admin/dt_admin_notice_board";
	}

	// 관리자 공지사항 수정
	@RequestMapping("dt_admin_notice_modify")
	public String dt_admin_notice_modify(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_modify-관리자 공지사항 수정");

		service.updateDormNotice(req, model);

		return "dormitory/dormitory_admin/dt_admin_notice_modify";
	}

	// 관리자 공지사항 제목 클릭 후 수정 사항 등록
	@RequestMapping("dt_admin_notice_modify_con")
	public String dt_admin_notice_modify_con(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_modify_con-관리자 공지사항 수정 사항 등록");

		service.updateDormNoticeCon(req, model);

		return "dormitory/dormitory_admin/dt_admin_notice_modify_confirm";
	}

	// 관리자 공지사항 글 쓰기 폼 페이지
	@RequestMapping("dt_admin_notice_write")
	public String dt_admin_notice_write(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_write-관리자 공지사항 글 쓰기 폼 페이지");

		return "dormitory/dormitory_admin/dt_admin_notice_write";
	}

	// 관리자 공지사항 글 쓰기 폼 페이지
	@RequestMapping("dt_admin_notice_write_ins")
	public String dt_admin_notice_write_ins(HttpServletRequest req, Model model) {
		log.info("dt_admin_notice_write_ins-관리자 공지사항 글 등록");

		service.addDormNotice(req, model);

		return "dormitory/dormitory_admin/dt_admin_notice_write_confirm";
	}

	// 관리자 벌점 페이지
	@RequestMapping("dormitory_admin_penalty")
	public String dormitory_admin_penalty(HttpServletRequest req, Model model) {
		log.info("dormitory_admin_penalty-관리자 벌점  페이지");
		service.dtAdminPenaltySel(req, model);

		return "dormitory/dormitory_admin/dt_admin_penalty";
	}

	// 관리자 벌점 조회
	@RequestMapping("dt_admin_penalty_sel")
	public String dt_admin_penalty_sel(HttpServletRequest req, Model model) {
		log.info("dt_admin_penalty_sel-관리자 벌점  조회");
		return "dormitory/dormitory_admin/dt_admin_penalty_sel";
	}

	// 관리자 벌점 등록 페이지
	@RequestMapping("dt_admin_penalty_ins")
	public String dt_admin_penalty_ins(HttpServletRequest req, Model model) {
		log.info("dt_admin_penalty_ins-관리자 벌점  등록 페이지");

		return "dormitory/dormitory_admin/dt_admin_penalty_ins";
	}

	// 관리자 벌점 등록
	@RequestMapping("dt_admin_penalty_admin")
	public String dt_admin_penalty_admin(HttpServletRequest req, Model model) {
		log.info("dt_admin_penalty_admin-관리자 벌점  등록");

		service.addPenaltyInsert(req, model);

		return "dormitory/dormitory_admin/dt_admin_penalty_admin";
	}

	// 관리자 벌점 수정 목록
	@RequestMapping("dt_admin_penalty_upd")
	public String dt_admin_penalty_upd(HttpServletRequest req, Model model) {
		log.info("dt_admin_penalty_upd-관리자 벌점  목록 이름 클릭");

		service.dtAdminPenaltyUp(req, model);

		return "dormitory/dormitory_admin/dt_admin_penalty_list";
	}

	// 관리자 벌점 수정 목록 이름 클릭
	@RequestMapping("admin_penalty_upd")
	public String admin_penalty_upd(HttpServletRequest req, Model model) {
		log.info("admin_penalty_upd-관리자 벌점  목록 이름 클릭");

		service.updatePenalty(req, model);

		return "dormitory/dormitory_admin/dt_admin_penalty_update";
	}

	// 관리자 외박 신청 목록
	@RequestMapping("dt_admin_overnight")
	public String dt_admin_overnight(HttpServletRequest req, Model model) {
		log.info("dt_admin_overnight-관리자 외박 신청 목록");

		service.dtAdminOvernight(req, model);

		return "dormitory/dormitory_admin/dt_admin_overnight";
	}
		
	// 관리자 외박 승인
	@RequestMapping("dt_admin_overnight_ins")
	public String dt_admin_overnight_ins(HttpServletRequest req, Model model) {
		log.info("dt_admin_overnight_ins-관리자 외박 승인");

		service.dtAdminOvernightIns(req, model);
		
		return "dormitory/dormitory_admin/dt_admin_overnight_confirm";
	}	
	
	// 관리자 외박 승인 조회	
	@RequestMapping("dt_admin_overnight_sel")
	public String dt_admin_overnight_sel(HttpServletRequest req, Model model) {
		log.info("dt_admin_overnight_sel-관리자 외박 승인 조회");

		service.dtAdminOvernightSel(req, model);
		
		return "dormitory/dormitory_admin/dt_admin_overnight_sel";
	}	
	

	
	// 동아리 학생, 식단표, 셔틀 버스 정보
	// 대학소개 클릭
	@RequestMapping("stu_infomation")
	public String stu_infomation(HttpServletRequest req, Model model) {
		log.info("stu_infomation-대학생활 클릭");

		service.circleSelect(req, model);

		return "dormitory/araInfomation/stu_infomation";
	}

	// 동아리 수정 클릭
	@RequestMapping("araCircleBefore")
	public String araCircleBefore(HttpServletRequest req, Model model) {
		log.info("araCircleBefore-동아리 수정 클릭");

		service.araCircleBefore(req, model);

		return "dormitory/araInfomation/admin_circleBefore";
	}

	// 동아리 수정 등록
	@RequestMapping("araCircleAfter")
	public String araCircleAfter(HttpServletRequest req, Model model) {
		log.info("araCircleAfter-동아리 수정 등록");

		service.araCircleAfter(req, model);

		return "dormitory/araInfomation/admin_araCircleAfter_confirm";
	}

	// 동아리 삭제
	@RequestMapping("araCircleDelete")
	public String araCircleDelete(HttpServletRequest req, Model model) {
		log.info("araCircleDelete-동아리 삭제");

		service.araCircleDelete(req, model);

		return "dormitory/araInfomation/admin_araCircleDelete";
	}

}
