package com.spring.projectFinal.AndroidAra;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.AndroidAra.StudentVO;


@Repository
public class AndroidDAOImpl implements AndroidDAO{

	@Autowired
	SqlSession sqlSession;
	

	//로그인
	@Override
	public StudentVO getMemberInfo(String id) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		StudentVO m = dao.getMemberInfo(id);		
		System.out.println("dao m : " + m);		
		return m;
	}

	@Override
	public int confirmIdPwd(Map<String, Object> map) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		return dao.confirmIdPwd(map);
	}

	@Override
	public List<AttendVO> getAttendList(String id) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		return dao.getAttendList(id);
	}

	@Override
	public List<Gpa_Total_VO> getGpaList(String id) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		return dao.getGpaList(id);
	}

	@Override
	public List<Stu_Reg_Lec_VO> getLectureInfo(Map<String, Object> map) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		return dao.getLectureInfo(map);
	}

}
