package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SM2Service {

	//희현
	public void inputTotal(HttpServletRequest req, Model model);
	
	
	
	
	//아름
	
	

   // 교수 - 시간표
   public void proLecList(HttpServletRequest req, Model model);

   // (교수) 수업관리 > 내 강의실 > 해당하는 강의를 듣는 학생 목록
   public void proStuList(HttpServletRequest req, Model model);

   // (교수) 수업관리 > 내 강의실 > 해당하는 강의를 듣는 학생 목록
   public void proStuList2(HttpServletRequest req, Model model);
   
   // 성적 insert
   public void inputPro(HttpServletRequest req, Model model);

   // 출결 insert, update
   public void attendList(HttpServletRequest req, Model model);   
   
   // (교수) 수업관리 > 내 강의실 > 출결 입력
   public void inputPresent(HttpServletRequest req, Model model);

}