package com.spring.projectFinal.persistence;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.CIVO.MajorVO;



@Repository
public class CIDAOImpl implements CIDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getMajorCnt() {
		// TODO Auto-generated method stub
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		int selectCnt = dao.getMajorCnt();
		
		return selectCnt;
	}

	@Override
	public ArrayList<MajorVO> getMajorList(Map<String, Object> map) {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		ArrayList<MajorVO> dtos = dao.getMajorList(map);
		
		return dtos;
	}

	@Override
	public MajorVO getMajor(int maj_cd) {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		MajorVO vo = dao.getMajor(maj_cd);
		
		return vo;
	}

	@Override
	public int modifyMajor(MajorVO vo) {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		int updateCnt = dao.modifyMajor(vo);
		
		return updateCnt;
	}

	@Override
	public Date getDate() {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		Date date = dao.getDate();
		
		return date;
	}

	@Override
	public int addMajor(MajorVO vo) {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		int insertCnt = dao.addMajor(vo);
		
		return insertCnt;
	}

	@Override
	public int deleteMajor(int maj_cd) {
		CIDAO dao = sqlSession.getMapper(CIDAO.class);
		int deleteCnt = dao.deleteMajor(maj_cd);
		
		return deleteCnt;
	}
}
