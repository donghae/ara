package com.spring.projectFinal.persistence;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;




@Repository
public class ARADAOImpl implements ARADAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkAdmin(Map<String, Object> map) {
		System.out.println("checkAdmin");
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.checkAdmin(map);
	}
	@Override
	public int checkProf(Map<String, Object> map) {
		System.out.println("checkProf");
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.checkProf(map);
	}

	@Override
	public int checkStudent(Map<String, Object> map) {
		System.out.println("checkStudent");
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.checkStudent(map);
	}
	
	
	@Override
	public AdminVO getAdminInfo(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getAdminInfo(map);
	}
	@Override
	public ProfessorVO getProfInfo(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getProfInfo(map);
	}	
	@Override
	public StudentVO getStudentInfo(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getStudentInfo(map);
	}
	
	//id pwd찾기
	@Override
	public ArrayList<AdminVO> getAdminIdPwd(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getAdminIdPwd(map);
	}
	@Override
	public ArrayList<ProfessorVO> getProfIdPwd(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getProfIdPwd(map);
	}
	@Override
	public ArrayList<StudentVO> getStudentIdPwd(Map<String, Object> map) {
		ARADAO dao = sqlSession.getMapper(ARADAO.class);
		return dao.getStudentIdPwd(map);
	}
	
}
