package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.CLVO.CyberAttendanceVO;
import com.spring.projectFinal.CLVO.CyberLecNoticeVO;
import com.spring.projectFinal.CLVO.CyberNoticeVO;
import com.spring.projectFinal.CLVO.LectureVO;
import com.spring.projectFinal.CLVO.RoundVO;


@Repository
public class CLDAOImpl implements CLDAO{
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int addLecNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		int insertCnt = dao.addLecNotice(map);
		return insertCnt;
	}


	@Override
	public int getLecNoticeCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getLecNoticeCnt(map);
	}


	@Override
	public ArrayList<CyberLecNoticeVO> getLecNoticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		ArrayList<CyberLecNoticeVO> dtos = dao.getLecNoticeList(map);
		return dtos;
	}


	@Override
	public CyberLecNoticeVO getLecNotice(int cy_lec_n_no) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		CyberLecNoticeVO vo = dao.getLecNotice(cy_lec_n_no);
		return vo;
	}


	@Override
	public int getLecCnt(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getLecCnt(map);
	}


	@Override
	public ArrayList<LectureVO> getLecList(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		ArrayList<LectureVO> list = dao.getLecList(map);
		return list;
	}


	@Override
	public int getLecPersonCnt(int lec_no) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getLecPersonCnt(lec_no);
	}


	@Override
	public int addNotice(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.addNotice(map);
	}


	@Override
	public int getNoticeCnt() {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getNoticeCnt();
	}
	
	@Override
	public void updateCnt(Map<String,Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		dao.updateCnt(map);
	}
	@Override
	public void updateCnt2(Map<String,Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		dao.updateCnt2(map);
	}

	@Override
	public ArrayList<CyberNoticeVO> getNoticeList(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);

		return dao.getNoticeList(map);
	}


	@Override
	public CyberNoticeVO getNotice(int cy_n_no) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getNotice(cy_n_no);
	}


	@Override
	public int getRoundCnt(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getRoundCnt(map);
	}


	@Override
	public ArrayList<RoundVO> getRoundList(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		
		return dao.getRoundList(map);
	}


	@Override
	public int addRound(RoundVO vo) {
		// TODO Auto-generated method stub
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.addRound(vo);
	}


	@Override
	public int checkCyAttendance(CyberAttendanceVO vo) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.checkCyAttendance(vo);
	}


	@Override
	public int insertCyAttendance(CyberAttendanceVO vo) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.insertCyAttendance(vo);
	}


	@Override
	public int updateCyAttendance(CyberAttendanceVO vo) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.updateCyAttendance(vo);
	}


	@Override
	public CyberAttendanceVO getCyAttendance(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.getCyAttendance(map);
	}


	@Override
	public int updateNotice(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.updateNotice(map);
	}

	@Override
	public int deleteNotice(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.deleteNotice(map);
	}


	@Override
	public int updateLecNotice(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.updateLecNotice(map);
	}
	
	@Override
	public int deleteLecNotice(Map<String, Object> map) {
		CLDAO dao = sqlSession.getMapper(CLDAO.class);
		return dao.deleteLecNotice(map);
	}
	

	
}
