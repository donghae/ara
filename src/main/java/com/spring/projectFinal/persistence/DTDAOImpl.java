package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;
import com.spring.projectFinal.DTVO.Admin_notice_selectVO;
import com.spring.projectFinal.DTVO.Admin_stu_selectVO;
import com.spring.projectFinal.DTVO.AraCircleVO;
import com.spring.projectFinal.DTVO.Dt_stu_overnight_selectVO;
import com.spring.projectFinal.DTVO.Dt_stu_penalty_selectVO;


@Repository
public class DTDAOImpl implements DTDAO{

	@Autowired
	SqlSession sqlsession;

	// 관리자 로그인
	@Override
	public AdminVO getAdminInfo1(Map<String, Object> map) {
		ARADAO dao = sqlsession.getMapper(ARADAO.class);
		return dao.getAdminInfo(map);
	}

	// 교수 로그인
	@Override
	public ProfessorVO getProfInfo1(Map<String, Object> map) {
		ARADAO dao = sqlsession.getMapper(ARADAO.class);
		return dao.getProfInfo(map);
	}

	// 학생 로그인
	@Override
	public StudentVO getStudentInfo1(Map<String, Object> map) {
		ARADAO dao = sqlsession.getMapper(ARADAO.class);
		return dao.getStudentInfo(map);
	}
	
	//관리자 로그인
	@Override
	public int dtAdminLogin(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtAdminLogin(map);
	}

	//관리자 기숙사 학생 수 조회
	@Override
	public int getDormStInfoCnt() {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormStInfoCnt();
	}

	//관리자 기숙사 학생 수 목록
	@Override
	public ArrayList<Admin_stu_selectVO> getDormStInfoLiDormSt(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		
		return dao.getDormStInfoLiDormSt(map);
	}

	// 관리자 기숙사 학생 등록
	@Override
	public int addDormStInfo(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);			
		
		return dao.addDormStInfo(map);
	}

	// 관리자 공지사항 게시 글 갯수
	@Override
	public int getDormNoticeCnt() {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);			
		
		return dao.getDormNoticeCnt();
	}

	// 관리자 공지사항 목록 조회
	@Override
	public ArrayList<Admin_notice_selectVO> getDormNotice(Map<String, Integer> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormNotice(map);
	}	
	
	// 관리자 공지사항 조회수 증가
	@Override
	public int getDormNoticeCntUp(Map<String,Object> map) {
		DTDAO dao = sqlsession.getMapper(DTDAO.class);	
		
		return dao.getDormNoticeCntUp(map);
	}
	
	// 관리자 공지사항 상세페이지 목록 뿌리기
	@Override
	public Admin_notice_selectVO getDormNoticeDetail(int dorm_n_no) {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormNoticeDetail(dorm_n_no);
	}
	
	// 관리자 공지사항 수정 값 뿌리기
	@Override
	public Admin_notice_selectVO updateDormNotice(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.updateDormNotice(map);
	}	
	
	// 관리자 공지사항 수정 update
	@Override
	public int updateDormNoticeCon(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.updateDormNoticeCon(map);
	}

	// 관리자 공지사항 등록 insert
	@Override
	public int addDormNotice(Admin_notice_selectVO dto) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.addDormNotice(dto);
	}	
	
/*	// 관리자 공지사항 수정 목록 뿌리기
	@Override
	public Admin_notice_selectVO addAdminNoticeModify(int ad_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.addAdminNoticeModify(ad_no);
	}	*/
	
	// 관리자 벌점관리 클릭시 벌점 현황 게시판 글 수
	@Override
	public int getDormPenaltyCnt() {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormPenaltyCnt();
	}
	
	// 관리자 벌점현황 목록
	@Override
	public ArrayList<Dt_stu_penalty_selectVO> getDormPenalty(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormPenalty(map);
	}
	
/*	// 관리자 벌점 조회
	@Override
	public ArrayList<Dt_stu_penalty_selectVO> dtAdminPenaltySel() {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtAdminPenaltySel();
	}*/
	
	// 관리자 벌점 등록
	@Override
	public int addPenaltyInsert(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		
		return dao.addPenaltyInsert(map);
	}
	
	// 관리자 벌점 수정 클릭
	@Override
	public Dt_stu_penalty_selectVO dtAdminPenaltyUp(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtAdminPenaltyUp(map);
	}
	
	// 관리자 벌점 수정 처리
	@Override
	public int dtAdminStuUpdate(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtAdminStuUpdate(map);
	}
	
	// 관리자 벌점 수정 목록
	@Override
	public ArrayList<Dt_stu_penalty_selectVO> selectPenalty() {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.selectPenalty();
	}
	
	// 관리자 벌점 수정 이름 클릭
	@Override
	public int updatePenalty(Map<String, Object> map) {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.updatePenalty(map);
	}	
	
	// 관리자 외박신청 목록 갯수
	@Override
	public int getDormOvernightCnt() {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormOvernightCnt();
	}
	
	// 관리자 외박신청 목록 dtos
	@Override
	public ArrayList<Dt_stu_overnight_selectVO> getDormOvernightList(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormOvernightList(map);
	}

	// 관리자 외박신청 승인
	@Override
	public int dtAdminOvernightIns(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtAdminOvernightIns(map);
	}
	
	// 관리자 외박신청 승인 목록 건수
	@Override
	public int getDormOvernightSelect() {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormOvernightSelect();
	}

	// 관리자 외박신청 승인 목록 가져오기
	@Override
	public ArrayList<Dt_stu_overnight_selectVO> getDormOvernightSelectList(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.getDormOvernightSelectList(map);
	}
	
	
	
	
	
	// 학생 외박 조회
	@Override
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightSelect(Map<String,Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightSelect(map);
	}

	// 학생 외박 신청
	@Override
	public int dtStuNightInsert(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightInsert(map);
	}

	// 학생 외박 신청 수 조회
	@Override
	public int dtStuOvernightCnt(String st_no) {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuOvernightCnt(st_no);
	}
	
	// 학생 외박 수정 목록 뿌리기
	@Override
	public Dt_stu_overnight_selectVO dtStuNightupd(Map<String,Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightupd(map);
	}

	// 학생 외박 수정 정보 뿌리기
	@Override
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightUpdate(String st_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightUpdate(st_no);
	}

	// 학생 외박 정보 수정
	@Override
	public int dtStuNightrevision(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightrevision(map);
	}

	// 학생 외박 신청 삭제 pwd
	@Override
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightDeletePwd(String st_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightDeletePwd(st_no);
	}

	// 학생 외박 신청 삭제 처리
	@Override
	public int dtStuNightDeletelist(Map<String, Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuNightDeletelist(map);
	}

	// 학생 공지사항 상세조회
	@Override
	public Admin_notice_selectVO dtStuNoticeSelect(int dorm_n_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		return dao.dtStuNoticeSelect(dorm_n_no);
	}

	// 학생 벌점조회 글 수 조회
	@Override
	public int dtStuPenaltyCnt(String st_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		return dao.dtStuPenaltyCnt(st_no);
	}

	// 해당 학생 벌점 목록 뿌리기
	@Override
	public ArrayList<Dt_stu_penalty_selectVO> dtStuPenalty(Map<String, Object> map) {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		return dao.dtStuPenalty(map);
	}
	
	// 해당 학생 기숙사 정보 조회
	@Override
	public Admin_stu_selectVO dtStuSelect(String st_no) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);
		
		return dao.dtStuSelect(st_no);
	}
	
	
	// ara 동아리 수 조회
	@Override
	public int getCircleListCnt() {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		
		return dao.getCircleListCnt();
	}

	// ara 동아리 목록 게시판
	@Override
	public ArrayList<AraCircleVO> getCircleList(Map<String, Integer> map) {
	
		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		
		return dao.getCircleList(map);
	}

	// ara 동아리 목록 수정 클릭
	@Override
	public ArrayList<AraCircleVO> araCircleBefore(String cc_name) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);		
		
		return dao.araCircleBefore(cc_name);
	}

	// ara 동아리 수정 등록
	@Override
	public int araCircleAfter(Map<String,Object> map) {
		
		DTDAO dao = sqlsession.getMapper(DTDAO.class);	
		
		return dao.araCircleAfter(map);
	}

	// ara 동아리 목록 삭제
	@Override
	public int araCircleDelete(String cc_name) {

		DTDAO dao = sqlsession.getMapper(DTDAO.class);	
		
		return dao.araCircleDelete(cc_name);
	}














































	
	// 학생 기숙사 식단표 조회
	
	
}
