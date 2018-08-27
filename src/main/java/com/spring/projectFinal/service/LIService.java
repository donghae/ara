package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LIService {

	//도서 추가 --
	public void lib_bookAddPro(MultipartHttpServletRequest req, Model model);

	//도서 전체 리스트 --
	public void getBooklist(HttpServletRequest req,Model model);
	
	//도서 한 권 조회 
	public void getBookInfo(HttpServletRequest req,Model model);
	
	//도서 수정 처리 --
	public void lib_bookModiPro(MultipartHttpServletRequest req, Model model);
	
	//도서 삭제 처리--
	public void lib_bookDelPro(HttpServletRequest req,Model model);
	
	

	//도서 검색 --
	public void lib_bookSearchResult(HttpServletRequest req,Model model);
	
	//도서 검색-예제
	public void searchtest(HttpServletRequest req,Model model);


	
	
	//관리자 : 도서 대여 기록 조회
	public void lib_loanSuperlist(HttpServletRequest req,Model model);
	
	//도서 대여 처리
	public void lib_loanPro(HttpServletRequest req,Model model);
	
	//도서 반납 처리
	public void lib_returnPro(HttpServletRequest req,Model model);
	
	//도서 연장 처리
	public void lib_renewPro(HttpServletRequest req,Model model);
	
	
	
	
	
	
	//좌석 보기
	public void lib_viewSeat(HttpServletRequest req,Model model);
	
	//좌석 이용 등록
	public void lib_seat_use(HttpServletRequest req,Model model);
	
	//좌석 이용 정보 보기
	public void lib_seat_user(HttpServletRequest req,Model model);
	
	//좌석 이용 중지
	public void lib_seat_stopPro(HttpServletRequest req,Model model);
	
	//마이 라이브러리
	public void lib_myLibrary(HttpServletRequest req,Model model);
	
	
	
	
	//도서 현황(도서 안내페이지)
	public void lib_situation(HttpServletRequest req,Model model);
	
}
