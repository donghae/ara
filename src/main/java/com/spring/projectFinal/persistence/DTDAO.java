package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;
import com.spring.projectFinal.DTVO.Admin_notice_selectVO;
import com.spring.projectFinal.DTVO.Admin_stu_selectVO;
import com.spring.projectFinal.DTVO.AraCircleVO;
import com.spring.projectFinal.DTVO.Dt_stu_overnight_selectVO;
import com.spring.projectFinal.DTVO.Dt_stu_penalty_selectVO;



public interface DTDAO {

	// 관리자 
	public AdminVO getAdminInfo1(Map<String,Object> map);
	
	// 교수 로그인
	public ProfessorVO getProfInfo1(Map<String,Object> map);
	
	// 학생 로그인
	public StudentVO getStudentInfo1(Map<String,Object> map);
	
	// 관리자 로그인
	public int dtAdminLogin(Map<String, Object> map);
	
	// 관리자 기숙사 학생 수 조회
	public int getDormStInfoCnt();
	
	// 관리자 기숙사 학생 목록
	public ArrayList<Admin_stu_selectVO> getDormStInfoLiDormSt(Map<String, Object> map);
	
	// 관리자 기숙사 학생 등록
	public int addDormStInfo(Map<String, Object> map);
	
	// 관리자 공지사항 게시글 조회
	public int getDormNoticeCnt();
	
	// 관리자 공지사항 목록 가지고 오기
	public ArrayList<Admin_notice_selectVO> getDormNotice(Map<String, Integer> map);
	
	// 관리자 공지사항 조회수 증가
	public int getDormNoticeCntUp(Map<String,Object> map);
	
	// 관리자 공지사항 상세페이지 값 뿌리기
	public Admin_notice_selectVO getDormNoticeDetail(int dorm_n_no);
	
	// 관리자 공지사항 수정 값 뿌리기
	public Admin_notice_selectVO updateDormNotice(Map<String, Object> map);
	
	// 관리자 공지사항 수정 처리 update
	public int updateDormNoticeCon(Map<String,Object> map);
	
	// 관리자 공지사항 글 등록 insert
	public int addDormNotice(Admin_notice_selectVO dto);
	
/*	// 관리자 공지사항 수정 목록 가져오기
	public Admin_notice_selectVO addAdminNoticeModify(int ad_no);*/
	
	// 관리자 벌점관리 클릭시 벌점 현황 게시판 글 수
	public int getDormPenaltyCnt();
	
	// 관리자 벌점현황 목록
	public ArrayList<Dt_stu_penalty_selectVO> getDormPenalty(Map<String, Object> map);
	
	// 관리자 벌점 수정 클릭
	public Dt_stu_penalty_selectVO dtAdminPenaltyUp(Map<String,Object> map);
	
	// 관리자 벌점 수정 처리
	public int dtAdminStuUpdate (Map<String,Object> map);
	
	/*// 관리자 벌점 조회 
	public ArrayList<Dt_stu_penalty_selectVO> dtAdminPenaltySel();*/
	
	// 관리자 벌점 등록
	public int addPenaltyInsert(Map<String,Object> map);
	
	// 관리자 벌점 수정 목록
	public ArrayList<Dt_stu_penalty_selectVO> selectPenalty();
	
	// 관리자 벌점 수정 이름 클릭
	public int updatePenalty(Map<String,Object> map);
	
	// 관리자 외박신청 목록 갯수
	public int getDormOvernightCnt();
	
	// 관리자 외박신청 목록 dtos
	public ArrayList<Dt_stu_overnight_selectVO> getDormOvernightList(Map<String, Object> map);
	
	// 관리자 외박신청 승인
	public int dtAdminOvernightIns(Map<String, Object> map);
	
	// 관리자 외박신청 승인 목록 건수 조회
	public int getDormOvernightSelect();
	
	// 관리자 외박신청 승인 목록 가져오기
	public ArrayList<Dt_stu_overnight_selectVO> getDormOvernightSelectList(Map<String, Object> map);
	
	
	// 학생 외박 신청 목록 조회
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightSelect(Map<String,Object> map);	
	
	// 학생 외박 신청	
	public int dtStuNightInsert(Map<String, Object> map);
	
	// 학생 외박 신청 글 수 조회
	public int dtStuOvernightCnt(String st_no);
	
	// 학생 외박 수정 pwd
	public Dt_stu_overnight_selectVO dtStuNightupd(Map<String,Object> map);
	
	// 학생 외박 수정 정보 뿌리기
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightUpdate(String st_no);
	
	// 학생 외박 정보 수정 처리
	public int dtStuNightrevision(Map<String, Object> map);
	
	// 학생 외박 신청 삭제 pwd
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightDeletePwd(String st_no);
	
	// 학생 외박 삭제 처리
	public int dtStuNightDeletelist(Map<String, Object> map);
	
	// 학생 공지사항 상세조회
	public Admin_notice_selectVO dtStuNoticeSelect(int dorm_n_no);
	
	// 학생 벌점조회 글 수 조회
	public int dtStuPenaltyCnt(String st_no);
	
	// 해당 학생 벌점 목록 뿌리기
	public ArrayList<Dt_stu_penalty_selectVO> dtStuPenalty(Map<String,Object> map);
	
	// 학생 기숙사 정보 조회
	public Admin_stu_selectVO dtStuSelect(String st_no);
	
	
	
	
	// ara 동아리 수 조회
	public int getCircleListCnt();
	
	// ara 동아리 목록 조회
	public ArrayList<AraCircleVO> getCircleList(Map<String, Integer> map);
	
	// ara 동아리 수정 목록 클릭
	public ArrayList<AraCircleVO> araCircleBefore(String cc_name);
	
	// ara 동아리 수정 등록
	public int araCircleAfter(Map<String,Object> map);
	
	// ara 동아리 목록 삭제
	public int araCircleDelete(String cc_name);
	
	
}


