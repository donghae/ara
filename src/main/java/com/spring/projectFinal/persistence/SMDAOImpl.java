package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class SMDAOImpl implements SMDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int juminChk(String REGI_NO) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int chkCnt = dao.juminChk(REGI_NO);
		return chkCnt;
	}

	@Override
	public int applyMember(ApplicationVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int insertCnt = dao.applyMember(vo);
		return insertCnt;
	}

	@Override
	public int getArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getArticleList(map);
		return dtos;
	}

	@Override
	public int getPassArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getPassArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getPassArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getPassArticleList(map);
		return dtos;
	}

	@Override
	public int getExtraArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getExtraArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getExtraArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getExtraArticleList(map);
		return dtos;
	}

	@Override
	public void recognizePass(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.recognizePass(majorNum);
	}

	@Override
	public void recognizeFail(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.recognizeFail(majorNum);
	}

	@Override
	public void extraRecognizePass(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.extraRecognizePass(majorNum);
	}

	// 강의 개수 구하기
	@Override
	public int getLectureCnt(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.getLectureCnt(map);
		return cnt;
	}

	// 강의 목록 조회
	@Override
	public ArrayList<Lec_Prof_VO> getLectureList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<Lec_Prof_VO> dtos = dao.getLectureList(map);
		return dtos;
	}

	// 강의 등록
	@Override
	public int lecturePlus(LectureVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int insertCnt = dao.lecturePlus(vo);
		return insertCnt;
	}

	// 검색된 교수 수 구하기
	@Override
	public int getProfCnt(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.getProfCnt(map);
		return cnt;
	}

	// 검색된 교수 리스트 조회
	@Override
	public ArrayList<ProfessorVO> getProfList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ProfessorVO> dtos = dao.getProfList(map);
		return dtos;
	}

	// 강의 수정 페이지
	@Override
	public Lec_Prof_VO LectureModi(int lec_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		Lec_Prof_VO vo = dao.LectureModi(lec_no);
		return vo;
	}

	// 강의 수정 처리 페이지
	@Override
	public void lectureModiPro(LectureVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.lectureModiPro(vo);
	}

	// 강의 삭제 처리 페이지
	@Override
	public void lectureDel(int lec_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.lectureDel(lec_no);
	}
	// 수강신청 시작
	@Override
	public void regStart() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.regStart();
	}
	
	// 수강신청 종료
	@Override
	public void regEnd() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.regEnd();
	}
	
	//수강 계획 도우미 개수
	@Override
	public int cartCnt(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.cartCnt(id);
		return cnt;
	}
	
	// 수강 계획 도우미 조회
	@Override
	public ArrayList<Lecture_Wish_VO> cartList(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<Lecture_Wish_VO> dtos = dao.cartList(id);
		return dtos;
	}

	// 수강 계획 도우미 추가
	@Override
	public void cartPlus(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.cartPlus(map);
	}
	
	// 수강 계획 도우미 삭제
	@Override
	public void cartDel(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.cartDel(map);
	}
	
	// 수강 계획 도우미 추가
	@Override
	public void cartUpdate(int lec_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.cartUpdate(lec_no);
	}
		
	// 수강 계획 도우미 추가
	@Override
	public int cartChk(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.cartChk(map);
		return cnt;
	}
	
	//수강 신청 개수
	@Override
	public int regCnt(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.regCnt(id);
		return cnt;
	}
	
	// 수강 신청 목록 조회
	@Override
	public ArrayList<Lecture_Wish_VO> regList(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<Lecture_Wish_VO> dtos = dao.regList(id);
		return dtos;
	}

	// 수강 신청 추가
	@Override
	public void regPlus(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.regPlus(map);
	}
	
	//수강 신청시 성적 초기화
	@Override
	public void gpaPlus(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.gpaPlus(map);
	}
	
	//수강 신청시  삭제시 성적 삭제
	@Override
	public void gpaDel(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.gpaDel(map);
	}
	
	//수강 신청 사람수 초과 체크
	@Override
	public Reg_Lec_LectureVO personChk(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		Reg_Lec_LectureVO vo=dao.personChk(map);
		return vo;
	}
	
	// 수강 신청 삭제
	@Override
	public void regDel(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.regDel(map);
	}
	
	// 수강 신청 현재인원 업데이트
	@Override
	public void regUpdate(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.regUpdate(map);
	}
	
	// 수강 신청 확인
	@Override
	public int regChk(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.regChk(map);
		return cnt;
	}
	
	// 수강계획도우미 - 시간표
	@Override
	public ArrayList<LectureVO> getCartInfo(Map<String, Object> map) {
		ArrayList<LectureVO> list = new ArrayList<>();
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		list = dao.getCartInfo(map);
		return list;
	}
	// 수강신청 - 시간표
	@Override
	public ArrayList<LectureVO> getRegInfo(Map<String, Object> map) {
		ArrayList<LectureVO> list = new ArrayList<>();
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		list = dao.getRegInfo(map);
		return list;
	}
	
	@Override
	public int tuition(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int tuition = dao.tuition(id);
		return tuition;
	}
	
	// 장학금관리> 장학금 수여내역 조회 - 성적 개수
	@Override
	public int getGpaCnt(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getGpaCnt(id);
		return selectCnt;
	}

	// 장학금관리> 장학금 수여내역 조회 
	@Override
	public ArrayList<Gpa_Total_VO> getGpaList(String id) {
		ArrayList<Gpa_Total_VO> dtos = null;
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dtos = dao.getGpaList(id);
		return dtos;
	}
	
	// 장학금관리> 장학금 수여내역 조회 -총인원구하기
	@Override
	public int getTotal() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int total = dao.getTotal();
		return total;
	}
	
	// 장학금관리 > 금년 순위 구하기
	@Override
	public int getRank(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int rank=0;
		rank = dao.getRank(id);
		return rank;
	}
	
	// 장학금관리 > 금년 순위 구하기
	@Override
	public int regfl() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int regfl=dao.regfl();
		return regfl;
	}
	
	// 장학금관리 > 금년 순위 개수 구하기
	@Override
	public int getGpaCntThis(String id) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt=dao.getGpaCntThis(id);
		return cnt;
	}

	//합격관리 - 합격자 - 학번제공
	@Override
	public ApplicationVO provideSt_no(int ent_regi_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ApplicationVO dto=dao.provideSt_no(ent_regi_no);
		return dto;
	}
	
	//합격관리 - 합격자 - 학번제공
	@Override
	public int provide(Map<String,Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int insertCnt=dao.provide(map);
		return insertCnt;
	}
	
	//합격한 사람 업데이트 - 합격상태(3)-> 학번제공(4)
	@Override
	public int updateStu(int ent_no){
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int updateStu = dao.updateStu(ent_no);
		return updateStu;
	}
	
	//합격자 수험번호 조회
	@Override
	public String st_no(String regi_no){
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		String st_no = dao.st_no(regi_no.replace("\"", ""));
		System.out.println(regi_no + " : regi_no");
		System.out.println(st_no+" : st_no");
		return st_no;
	}
	
	
	
	// 아름

   // 합격자 조회 처리
   @Override
   public int nmJuminChk(Map<String, Object> map) {
      int selectCnt = 0;
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      int pwdChkCnt = dao.nmJuminChk(map);

      if (pwdChkCnt == 1) {
         selectCnt = 1;
      } else {
         selectCnt = 0;
      }
      return selectCnt;
   }

   // 합격자 State 가져오기
   @Override
   public ApplicationVO entStateChk(Map<String, Object> map) {
      ApplicationVO vo = new ApplicationVO();
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      vo = dao.entStateChk(map);
      return vo;
   }

   // 학적 관리 > 기본 학적 상세페이지
   @Override
   public StudentVO getStudentInfo(String strId) {
      StudentVO vo = new StudentVO();
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      vo = dao.getStudentInfo(strId);
      return vo;
   }

   // 학적 관리 > 기본 학적 상세페이지 - 정보 업데이트 처리
   @Override
   public int updateStInfo(StudentVO vo) {
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      int updateCnt = dao.updateStInfo(vo);
      return updateCnt;
   }

   // 수업관리 > 내 강의실 - 시간표
   @Override
   public ArrayList<Stu_Reg_Lec_VO> getLectureInfo(Map<String, Object> map) {
      ArrayList<Stu_Reg_Lec_VO> list = new ArrayList<>();
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      list = dao.getLectureInfo(map);
      return list;
   }

   // 수업관리 > 내 강의실 > 내 강의 개수
   @Override
   public int getMyLecCnt(String id) {
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      int selectCnt = dao.getMyLecCnt(id);
      return selectCnt;
   }

   // 수업관리 > 내 강의실 > 내 강의 목록
   @Override
   public ArrayList<Lec_Prof_VO> getMyLecList(Map<String, Object> map) {
      ArrayList<Lec_Prof_VO> dtos = null;
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      dtos = dao.getMyLecList(map);
      return dtos;
   }

   // 수업관리 > 내 강의실 > 강의목록 > 출결
   @Override
   public List<AttendVO> getAttendLi(Map<String, Object> map) {
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      List<AttendVO> list = dao.getAttendLi(map);
      return list;
   }

   // 성적관리 > 성적조회 갯수
   @Override
   public int getGpaThisCnt(Map<String, Object> map2) {
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      int selectCnt = dao.getGpaThisCnt(map2);
      return selectCnt;
   }

   // 성적관리 > 금학기 성적 목록 조회
   @Override
   public ArrayList<Gpa_Lec_VO> getGpaThisList(Map<String, Object> map) {
      ArrayList<Gpa_Lec_VO> dtos = null;
      SMDAO dao = sqlSession.getMapper(SMDAO.class);
      dtos = dao.getGpaThisList(map);
      return dtos;
   }
   
   
   @Override
   public int getStudentCnt(String major) {
       SMDAO dao = sqlSession.getMapper(SMDAO.class);
       int selectCnt = dao.getStudentCnt(major);
       return selectCnt;
   }
   
   @Override
   public ArrayList<StudentVO> getStudentList(String major) {
       ArrayList<StudentVO> dtos = null;
       SMDAO dao = sqlSession.getMapper(SMDAO.class);
       dtos = dao.getStudentList(major);
       return dtos;
   }
   
   @Override
   public int getAdminGpaCnt() {
       SMDAO dao = sqlSession.getMapper(SMDAO.class);
       int selectCnt = dao.getAdminGpaCnt();
       return selectCnt;
   }
   
   @Override
   public ArrayList<Gpa_Lec_Stu_VO> getAdminGpaList() {
       ArrayList<Gpa_Lec_Stu_VO> dtos = null;
       SMDAO dao = sqlSession.getMapper(SMDAO.class);
       dtos = dao.getAdminGpaList();
       return dtos;
   }
}
