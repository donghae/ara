package com.spring.projectFinal.persistence;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.LIVO.BookLoanVO;
import com.spring.projectFinal.LIVO.BookVO;
import com.spring.projectFinal.LIVO.SeatVO;
import com.spring.projectFinal.LIVO.SituationVO;

@Repository
public class LIDAOImpl implements LIDAO {

	@Autowired
	SqlSession sqlSession;

	
	
	//isbn번호가 같은 책이 있는지 
	@Override
	public int isbnCheck(Map<String, Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int isbnCnt = lidao.isbnCheck(map);
		
		return isbnCnt;
	};
	
	
	//도서 추가
	@Override
	public int bookadd(BookVO bVO) {
		int updateCnt = 0;
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		updateCnt = lidao.bookadd(bVO);
		
		return updateCnt;		
	}
	
	
	//도서 개수
	@Override
	public int bookcnt(Map<String,Object> map) {

		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int bookcnt = lidao.bookcnt(map);
		
		return bookcnt;		
	}
	
	
	//도서 전체 리스트
	@Override
	public ArrayList<BookVO> booklist(Map<String,Object> map) {

		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<BookVO> bVOs = lidao.booklist(map);
		
		return bVOs;		
	}

	
	//특정 도서 조회
	@Override
	public BookVO bookinfo(String b_no) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		BookVO bVO = lidao.bookinfo(b_no);
		
		return bVO;
	}


	//도서 수정
	@Override
	public int bookupdate(Map<String,Object> map) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int updateCnt = lidao.bookupdate(map);
		
		return updateCnt;
	}


	//도서 삭제
	@Override
	public int bookdelete(String b_no) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int deleteCnt = lidao.bookdelete(b_no);
		
		return deleteCnt;
	}


	//도서 대여
	@Override
	public int loan(BookLoanVO bloanVO) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int insertCnt = lidao.loan(bloanVO);
		
		return insertCnt;
	}
	
	
	//학생 증명
	@Override
	public int stCertiry(String user_no) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int stCertiry_fl = lidao.stCertiry(user_no);
		
		return stCertiry_fl;	
	};
	
	
	//관리자 증명
	@Override
	public int adCertiry(String user_no) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int adCertiry_fl = lidao.adCertiry(user_no);
		
		return adCertiry_fl;	
	};
	
	//교수 증명
	@Override
	public int pfCertiry(String user_no) {
		
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int pfCertiry_fl = lidao.pfCertiry(user_no);
		
		return pfCertiry_fl;	
	}

	
	//소장 중인 도서인지 
	@Override
	public int bnoCheck(Map<String,Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int isb_Cnt = lidao.bnoCheck(map);
		
		return isb_Cnt;
	}

	
	//도서 대여 개수
	@Override
	public int loanCnt(Map<String,Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int selectCnt  = lidao.loanCnt(map);
		
		return selectCnt;	
	}
	
	
	//도서 대여 관련 정보 조회
	@Override
	public ArrayList<BookLoanVO> loanlist(Map<String, Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<BookLoanVO> bloanVOs = lidao.loanlist(map);
		
		return bloanVOs;	
	}

	
	//도서 대여 전체 조회
	@Override
	public ArrayList<BookLoanVO> loanAllList() {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<BookLoanVO> bloanVOs = lidao.loanAllList();
		
		return bloanVOs;	
	}

	//도서 대여 한 건 조회
	@Override
	public BookLoanVO loanlistOne(Map<String,Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		BookLoanVO bloanVO = lidao.loanlistOne(map);
		
		return bloanVO;
	}


	//도서 반납,연장
	@Override
	public int loanreturn(BookLoanVO bloanVO) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int updateCnt = lidao.loanreturn(bloanVO);
		
		return updateCnt;
	}


	//도서 반납,연장
	@Override
	public int loanrenew(BookLoanVO bloanVO) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int updateCnt = lidao.loanrenew(bloanVO);
		
		return updateCnt;
	}

	
	
	//도서 검색
	@Override
	public ArrayList<BookVO> booksearch(Map<String, Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<BookVO> bVOs = lidao.booksearch(map);
		
		return bVOs;
	}


	
	//전체 좌석 보기
	@Override
	public ArrayList<SeatVO> viewSeat(String rdRoom_no) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<SeatVO> sVOs = lidao.viewSeat(rdRoom_no);
	
		return sVOs;
	}


	//좌석 이용 등록
	@Override
	public int seatinsert(SeatVO sVO) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int insertCnt = lidao.seatinsert(sVO);
	
		return insertCnt;
	}
		
		
	//좌석 업데이트
	@Override
	public int seatupdate(SeatVO sVO) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int updateCnt = lidao.seatupdate(sVO);
	
		return updateCnt;
	}


	//중복 유저 확인
	@Override
	public int seatUserCnt(String user_no) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int selectCnt = lidao.seatUserCnt(user_no);
	
		return selectCnt;
	}
	
	
	//한 좌석 정보 보기
	@Override
	public SeatVO seatOne(Map<String,Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		SeatVO sVO = lidao.seatOne(map);
	
		return sVO;
	}

	
	//이용 중 좌석 정보조회
	@Override
	public SeatVO seatUser(Map<String,Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		SeatVO sVO = lidao.seatUser(map);
	
		return sVO;
	}
	
	//최근 대여일 
	@Override
	public BookLoanVO loanlistlast(Map<String, Object> map) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		BookLoanVO laonVO = lidao.loanlistlast(map);
	
		return laonVO;
	}


	//마이 라이브러리 - 대여 개수
	@Override
	public int myloanCnt(String user_no) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		int loancnt = lidao.myloanCnt(user_no);
	
		return loancnt;
	}


	//마이 라이브러리 - 대여 목록
	@Override
	public ArrayList<BookLoanVO> myloan(String user_no) {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<BookLoanVO> bloanVOs = lidao.myloan(user_no);
	
		return bloanVOs;
	}


	//도서 현황 : 카테고리별 도서 개수
	@Override
	public ArrayList<SituationVO> bookCateSum() {
		LIDAO lidao = sqlSession.getMapper(LIDAO.class);
		ArrayList<SituationVO> bookcateCnt = lidao.bookCateSum();
	
		return bookcateCnt;
	}


}
