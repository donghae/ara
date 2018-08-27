package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface CIService {
	//학과 리스트 가져오기
	public void getMajorList(HttpServletRequest req, Model model);
	
	//학과 정보 하나 가져오기
	public void getMajor(HttpServletRequest req, Model model);
	
	//학과 정보 수정
	public void modifyMajor(HttpServletRequest req, Model model);
	
	//학과 추가
	public void addMajor(HttpServletRequest req, Model model);
	
	//학과 삭제
	public void deleteMajor(HttpServletRequest req, Model model);
}
