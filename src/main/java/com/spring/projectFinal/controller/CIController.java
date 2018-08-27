package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.projectFinal.service.CIService;


@Controller
public class CIController {

	//캠퍼스 컨트롤러
	@Autowired
	CIService service;
	
	//스쿨버스 정보
	@RequestMapping("bus_list")
	public String bus_list(HttpServletRequest req,Model model) {
		
		System.out.println("bus_list-스쿨버스 목록");
		return "campus/bus_list";
	}
	
	//동아리 목록
	@RequestMapping("circle_list")
	public String circle_list(HttpServletRequest req,Model model) {
		
		System.out.println("circle_list-동아리 목록");
		return "campus/circle_list";
	}
	
	//학식 식단표 
	@RequestMapping("st_dietary_chart")
	public String st_dietary_chart(HttpServletRequest req,Model model) {
		
		System.out.println("st_dietary_chart-학식 식단표");
		return "campus/st_dietary_chart";
	}
	
	//학과 리스트 
	@RequestMapping("major_list")
	public String major_list(HttpServletRequest req,Model model) {
		
		service.getMajorList(req, model);
		System.out.println("major_list-학과 리스트");
		return "campus/major_list";
	}
	
	//학과 하나 
	@RequestMapping("major")
	public String major(HttpServletRequest req,Model model) {
		
		service.getMajor(req, model);
		System.out.println("major_form-학과 한개");
		return "campus/major_form";
	}
	
	//학과 수정 
	@RequestMapping("modify_major")
	public ModelAndView modify_major(HttpServletRequest req,Model model) {
		service.modifyMajor(req, model);
		System.out.println("modify_major-학과 수정");
		return new ModelAndView("redirect:/major_list");
	}
	//학과 추가 
	@RequestMapping("add_major")
	public ModelAndView add_major(HttpServletRequest req,Model model) {
		service.addMajor(req, model);
		System.out.println("add_major-학과 추가 ");
		return new ModelAndView("redirect:/major_list");
	}
	//학과 추가 
	@RequestMapping("delete_major")
	public ModelAndView delete_major(HttpServletRequest req,Model model) {
		service.deleteMajor(req, model);
		System.out.println("delete_major-학과 추가 ");
		return new ModelAndView("redirect:/major_list");
	}
	//아라 소개
	@RequestMapping("igoara")
	public String igoara(HttpServletRequest req,Model model) {
		
		System.out.println("ara_summary-아라소개 ");
		return "campus/ara_summary";
	}
}
