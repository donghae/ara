package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Attend_Lec_VO;
import com.spring.projectFinal.SMVO.GpaVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_Stu_VO;
import com.spring.projectFinal.SMVO.Gpa_Total_VO;
import com.spring.projectFinal.SMVO.Lec_Reg_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.StudentVO;

@Repository
public class SM2DAOImpl implements SM2DAO {

	@Autowired
	private SqlSession sqlSession;
	
	//희현
	
	// 총점 개수
	@Override
	public int totalCnt(String st_no) {
		SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
		int cnt = dao.totalCnt(st_no);
		return cnt;
	}
		
	//평균 구하기
	@Override
	public float total(String st_no) {
		SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
		float total = dao.total(st_no);
		return total;
	}
	
	// 성적 입력 처리
	@Override
	public int insertTotal(Gpa_Total_VO vo) {
		SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
		int insertCnt = dao.insertTotal(vo);
		return insertCnt;
	}

	// 성적 업데이트 처리
	@Override
	public int updateTotal(Gpa_Total_VO vo) {
		SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
		int updateCnt = dao.updateTotal(vo);
		return updateCnt;
	}
	
	
	
	//아름

   // 교수 시간표
   @Override
   public ArrayList<Lec_Reg_Prof_VO> proLecList(Map<String, Object> map) {
      ArrayList<Lec_Reg_Prof_VO> list = new ArrayList<>();
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      list = dao.proLecList(map);
      return list;
   }

   // 내 강의실 - 해당 강의를 듣는 학생 수
   @Override
   public int proStuCnt(String lec_name) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int selectCnt = dao.proStuCnt(lec_name);
      return selectCnt;
   }

   // 내 강의실 - 해당 강의를 듣는 학생 목록
   @Override
   public ArrayList<Gpa_Lec_Stu_VO> proStuList(Map<String, Object> map) {
      ArrayList<Gpa_Lec_Stu_VO> dtos = null;
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      dtos = dao.proStuList(map);
      return dtos;
   }

   // 성적 개수
   @Override
   public int gradeCnt(String st_no) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int cnt = dao.gradeCnt(st_no);
      return cnt;
   }
   
   // 성적 입력 처리
   @Override
   public int insertGrade(GpaVO vo) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int insertCnt = dao.insertGrade(vo);
      return insertCnt;
   }
   
   // 성적 업데이트 처리
   @Override
   public int updateGrade(GpaVO vo) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int updateCnt = dao.updateGrade(vo);
      return updateCnt;
   }

   // 출결 목록
   @Override
   public ArrayList<Attend_Lec_VO> getAttendLi(Map<String, Object> map2) {
      ArrayList<Attend_Lec_VO> dtos2 =null;
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      dtos2 = dao.getAttendLi(map2);
      return dtos2;
   }

   // 강의명 -> 강의번호로 바꾸기
   @Override
   public int changeLec(String lec_name) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int lec_no = dao.changeLec(lec_name);
      return lec_no;
   }

   // 출결저장
   @Override
   public int inputAttend(AttendVO vo) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int insertCnt = dao.inputAttend(vo);
      return insertCnt;
   }

   @Override
   public String changeStu(String st_name) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      String stNo = dao.changeStu(st_name);
      return stNo;
   }

   @Override
   public String lecStart(int lec_no) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      String startDate = dao.lecStart(lec_no);
      return startDate;
   }

   @Override
   public Gpa_Lec_Stu_VO proStuList2(Map<String, Object> map) {
      Gpa_Lec_Stu_VO vo = new Gpa_Lec_Stu_VO();
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      vo = dao.proStuList2(map);
      return vo;
   }

   // 같은 날짜의 출결 개수
   @Override
   public int sameDateCnt(Map<String, Object> map) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int selectCnt = dao.sameDateCnt(map);
      return selectCnt;
   }
   
   // 같은 날짜에 출결이 하나라도 있으면 출결 업데이트
   @Override
   public int updateAttend(AttendVO vo) {
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      int updateCnt = dao.updateAttend(vo);
      return updateCnt;
   }

   // 출석여부가져오기
   @Override
   public ArrayList<Attend_Lec_VO> attendList(Map<String, Object> map3) {
      ArrayList<Attend_Lec_VO> dtos2 =null;
      SM2DAO dao = sqlSession.getMapper(SM2DAO.class);
      dtos2 = dao.getAttendLi(map3);
      return dtos2;
   }
}