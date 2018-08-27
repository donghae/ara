package com.spring.projectFinal.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.projectFinal.service.ARAServiceImpl;
import com.spring.projectFinal.service.LIServiceImpl;

@Controller//도서관 컨트롤러
public class LIController {

	@Autowired
	LIServiceImpl LIservice;
	
	@Autowired
	ARAServiceImpl ARAservice;

	
	//도서관 홈
	@RequestMapping("lib_home")
	public String lib_home(HttpServletRequest req,Model model) {
		
		System.out.println("lib_home-도서관 홈");
		return "library/lib_joint/lib_home";
	}
	
	
	//도서관 로그인창
	@RequestMapping("lib_loginForm")
	public String lib_loginForm(HttpServletRequest req,Model model) {
		
		System.out.println("lib_loginForm-도서관 로그인창");
		return "library/lib_joint/lib_loginForm";
	}
	
	
	//도서관 로그인 처리
	@RequestMapping("lib_loginPro")
	public String lib_loginPro(HttpServletRequest req,Model model) {
		
		System.out.println("lib_loginPro-도서관 로그인 처리");
		ARAservice.login(req, model);
		return "library/lib_joint/lib_login_sub";
	}

	
	//도서관 로그아웃 처리
	@RequestMapping("lib_logout")
	public ModelAndView lib_logoutPro(HttpServletRequest req,Model model) {
		
		System.out.println("lib_logoutPro-도서관 로그아웃 처리");
		req.getSession().invalidate();
		return new ModelAndView("redirect:/lib_home");
	}
	
	
	//관리자 : 도서 검색 
	@RequestMapping("lib_bookSearch_admin")
	public String lib_bookSearch_admin(HttpServletRequest req,Model model) {
		
		System.out.println("lib_bookSearch_admin-관리자 : 도서 검색 ");
		LIservice.getBooklist(req,model);
		return "library/lib_admin/lib_bookSearch_admin";
	}
	
	
	//관리자 : 도서 검색  결과 (ajax)
	@RequestMapping("lib_bookSearchResult_admin")
	public String lib_bookSearchResult_admin(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSearchResult_admin-관리자 : 도서검색결과");
		
		LIservice.lib_bookSearchResult(req, model);
		return "library/lib_admin/lib_bookSearchResult_admin";
	}
	
	
/*	//관리자 : 도서 관리 페이지
	@RequestMapping("lib_bookSupervise")
	public String lib_bookSupervise(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSupervise-관리자 : 도서 관리 페이지");
				
		return "library/lib_admin/lib_bookSupervise";
	}
	
	//관리자 : 도서 관리 조회 결과
	@RequestMapping("lib_bookSuperlist")
	public String lib_bookSuperlist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSuperlist-관리자 : 도서 관리 조회 결과");
				
		return "library/lib_admin/lib_bookSuperlist";
	}*/
	
	
	//관리자 : 도서 추가 양식
	@RequestMapping("lib_bookAddForm")
	public String lib_bookAddForm(HttpServletRequest req,Model model) {
		
		System.out.println("lib_bookAddForm-관리자 : 도서 추가 양식");
		return "library/lib_admin/lib_bookAddForm";
	}
	
	
	//관리자 : 도서 추가 처리
	@RequestMapping(value="lib_bookAddPro", method=RequestMethod.POST)
	public String lib_bookAddPro(MultipartHttpServletRequest req,Model model) {
		
		System.out.println("lib_bookAddPro-도서 추가");
		
		LIservice.lib_bookAddPro(req, model);
		return "library/lib_admin/lib_bookAddPro";
	}

	
	//관리자 : 도서 수정 양식
	@RequestMapping("lib_bookModiForm")
	public String lib_bookModiForm(HttpServletRequest req,Model model) {
		
		System.out.println("lib_bookModiForm-도서 수정 양식");
		
		LIservice.getBookInfo(req, model);
		return "library/lib_admin/lib_bookModiForm";
	}
	
	
	//관리자 : 도서 수정 처리
	@RequestMapping(value="lib_bookModiPro", method=RequestMethod.POST)
	public String lib_bookModiPro(MultipartHttpServletRequest req,Model model) {
		
		System.out.println("lib_bookModiPro-도서 수정");
		
		LIservice.lib_bookModiPro(req, model);
		return "library/lib_admin/lib_bookModiPro";
	}
	
	//관리자 : 도서 삭제 처리
	@RequestMapping("lib_bookDelPro")
	public String lib_bookDelPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookDelPro-도서 삭제");
		
		LIservice.lib_bookDelPro(req, model);
		return "library/lib_admin/lib_bookDelPro";
	}
	


	
	
	
	//관리자 : 도서 대여 관리 페이지 - ajax
	@RequestMapping("lib_loanSupervise")
	public String lib_loanSupervise(HttpServletRequest req, Model model) {
		
		System.out.println("lib_loanSupervise-관리자 : 도서 대여 관리 페이지");		
		return "library/lib_admin/lib_loanSupervise";
	}
	
	//관리자 : 도서 대여 기록 결과 페이지 - ajax 결과1
	@RequestMapping("lib_loanSuperlist")
	public String lib_loanSuperlist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_loanSuperlist-관리자 : 도서 대여 기록 조회");
		LIservice.lib_loanSuperlist(req,model);
		return "library/lib_admin/lib_loanSuperlist";
	}
	
	//관리자 : 도서 대여 양식 ajax 결과2
	@RequestMapping("lib_loanForm")
	public String lib_loanForm(HttpServletRequest req, Model model) {
		
		System.out.println("lib_loanForm-도서 대여 폼");
		return "library/lib_admin/lib_loanForm";
	}
	//관리자 : 도서 대여 처리
	@RequestMapping("lib_loanPro")
	public String lib_loanPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_loanPro-도서 대여");

		LIservice.lib_loanPro(req, model);
		return "library/lib_admin/lib_loanPro";
	}	
		
	
	//관리자 : 도서 반납 양식 ajax 결과2
	@RequestMapping("lib_returnForm")
	public String lib_returnForm(HttpServletRequest req, Model model) {
		
		System.out.println("lib_returnForm-도서 반납 폼");
		return "library/lib_admin/lib_returnForm";
	}
	//관리자 : 도서 반납 처리
	@RequestMapping("lib_returnPro")
	public String lib_returnPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_returnPro-도서 반납");

		LIservice.lib_returnPro(req, model);
		return "library/lib_admin/lib_returnPro";
	}
	
	
	//관리자 : 도서 연장 양식 ajax 결과2
	@RequestMapping("lib_renewForm")
	public String lib_renewForm(HttpServletRequest req, Model model) {
		
		System.out.println("lib_renewForm-도서 연장 폼");
		return "library/lib_admin/lib_renewForm";
	}
	//관리자 : 대여 연장 처리
	@RequestMapping("lib_renewPro")
	public String lib_renewPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_renewPro-대여 연장");

		LIservice.lib_renewPro(req, model);
		return "library/lib_admin/lib_renewPro";
	}
	
	
	//관리자 : 도서 좌석 현황
	@RequestMapping("lib_seat_admin")
	public String lib_seat_admin(HttpServletRequest req, Model model) {
		System.out.println("lib_seat_admin-관리자 : 도서 좌석 현황");			
		return "library/lib_admin/lib_seat_admin";
	}
	@RequestMapping("lib_seat_sub_admin")
	public String lib_seat_sub_admin(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_sub_admin-좌석 현황 및 예약");	
		LIservice.lib_viewSeat(req, model);
		
		return "library/lib_admin/lib_seat_sub_admin";
	}
	@RequestMapping("lib_seat_user")
	public String lib_seat_user(HttpServletRequest req, Model model) {
		System.out.println("lib_seat_user-관리자 : 유저 정보 조회");	
		
		LIservice.lib_seat_user(req,model);
		return "library/lib_admin/lib_seat_user";
	}
	//관리자 : 좌석이용 중지
	@RequestMapping("lib_seat_stopPro")
	public String lib_seat_stopPro(HttpServletRequest req, Model model) {
		System.out.println("lib_seat_stopPro-관리자 : 좌석이용 중지");	
		
		LIservice.lib_seat_stopPro(req,model);
		return "library/lib_admin/lib_seat_stopPro";
	}
	//관리자:좌석 이용 등록
	@RequestMapping("lib_seat_use_admin")
	public String lib_seat_use_admin(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_use_admin-관리자:좌석 이용등록");	
		LIservice.lib_seat_use(req,model);

		return "library/lib_admin/lib_seat_use_admin";
	}
		
	
	/*//도서 좌석 업데이트
	@RequestMapping("lib_seat_update")
	public String lib_seat_update(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_update-좌석 업데이트");	
		LIservice.lib_seat_update(req,model);
		LIservice.lib_viewSeat(req, model);
		return "library/lib_ara/lib_seat_sub";
	}*/
	
	
	
	//도서 신청 양식
	@RequestMapping("lib_submission")
	public String lib_submission(HttpServletRequest req, Model model) {
		
		System.out.println("lib_submission-도서 신청 양식");
		return "library/lib_joint/lib_submission";
	}
	
	
	
	//도서관 안내 페이지
	@RequestMapping("lib_summary")
	public String lib_summary(HttpServletRequest req, Model model) {
		
		System.out.println("lib_summary-도서관 안내");
		return "library/lib_joint/lib_summary";
	}
	
	//도서관 현황(소개)
	@RequestMapping("lib_situation")
	public String lib_situation(HttpServletRequest req, Model model) {
		
		System.out.println("lib_situation-도서관 현황(소개)");
		LIservice.lib_situation(req,model);
		return "library/lib_joint/lib_situation";
	}
	
	//도서관 위치
	@RequestMapping("lib_map")
	public String lib_map(HttpServletRequest req, Model model) {
		
		System.out.println("lib_situation-도서관 위치");
		return "library/lib_joint/lib_map";
	}

	
	//공통 : 도서 검색 폼
	@RequestMapping("lib_bookSearch")
	public String lib_bookSearch(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSearch-도서검색");
		LIservice.getBooklist(req,model);
		return "library/lib_joint/lib_bookSearch";
	}
	
	
	//공통 : 도서 검색 결과 (ajax)
	@RequestMapping("lib_bookSearchResult")
	public String lib_bookSearchResult(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSearchResult-도서검색결과");
		
		LIservice.lib_bookSearchResult(req, model);
		return "library/lib_joint/lib_bookSearchResult";
	}
	
	
	
	

	//test
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) {
		
		System.out.println("qrcode");
		return "library/qr/qrcodetest";
	}
	
	
	@RequestMapping("barcode")
	public String barcode(HttpServletRequest req, Model model) {
		
		System.out.println("barcode");
		return "library/barcode/barcodetest1";
	}
	
	
	
	
	
	
	
	


	//도서 좌석 현황
	@RequestMapping("lib_seat")
	public String lib_seat(HttpServletRequest req, Model model) {
		System.out.println("lib_viewSeat-좌석 현황 및 예약");			
		return "library/lib_ara/lib_seat";
	}
	//좌석 현황 결과 
	@RequestMapping("lib_seat_sub")
	public String lib_seat_sub(HttpServletRequest req, Model model) {
		
		System.out.println("lib_viewSeat-좌석 현황 및 예약");	
		LIservice.lib_viewSeat(req, model);		
		return "library/lib_ara/lib_seat_sub";
	}
	
	
	//좌석 이용 등록
	@RequestMapping("lib_seat_use")
	public String lib_seat_use(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_use-좌석 이용등록");	
		LIservice.lib_seat_use(req,model);
		
		/*String selectCnt = model.mergeAttributes("selectCnt");
		model.addAttribute("selectCnt",model.toString());*/
		
		LIservice.lib_viewSeat(req,model);
		return "library/lib_ara/lib_seat_sub";
	}
	
	//이용자 : 좌석이용 중지,취소
	@RequestMapping("lib_seat_useCancle")
	public String lib_seat_useCancle(HttpServletRequest req, Model model) {
		System.out.println("lib_seat_useCancle- 이용자 : 좌석이용 중지");	
		
		LIservice.lib_seat_stopPro(req,model);
		LIservice.lib_viewSeat(req,model);
		return "library/lib_ara/lib_seat_sub";
	}
	
	
	//이용자 : 마이라이브러리
	@RequestMapping("lib_myLibrary")
	public String lib_myLibrary(HttpServletRequest req, Model model) {
		System.out.println("lib_myLibrary- 마이라이브러리");	
		
		LIservice.lib_myLibrary(req,model);		
		return "library/lib_ara/lib_myLibrary";
	}
	
	
	//실시간 검색기능
	@RequestMapping("searchTest")
	public String searchTest() {
		System.out.println("searchTest");
		return "library/searchTest";
	}	
	//검색 결과
	@RequestMapping("searchResult")
	public String searchResult(HttpServletRequest req, Model model) {
		System.out.println("searchResult");						
		LIservice.searchtest(req, model);		
		return "library/searchResult";
	}
	
	
	
	
	
	
	
	
}
