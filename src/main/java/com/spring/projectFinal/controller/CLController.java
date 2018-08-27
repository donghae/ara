package com.spring.projectFinal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.projectFinal.service.CLService;

@Controller
public class CLController {
	@Autowired
	CLService service;
	
	//사이버강의 메인(공지사항)
	@RequestMapping("cy_main")
	public String cy_main(HttpServletRequest req, Model model) {
		
		System.out.println("cy_main");
		service.getNoticeList(req, model);
		return "cyber/cy_main";
	}
	
	//사이버강의 공지사항 상세
	@RequestMapping("cy_notice_form")
	public String cy_notice_form(HttpServletRequest req, Model model) {
		service.getNotice(req, model);
		
		return "cyber/cy_notice_form";
	}
	@RequestMapping("cy_notice_write_form")
	public String cy_notice_write_form(HttpServletRequest req, Model model) {
		return "cyber/cy_notice_write_form";
	}
	
	@RequestMapping("cy_notice_write_pro")
	public String cy_notice_write_pro(MultipartHttpServletRequest req, Model model) {		
		service.addNotice(req, model);
		
		return "cyber/cy_notice_write_pro";
	}
	@RequestMapping("cy_notice_update_form")
	public String cy_notice_write_pro(HttpServletRequest req, Model model) {		
		service.updateNotice(req, model);
		
		return "cyber/cy_notice_update_pro";
	}
	@RequestMapping("cy_notice_delete_form")
	public String cy_notice_delete_form(HttpServletRequest req, Model model) {		
		service.deleteNotice(req, model);
		
		return "cyber/cy_notice_delete_pro";
	}
	
	@RequestMapping("cy_comm")
	public String cy_comm(HttpServletRequest req, Model model) {
		
		return "cyber/cy_comm";
	}
	@RequestMapping("cy_add")
	public String cy_add(HttpServletRequest req, Model model) {
		
		return "cyber/cy_add";
	}
	@RequestMapping("cy_form")
	public String cy_form(HttpServletRequest req, Model model) {
		model.addAttribute("file_name", req.getParameter("file_name"));
		model.addAttribute("round_no", req.getParameter("round_no"));
		model.addAttribute("lec_no", req.getParameter("lec_no"));
		return "cyber/cy_form";
	}
	
	@RequestMapping("cy_list")
	public String cy_list(HttpServletRequest req, Model model) {
		
		return "cyber/cy_list";
	}
	
	@RequestMapping("cy_upload")
	public String cy_upload(MultipartHttpServletRequest req, Model model) {
		service.addRound(req, model);
		return "cyber/cy_upload";
	}
	@RequestMapping("cy_download")
	public void cy_download(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		service.downloadFile(req, res);
	}
	
	
	
	@RequestMapping("cy_lec_list")
	public String cy_lec_list(HttpServletRequest req, Model model) {
		service.getLecList(req, model);
		
		return "cyber/cy_lec_list";
	}
	
	
	
	
	@RequestMapping("cy_select_lec_list")
	public String cy_select_lec_list(HttpServletRequest req, Model model) {
		service.getRoundList(req, model);
		return "cyber/cy_select_lec_list";
	}
	@RequestMapping("cy_select_lec_add")
	public String cy_select_lec_add(HttpServletRequest req, Model model) {
		model.addAttribute("lec_no", Integer.parseInt(req.getParameter("lec_no")));
		return "cyber/cy_select_lec_add";
	}
	@RequestMapping("cy_lec_main")
	public String cy_lec_main(HttpServletRequest req, Model model) {
		service.getLecNoticeList(req, model);
		
		return "cyber/cy_lec_main";
	}
	@RequestMapping("cy_lec_notice_form")
	public String cy_lec_notice_form(HttpServletRequest req, Model model) {
		service.getLecNotice(req, model);
		
		return "cyber/cy_lec_notice_form";
	}
	@RequestMapping("cy_lec_notice_update_form")
	public String cy_lec_notice_write_pro(HttpServletRequest req, Model model) {		
		service.updateLecNotice(req, model);
		model.addAttribute("lec_no", Integer.parseInt(req.getParameter("lec_no")));
		
		return "cyber/cy_notice_update_pro";
	}
	@RequestMapping("cy_lec_notice_delete_form")
	public String cy_lec_notice_delete_form(HttpServletRequest req, Model model) {		
		service.deleteLecNotice(req, model);
		model.addAttribute("lec_no", Integer.parseInt(req.getParameter("lec_no")));
		
		return "cyber/cy_notice_delete_pro";
	}
	@RequestMapping("cy_lec_notice_write_form")
	public String cy_lec_notice_write_form(HttpServletRequest req, Model model) {		
		model.addAttribute("lec_no", Integer.parseInt(req.getParameter("lec_no")));
		return "cyber/cy_lec_notice_write_form";
	}
	
	@RequestMapping("cy_lec_notice_write_pro")
	public String cy_lec_notice_write_pro(MultipartHttpServletRequest req, Model model) {		
		service.addLecNotice(req, model);
		model.addAttribute("lec_no",req.getParameter("lec_no"));
		return "cyber/cy_lec_notice_write_pro";
	}
	
	@RequestMapping("cy_attendance")
	public String cy_attendance(HttpServletRequest req, Model model) {		
		
		service.updateCyAttendance(req, model);
		
		return "cyber/cy_attendancePro";
	}
}
