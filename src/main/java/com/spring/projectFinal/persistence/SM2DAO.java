package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Attend_Lec_VO;
import com.spring.projectFinal.SMVO.GpaVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_Stu_VO;
import com.spring.projectFinal.SMVO.Gpa_Total_VO;
import com.spring.projectFinal.SMVO.Lec_Reg_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.StudentVO;

public interface SM2DAO {
	//희현
	//총점 구하기
	public float total(String st_no);
	//총점 입력 처리
	public int insertTotal(Gpa_Total_VO vo);
	
	//총점 업데이트 처리
	public int updateTotal(Gpa_Total_VO vo);
	
	// 성적 개수
	public int totalCnt(String st_no);
	
	
	
	
	
	//아름
	// 교수 강의목록 -  시간표
   public ArrayList<Lec_Reg_Prof_VO> proLecList(Map<String,Object> map);

   // 내 강의실 - 해당 강의를 듣는 학생 수
   public int proStuCnt(String lec_name);

   // 내 강의실 - 해당 강의를 듣는 학생 목록(학번, 전공명, 이름, 성적 출력)
   public ArrayList<Gpa_Lec_Stu_VO> proStuList(Map<String, Object> map);
   
   // 성적 개수
   public int gradeCnt(String st_no);
   
   // 성적 입력 처리
   public int insertGrade(GpaVO vo);
   
   // 성적 업데이트 처리
   public int updateGrade(GpaVO vo);

   // 학생이름 - 학생 번호로 바꾸기
   public String changeStu(String st_name);

   // 수업관리 > 내 강의실 > 강의목록 > 출결
   public ArrayList<Attend_Lec_VO> getAttendLi(Map<String, Object> map2);
   
   // 강의명 강의번호로 바꾸기
   public int changeLec(String lec_name);
   
   // 출결저장
   public int inputAttend(AttendVO vo);
   
   // 시작일 가져오기
   public String lecStart(int lec_no);
   
   // 강의이름, 학생번호 받아서 목록뿌리기
   public Gpa_Lec_Stu_VO proStuList2(Map<String, Object> map);
   
   // 같은 날짜의 출결 개수
   public int sameDateCnt(Map<String, Object> map);
   
   // 같은 날짜에 출결이 하나라도 있으면 출결 업데이트
   public int updateAttend(AttendVO vo);
   
   // 출석여부가져오기
   public ArrayList<Attend_Lec_VO> attendList(Map<String, Object> map3);

}