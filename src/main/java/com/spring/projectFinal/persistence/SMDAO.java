package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.projectFinal.SMVO.ApplicationVO;
import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_Stu_VO;
import com.spring.projectFinal.SMVO.Gpa_Lec_VO;
import com.spring.projectFinal.SMVO.Gpa_Total_VO;
import com.spring.projectFinal.SMVO.Lec_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.Lecture_Wish_VO;
import com.spring.projectFinal.SMVO.ProfessorVO;
import com.spring.projectFinal.SMVO.Reg_Lec_LectureVO;
import com.spring.projectFinal.SMVO.Stu_Reg_Lec_VO;
import com.spring.projectFinal.SMVO.StudentVO;

public interface SMDAO {

	// 주민체크
	public int juminChk(String REGI_NO);

	// 입학신청
	public int applyMember(ApplicationVO vo);

	// 지원자 수 구하기
	public int getArticleCnt(int majorNum);

	// 지원자 목록 조회
	public ArrayList<ApplicationVO> getArticleList(Map<String, Object> map);

	// 지원자 합격 수 구하기
	public int getPassArticleCnt(int majorNum);

	// 지원자 합격 목록 조회
	public ArrayList<ApplicationVO> getPassArticleList(Map<String, Object> map);

	// 지원자 합격
	public void recognizePass(int majorNum);

	// 지원자 불합격
	public void recognizeFail(int majorNum);

	// 추가 합격
	public void extraRecognizePass(int majorNum);

	// 지원자 수 구하기
	public int getExtraArticleCnt(int majorNum);

	// 지원자 목록 조회
	public ArrayList<ApplicationVO> getExtraArticleList(Map<String, Object> map);

	// 강의 수 구하기
	public int getLectureCnt(Map<String, Object> map);

	// 강의 리스트 조회
	public ArrayList<Lec_Prof_VO> getLectureList(Map<String, Object> map);

	// 교수 검색 수 구하기
	public int getProfCnt(Map<String, Object> map);

	// 교수 리스트 조회
	public ArrayList<ProfessorVO> getProfList(Map<String, Object> map);

	// 강의 추가
	public int lecturePlus(LectureVO vo);

	// 강의 수정 페이지
	public Lec_Prof_VO LectureModi(int lec_no);

	// 강의 수정 처리 처리 페이지
	public void lectureModiPro(LectureVO vo);

	// 강의 삭제 처리 처리 페이지
	public void lectureDel(int lec_no);

	// 수강신청 시작
	public void regStart();
	
	// 수강 신청 종료
	public void regEnd();
	
	//강의관리- 수강신청 상태 조회
	public int regfl();
	
	// 수강 계획 도우미 개수 구하기
	public int cartCnt(String id);

	// 수강 계획 도우미 조회
	public ArrayList<Lecture_Wish_VO> cartList(String id);

	// 수강 계획 도우미 추가
	public void cartPlus(Map<String,Object> map);

	// 수강 계획 도우미 삭제
	public void cartDel(Map<String,Object> map);

	// 수강 계획 도우미 현재인원수 업데이트
	public void cartUpdate(int lec_no);

	// 수강 계획 도우미 중복확인
	public int cartChk(Map<String,Object> map);
	
	// 수강 계획 도우미 개수 구하기
	public int regCnt(String id);
	
	// 수강 계획 도우미 시간표
	public ArrayList<LectureVO> getCartInfo(Map<String, Object> map);

	// 수강 신청 목록 조회
	public ArrayList<Lecture_Wish_VO> regList(String id);

	// 수강 신청 추가
	public void regPlus(Map<String,Object> map);
	
	//수강 신청시 성적 초기화
	public void gpaPlus(Map<String,Object> map);
	
	//수강 신청시  삭제시 성적 삭제
	public void gpaDel(Map<String,Object> map);
	
	//수강 신청 추가 - 인원초과 체크
	public Reg_Lec_LectureVO personChk(Map<String,Object> map);

	// 수강 신청 삭제
	public void regDel(Map<String,Object> map);

	// 수강 신청 신청인원수 업데이트
	public void regUpdate(Map<String,Object> map);
	
	// 수강 신청 중복확인
	public int regChk(Map<String, Object> map);

	// 수업관리 > 내 강의실 - 시간표
	public ArrayList<LectureVO> getRegInfo(Map<String, Object> map);

	//등록금 조회
	public int tuition(String id);
	
	// 장학금관리 > 장학금 수여 내역조회 - 성적 개수
	public int getGpaCnt(String id);

	// 장학금관리 > 장학금 수여 내역조회 - 성적 목록 조회
	public ArrayList<Gpa_Total_VO> getGpaList(String id);
	
	// 장학금관리 > 장학금 수여 내역조회 - 총인원 구하기
	public int getTotal();
	
	// 장학금관리 > 금년 순위 구하기
	public int getRank(String id);
	
	// 장학금관리 > 금년 순위 개수 구하기
	public int getGpaCntThis(String id);
	
	//합격관리 - 합격자 - 학번제공
	public ApplicationVO provideSt_no(int ent_regi_no);
	
	
	//합격관리 - 합격자 - 학번제공
	public int provide(Map<String,Object> map);
	
	//합격한 사람 업데이트 - 합격상태(3)-> 학번제공(4)
	public int updateStu(int ent_no);

	//합격자 수험번호 조회
	public String st_no(String regi_no);
	
	
	
	
	// 아름
   // 합격자 조회 처리
   public int nmJuminChk(Map<String, Object> map);

   // 합격자 State 가져오기
   public ApplicationVO entStateChk(Map<String, Object> map);

   // 학적 관리 > 기본 학적 상세페이지
   public StudentVO getStudentInfo(String strId);
   //public StudentVO getStudentInfo();

   // 학적 관리 > 기본 학적 상세페이지 - 정보 업데이트 처리
   public int updateStInfo(StudentVO vo);

   // 수업관리 > 내 강의실 - 시간표
   public ArrayList<Stu_Reg_Lec_VO> getLectureInfo(Map<String, Object> map);

   // 수업관리 > 내 강의실 > 내 강의 개수
   public int getMyLecCnt(String id);

   // 수업관리 > 내 강의실 > 내 강의 목록
   public ArrayList<Lec_Prof_VO> getMyLecList(Map<String, Object> map);

   // 수업관리 > 내 강의실 > 강의목록 > 출결 개수
   public List<AttendVO> getAttendLi(Map<String, Object> map);

   // 성적관리 > 성적조회 갯수
   public int getGpaThisCnt(Map<String, Object> map2);

   // 성적관리 > 금학기 성적 목록 조회
   public ArrayList<Gpa_Lec_VO> getGpaThisList(Map<String, Object> map);

   // 관리자 > 전체 학생수
   public int getStudentCnt(String major);
   
   // 관리자 > 전체 학생 조회
   public ArrayList<StudentVO> getStudentList(String major);

   // 관리자 > 전체 성적 갯수
   public int getAdminGpaCnt();
   
   // 관리자 > 전체 성적 조회
   public ArrayList<Gpa_Lec_Stu_VO> getAdminGpaList();

}
