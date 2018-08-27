package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SMService {
	
	//주민등록번호 중복체크
	public int juminChk(HttpServletRequest req, Model model);

	//입학신청 - 신청버튼
	public void appPro(MultipartHttpServletRequest req, Model model);

	// 2.지원자 목록
	public void applyList(HttpServletRequest req, Model model);

	// 2.지원 합격자 목록
	public void applyPassList(HttpServletRequest req, Model model);

	// 2.승인하기버튼-관리자
	public void recognize(HttpServletRequest req, Model model);

	// 2.추가 합격자 관리
	public void applyExtraList(HttpServletRequest req, Model model);

	// 3.강의관리-전체강의리스트
	public void lectureList(HttpServletRequest req, Model model);

	// 3.강의관리-전체강의리스트 - 강의 수정
	public void lectureModi(HttpServletRequest req, Model model);

	// 3.강의관리-강의 추가
	public void lecturePlus(HttpServletRequest req, Model model);

	// 3.강의관리-강의 추가-교수검색
	public void searchProf(HttpServletRequest req, Model model);

	// 3.강의관리 - 강의 수정
	public void lectureModiPro(HttpServletRequest req, Model model);

	// 3.강의관리 - 강의 삭제
	public void deletePro(HttpServletRequest req, Model model);
	
	// 3.강의관리 - 수강신청 시작
	public void regStart(HttpServletRequest req, Model model);
	
	// 3.강의관리 - 수강신청 종료
	public void regEnd(HttpServletRequest req, Model model);
	
	// 4.학적 관리 > 기본 학적
	public void st_profile(HttpServletRequest req, Model model);

	// 4.학적 관리 > 기본 학적 - 정보수정 처리
	public void st_profileModiPro(HttpServletRequest req, Model model);
	
	// 5.강의관리 - 수강신청 상태 조회
	public int regfl(HttpServletRequest req, Model model);

	// 5.수업관리 > 내 강의실 -시간표
	public void st_timetable(HttpServletRequest req, Model model);

	// 5.수업관리 > 내 강의실 > 내 강의 목록
	public void st_lectureList(HttpServletRequest req, Model model);

	// 5.수업관리 > 내 강의실 > 강의 목록 > 출결 현황
	public void st_attendList(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강계획도우미 
	public void cartList(HttpServletRequest req, Model model);	
	
	//5.수업관리 > 수강계획도우미 > 추가버튼
	public void cartPlus(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강계획도우미 > 삭제버튼
	public void cartDel(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강계획도우미 현재인원수
	public void cartUpdate(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강계획도우미 중복확인
	public int cartChk(HttpServletRequest req, Model model);
	
	// 5.수업관리 > 수강신청계획서 - 시간표보기
	public void cartTimeTable(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청목록 
	public void regList(HttpServletRequest req, Model model);	
	
	//5.수업관리 > 수강신청 > 추가버튼
	public void regPlus(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청 > 추가버튼 - 인원초과 체크
	public int personChk(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청 > 삭제버튼
	public void regDel(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청 현재인원수
	public void regUpdate(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청 중복확인
	public int regChk(HttpServletRequest req, Model model);
	
	//5.수업관리 > 수강신청 > 시간표
	public int regTimeTable(HttpServletRequest req, Model model);
	
	// 6.성적관리 > 금학기 성적조회
	public void st_gpaList(HttpServletRequest req, Model model);
	
	//7. 장학금 관리 > 장학수여 내역 조회
	public void gpaList(HttpServletRequest req, Model model);
	
	//7. 장학금 관리 > 총 인원 구하기
	public void stuTotal(HttpServletRequest req, Model model);
	
	//8. 등록금 관리 > 등록금 납부 조회
	public int tuition(HttpServletRequest req, Model model);
	
	//8. 등록금 관리 > 금년 순위 구하기
	public void rank(HttpServletRequest req, Model model);

		
	// 합격자 조회
	public void passChkPro(HttpServletRequest req, Model model);
	
	// 합격자 학번제공
	public void provideSt_no(HttpServletRequest req, Model model);
	
	//합격자 수험번호 조회
	public void st_no(HttpServletRequest req, Model model);
	
  // 학생 전체 조회
   public void stuList(HttpServletRequest req, Model model);
   
   // 성적 전체 조회
   public void adminGpaList(HttpServletRequest req, Model model);

}
