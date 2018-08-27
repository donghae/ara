package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DTService {

	// 학생 로그인
	
	 // 학생 외박 조회
	 public void dtStuOVERNightSelect(HttpServletRequest req, Model model);
	
	 // 학생 외박 신청
	 public void dtStuNightInsert(HttpServletRequest req, Model model);
	 
	 // 학생 외박 수정 목록 뿌리기
	 public void dtStuNightupd(HttpServletRequest req, Model model);
	
	 // 학생 외박 등록
	 public void dtStuNightrevision(HttpServletRequest req, Model model);
	
	// 학생 외박 삭제 목록
	 public void dtStuNightDeletePwd(HttpServletRequest req, Model model);
	
	// 학생 외박 삭제 처리
	 public void dtStuNightDeletelist(HttpServletRequest req, Model model);
	 
	// 학생 벌점 조회
	 public void dtStuPenalty(HttpServletRequest req, Model model);
	 
	 // 학생 공지사항 조회
	 public void dtStuNotice(HttpServletRequest req, Model model);
	 
	 // 학생 공지사항 상세 조회
	 public void dtStuNoticeSelect(HttpServletRequest req, Model model);
	 
	 // 학생 기숙사 정보 조회
	 public void dtStuSelect(HttpServletRequest req, Model model);
	 
	 
	 
	 
	 // ara 동아리 목록 뿌리기..
	 public void circleSelect(HttpServletRequest req, Model model);
	 
	 // ara 동아리 수정 목록 클릭
	 public void araCircleBefore(HttpServletRequest req, Model model);
	 
	 // ara 동아리 수정 등록
	 public void araCircleAfter(HttpServletRequest req, Model model);
	 
	 // ara 동아리 목록 삭제
	 public void araCircleDelete(HttpServletRequest req, Model model);
	 
	 
	 
	 
	 // 관리자 로그인
	 public void dormitory_login(HttpServletRequest req, Model model);
	 
	// 관리자 로그인 
	public void dtAdminLogin(HttpServletRequest req, Model model);
	
	// 관리자 기숙사 학생 조회
	public void getDormStInfoLiDormSt(HttpServletRequest req, Model model);
	
	//관리자 기숙사 학생 등록 클릭
	public void addDormStInfo(HttpServletRequest req, Model model);
	
	// 관리자 기숙사 학생 수정
	public void dtAdminStuUpdate(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 조회
	public void getDormNoticeList(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 제목 클릭
	public void getDormNoticeDetail(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 수정
	public void updateDormNotice(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 수정 등록
	public void updateDormNoticeCon(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 글 등록
	public void addDormNotice(HttpServletRequest req, Model model);
	
	// 관리자 벌점 조회
	public void dtAdminPenaltySel(HttpServletRequest req, Model model);
	
	// 관리자 벌점 부여
	public void addPenaltyInsert(HttpServletRequest req, Model model);
		
	// 관리자 벌점 수정 클릭
	public void dtAdminPenaltyUp(HttpServletRequest req, Model model);
	
	// 관리자 벌점 수정 목록
	public void selectPenalty(HttpServletRequest req, Model model);
	
	// 관리자 벌점 수정 이름 클릭
	public void updatePenalty(HttpServletRequest req, Model model);
	
	// 관리자 외박 신청 목록
	public void dtAdminOvernight(HttpServletRequest req, Model model);
	
	// 관리자 외박 신청 승인
	public void dtAdminOvernightIns(HttpServletRequest req, Model model);
	
	// 관리자 외박 신청 승인 조회
	public void dtAdminOvernightSel(HttpServletRequest req, Model model);
	
}
