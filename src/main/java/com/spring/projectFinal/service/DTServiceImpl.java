package com.spring.projectFinal.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;
import com.spring.projectFinal.DTVO.Admin_notice_selectVO;
import com.spring.projectFinal.DTVO.Admin_stu_selectVO;
import com.spring.projectFinal.DTVO.AraCircleVO;
import com.spring.projectFinal.DTVO.Dt_stu_overnight_selectVO;
import com.spring.projectFinal.DTVO.Dt_stu_penalty_selectVO;
import com.spring.projectFinal.persistence.ARADAO;
import com.spring.projectFinal.persistence.DTDAOImpl;



@Service
public class DTServiceImpl implements DTService{

	@Autowired
	DTDAOImpl dao;
	
	@Autowired
	ARADAO aradao;
	

	// 학생 서비스	
	//학생 외박 조회
	@Override
	public void dtStuOVERNightSelect(HttpServletRequest req, Model model) {	
		
		String st_no = req.getParameter("st_no");
		System.out.println(st_no);
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = dao.dtStuOvernightCnt(st_no);
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("st_no", st_no);
			ArrayList<Dt_stu_overnight_selectVO> dtos = dao.dtStuNightSelect(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지		
		}			
			
	}	
	
	// 학생 외박 신청
	@Override
	public void dtStuNightInsert(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");

		String overnight_yy = req.getParameter("over_yy");
		String overnight_dd = req.getParameter("over_dd");
		String overnight_mm = req.getParameter("over_mm");			
		if(overnight_dd.length()<2) {
			overnight_dd = "0" + overnight_dd;
		}
		if(overnight_mm.length()<2) {
			overnight_mm = "0" + overnight_mm;
		}
		String dorm_ex_date = overnight_yy +"-"+ overnight_mm +"-"+ overnight_dd;		
		java.sql.Date dorm_ex_dt = java.sql.Date.valueOf(dorm_ex_date);
		System.out.println(dorm_ex_dt);
		
	   /*vo.setReservationTime(Date.valueOf(req.getParameter("reservationTime")));*/
		String textarea = req.getParameter("dorm_reason");
		System.out.println(textarea);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no", st_no);
		map.put("dorm_ex_dt", dorm_ex_dt);
		map.put("textarea", textarea);
		
		int insertCnt = dao.dtStuNightInsert(map);
		model.addAttribute("st_no",st_no);
		model.addAttribute("insertCnt",insertCnt);		
		
	}
	
	// 학생 외박 수정 목록 뿌리기
	@Override
	public void dtStuNightupd(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		String overnight_no = req.getParameter("overnight_no");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no", st_no);
		map.put("overnight_no", overnight_no);
		
		Dt_stu_overnight_selectVO dto = dao.dtStuNightupd(map);
		/*ArrayList<Dt_stu_overnight_selectVO> dtos = dao.dtStuNightUpdate(st_no);*/
		model.addAttribute("dto",dto);		
	}	

	// 학생 외박 수정 등록
	@Override
	public void dtStuNightrevision(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		int overnight_no = Integer.parseInt(req.getParameter("overnight_no"));
		String overnight_yy = req.getParameter("over_yy");
		String overnight_dd = req.getParameter("over_dd");
		String overnight_mm = req.getParameter("over_mm");			
		if(overnight_dd.length()<2) {
			overnight_dd = "0" + overnight_dd;
		}
		if(overnight_mm.length()<2) {
			overnight_mm = "0" + overnight_mm;
		}
		String dorm_ex_date = overnight_yy +"-"+ overnight_mm +"-"+ overnight_dd;		
		java.sql.Date dorm_ex_dt = java.sql.Date.valueOf(dorm_ex_date);
		
	   /*vo.setReservationTime(Date.valueOf(req.getParameter("reservationTime")));*/
		String dorm_reason = req.getParameter("dorm_reason");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no", st_no);
		map.put("overnight_no", overnight_no);
		map.put("dorm_ex_dt", dorm_ex_dt);
		map.put("dorm_reason", dorm_reason);

		int updateCnt = dao.dtStuNightrevision(map);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}
	
	// 학생 외박 신청 삭제 PWD
	@Override
	public void dtStuNightDeletePwd(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("pwd");
		
		ArrayList<Dt_stu_overnight_selectVO> dtos = dao.dtStuNightDeletePwd(st_no);
		
		model.addAttribute("dtos",dtos);	
	}	

	// 학생 외박 신청 삭제 처리
	@Override
	public void dtStuNightDeletelist(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		String overnight_no = req.getParameter("overnight_no");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("st_no", st_no);
		map.put("overnight_no", overnight_no);
	
		int deleteCnt = dao.dtStuNightDeletelist(map);
		
		model.addAttribute("deleteCnt",deleteCnt);
	}	
	
	// 학생 벌점 조회
	@Override
	public void dtStuPenalty(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.dtStuPenaltyCnt(st_no);
		System.out.println("cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("st_no", st_no);
			ArrayList<Dt_stu_penalty_selectVO> dtos = dao.dtStuPenalty(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지		
		}	
	
	}
	
	// 학생 공지사항 조회
	@Override
	public void dtStuNotice(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.getDormNoticeCnt();
		System.out.println("cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Admin_notice_selectVO> dtos = dao.getDormNotice(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}
	}
		
	// 학생 공지사항 상세조회	
	@Override
	public void dtStuNoticeSelect(HttpServletRequest req, Model model) {
		int dorm_n_no = Integer.parseInt(req.getParameter("num"));
		int dorm_n_cnt = Integer.parseInt(req.getParameter("cnt"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("dorm_n_cnt", dorm_n_cnt);
		map.put("dorm_n_no", dorm_n_no);
		
		// 관리자 제목 클릭시 조회수 증가
		int updateCnt = dao.getDormNoticeCntUp(map);
		
		System.out.println("updateCnt" + updateCnt);

		Admin_notice_selectVO dto = dao.getDormNoticeDetail(dorm_n_no);
		System.out.println(dto.getDorm_n_no());
		model.addAttribute("dto",dto);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("number",number);		
		
	}

	// 학생 기숙사 정보 조회
	@Override
	public void dtStuSelect(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		
		Admin_stu_selectVO dto = dao.dtStuSelect(st_no);
		
		model.addAttribute("dto",dto);
	}
	
	
	// ara 동아리 목록 출력
	@Override
	public void circleSelect(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.getCircleListCnt();
		System.out.println(cnt);
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<AraCircleVO> dtos = dao.getCircleList(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}
		
	}	
	
	// ara 동아리 수정 목록 클릭
	@Override
	public void araCircleBefore(HttpServletRequest req, Model model) {
		String cc_name = req.getParameter("cc_name");
		
		ArrayList<AraCircleVO> dtos = dao.araCircleBefore(cc_name);
		
		model.addAttribute("dtos",dtos);
	}	
	
	// ara 관리자 동아리 수정 등록
	@Override
	public void araCircleAfter(HttpServletRequest req, Model model) {
		String cc_name = req.getParameter("cc_name");
		String prof_no = req.getParameter("prof_no");
		String cc_loc = req.getParameter("cc_loc");
		String cc_content = req.getParameter("cc_content");
		
		System.out.println(cc_name);
		System.out.println(prof_no);
		System.out.println(cc_loc);
		System.out.println(cc_content);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cc_name", cc_name);
		map.put("prof_no", prof_no);
		map.put("cc_loc", cc_loc);
		map.put("cc_content", cc_content);
		
		int updateCnt = dao.araCircleAfter(map);
	
		model.addAttribute("updateCnt",updateCnt);
	}	
	
	// ara 관리자 동아리 목록 삭제
	@Override
	public void araCircleDelete(HttpServletRequest req, Model model) {
		String cc_name = req.getParameter("cc_name");
		
		int deleteCnt = dao.araCircleDelete(cc_name);
		
		model.addAttribute("deleteCnt",deleteCnt);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 관리자 로그인
	public void dormitory_login(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		System.out.println("login");
		int selectCnt = 0;
		
		String id = req.getParameter("userId");
		String pwd = req.getParameter("passwd");
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		if(id.substring(0, 1).equals("0")) {
			AdminVO vo = new AdminVO();
			vo = dao.getAdminInfo1(map);
			if(vo!=null) {
				System.out.println("AdminVO");
				req.getSession().setAttribute("id", id);
				req.getSession().setAttribute("name", vo.getAd_name());
			}
		}else if(id.substring(0, 1).equals("1")) {
			ProfessorVO vo = new ProfessorVO();
			vo = dao.getProfInfo1(map);
			if(vo!=null) {
				System.out.println("ProfessorVO");
				req.getSession().setAttribute("id", id);
				req.getSession().setAttribute("name", vo.getProf_name());
			}
		}else if(id.substring(0, 1).equals("2")) {
			StudentVO vo = new StudentVO();
			vo = dao.getStudentInfo1(map);
			if(vo!=null) {
				System.out.println("StudentVO");
				req.getSession().setAttribute("id", id);
				req.getSession().setAttribute("name", vo.getSt_name());
			}
		}else {
			req.getSession().setAttribute("id", null);
		}
			
		model.addAttribute("selectCnt", selectCnt);
	}	
	
	
	
	
	//관리자 로그인
	@Override
	public void dtAdminLogin(HttpServletRequest req, Model model) {
		//로그인 화면에서 입력받은 값 받아온다.
		String id = req.getParameter("userId");
		String pwd = req.getParameter("userPassword");
		System.out.println("service" + id);
		System.out.println("service"+ pwd);
		
		//입력 받은 값 Map 으로 dao 넘긴다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("pwd", pwd);
		
		int selectCnt = dao.dtAdminLogin(map);
		System.out.println("service3"+selectCnt);
		model.addAttribute("selectCnt",selectCnt);
	}

	// 관리자 기숙사 학생 정보 조회
	@Override
	public void getDormStInfoLiDormSt(HttpServletRequest req, Model model) {
		// 게시판 관련
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//5단계. 글갯수 구하기
		cnt = dao.getDormStInfoCnt();
		System.out.println("cnt" + cnt);	

		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 설정
		}		
		
		// 건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);		
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호		
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Admin_stu_selectVO> dtos = dao.getDormStInfoLiDormSt(map);
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지		
		}
		
	}

	// 관리자 기숙사 학생 등록
	@Override
	public void addDormStInfo(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		int dorm_room = Integer.parseInt(req.getParameter("dorm_room"));		
		String dorm_st = req.getParameter("dorm_st_dt");
		String dorm_end = req.getParameter("dorm_end_dt");
		
		java.sql.Date dorm_st_dt = java.sql.Date.valueOf(dorm_st);	
		java.sql.Date dorm_end_dt = java.sql.Date.valueOf(dorm_end);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("st_no", st_no);
		map.put("dorm_room", dorm_room);
		map.put("dorm_st_dt", dorm_st_dt);
		map.put("dorm_end_dt", dorm_end_dt);
		
	int insertCnt = dao.addDormStInfo(map);
	System.out.println(insertCnt);	
	
	model.addAttribute("insertCnt",insertCnt);
	}

	// 관리자 기숙사 학생 수정
	@Override
	public void dtAdminStuUpdate(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		int dorm_room = Integer.parseInt(req.getParameter("dorm_room"));
		String dorm_st = req.getParameter("dorm_st_dt");
		String dorm_end = req.getParameter("dorm_end_dt");
		java.sql.Date dorm_st_dt = java.sql.Date.valueOf(dorm_st);
		java.sql.Date dorm_end_dt = java.sql.Date.valueOf(dorm_end);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("st_no", st_no);
		map.put("dorm_room", dorm_room);
		map.put("dorm_st_dt", dorm_st_dt);
		map.put("dorm_end_dt", dorm_end_dt);
		
		int updateCnt = dao.dtAdminStuUpdate(map);
		model.addAttribute("updateCnt",updateCnt);
	}	
	
	// 관리자 공지사항 조회
	@Override
	public void getDormNoticeList(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.getDormNoticeCnt();
		System.out.println("cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Admin_notice_selectVO> dtos = dao.getDormNotice(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호
				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}
	}

	// 관리자 공지사항 제목 상세페이지
	@Override
	public void getDormNoticeDetail(HttpServletRequest req, Model model) {
		int dorm_n_no = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		int dorm_n_cnt = Integer.parseInt(req.getParameter("cnt"));
		
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("dorm_n_cnt", dorm_n_cnt);
		map.put("dorm_n_no", dorm_n_no);
		
		// 관리자 제목 클릭시 조회수 증가
		int updateCnt = dao.getDormNoticeCntUp(map);
		
		System.out.println("updateCnt" + updateCnt);

		Admin_notice_selectVO dto = dao.getDormNoticeDetail(dorm_n_no);
		System.out.println(dto.getDorm_n_no());
		model.addAttribute("dto",dto);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("number",number);		
	}

	// 관리자 공지사항 수정
	@Override
	public void updateDormNotice(HttpServletRequest req, Model model) {
		int dorm_n_no = Integer.parseInt(req.getParameter("dorm_n_no"));
		String ad_no = req.getParameter("ad_no");
		
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("dorm_n_no", dorm_n_no);
		map.put("ad_no", ad_no);		
		
		Admin_notice_selectVO dto = dao.updateDormNotice(map);
		
		model.addAttribute("dto",dto);
	}

	// 관리자 공지사항 수정 등록 
	@Override
	public void updateDormNoticeCon(HttpServletRequest req, Model model) {		
		int dorm_n_no = Integer.parseInt(req.getParameter("dorm_n_no"));
		String ad_no = req.getParameter("ad_no");
		String dorm_n_title = req.getParameter("dorm_n_title");
		String dorm_n_content = req.getParameter("dorm_n_content");
		
		System.out.println(dorm_n_no);
		System.out.println(ad_no);
		System.out.println(dorm_n_title);
		System.out.println(dorm_n_content);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("dorm_n_no", dorm_n_no);
		map.put("ad_no", ad_no);
		map.put("dorm_n_title", dorm_n_title);
		map.put("dorm_n_content", dorm_n_content);
		
		int updateCnt = dao.updateDormNoticeCon(map);
		
		model.addAttribute("updateCnt",updateCnt);
				
	}

	// 관리자 공지사항 등록
	@Override
	public void addDormNotice(HttpServletRequest req, Model model) {
		Admin_notice_selectVO dto = new Admin_notice_selectVO();
		
		dto.setAd_no(req.getParameter("ad_no"));
		dto.setDorm_n_title(req.getParameter("dorm_n_title"));
		dto.setDorm_n_content(req.getParameter("dorm_n_content"));
		
		int insertCnt = dao.addDormNotice(dto);
		
		model.addAttribute("insertCnt",insertCnt);
	}

	// 관리자 벌점 조회 
	@Override
	public void dtAdminPenaltySel(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.getDormPenaltyCnt();
		System.out.println("cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Dt_stu_penalty_selectVO> dtos = dao.getDormPenalty(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) 
			startPage -= pageBlock;
		
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) 
		   endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호

				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}
	}

	// 관리자 벌점 수정 클릭
	@Override
	public void dtAdminPenaltyUp(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		String dorm_dt = req.getParameter("dorm_penalty_dt");
		java.sql.Date dorm_penalty_dt = java.sql.Date.valueOf(dorm_dt);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no",st_no);
		map.put("dorm_penalty_dt",dorm_penalty_dt);	
		
		Dt_stu_penalty_selectVO dto = dao.dtAdminPenaltyUp(map);
		model.addAttribute("dto",dto);
	}	
	
	// 관리자 벌점 등록
	@Override
	public void addPenaltyInsert(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		int dorm_penalty = Integer.parseInt(req.getParameter("dorm_penalty"));
		String penalty_yy = req.getParameter("penalty_yy");
		String penalty_dd = req.getParameter("penalty_dd");
		String penalty_mm = req.getParameter("penalty_mm");			
		if(penalty_dd.length()<2) {
			penalty_dd = "0" + penalty_dd;
		}
		if(penalty_mm.length()<2) {
			penalty_mm = "0" + penalty_mm;
		}		
		String penalty_dt = penalty_yy +"-"+ penalty_mm +"-"+ penalty_dd;		
		java.sql.Date dorm_penalty_dt = java.sql.Date.valueOf(penalty_dt);
		String textarea = req.getParameter("dorm_reason");		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no",st_no);
		map.put("dorm_penalty",dorm_penalty);
		map.put("dorm_penalty_dt",dorm_penalty_dt);
		map.put("textarea",textarea);

		int insertCnt = dao.addPenaltyInsert(map);
		model.addAttribute("insertCnt",insertCnt);		
	}

	// 관리자 벌점 수정 목록
	@Override
	public void selectPenalty(HttpServletRequest req, Model model) {
		ArrayList<Dt_stu_penalty_selectVO> dtos = dao.selectPenalty();
		
		model.addAttribute("dtos",dtos);
		
	}

	// 관리자 벌점 수정 이름 클릭
	@Override
	public void updatePenalty(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		int dorm_penalty = Integer.parseInt(req.getParameter("dorm_penalty"));
		String dorm_reason = req.getParameter("dorm_reason");
		String penalty_yy = req.getParameter("penalty_yy");
		String penalty_dd = req.getParameter("penalty_dd");
		String penalty_mm = req.getParameter("penalty_mm");			
		if(penalty_dd.length()<2) {
			penalty_dd = "0" + penalty_dd;
		}
		if(penalty_mm.length()<2) {
			penalty_mm = "0" + penalty_mm;
		}
		String penalty_dt = penalty_yy +"-"+ penalty_mm +"-"+ penalty_dd;		
		java.sql.Date dorm_penalty_dt = java.sql.Date.valueOf(penalty_dt);		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("st_no", st_no);
		map.put("dorm_penalty", dorm_penalty);
		map.put("dorm_penalty_dt", dorm_penalty_dt);
		map.put("dorm_reason", dorm_reason);
		
		int updateCnt = dao.updatePenalty(map);
		
		model.addAttribute("updateCnt",updateCnt);
	}

	// 관리자 외박신청 목록
	@Override
	public void dtAdminOvernight(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		cnt = dao.getDormOvernightCnt();
		System.out.println("FL 1 cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Dt_stu_overnight_selectVO> dtos = dao.getDormOvernightList(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) 
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) 
		   endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호

				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}		
		
	}

	// 관리자 외박 신청 승인
	@Override
	public void dtAdminOvernightIns(HttpServletRequest req, Model model) {
		String st_no = req.getParameter("st_no");
		String dorm_dt = req.getParameter("dorm_ex_dt");
		java.sql.Date dorm_ex_dt = java.sql.Date.valueOf(dorm_dt);
		
		System.out.println(st_no);
		System.out.println(dorm_ex_dt);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("st_no", st_no);
		map.put("dorm_ex_dt", dorm_ex_dt);
		
		int updateCnt = dao.dtAdminOvernightIns(map);
		System.out.println("외박승인"+updateCnt);
		model.addAttribute("updateCnt",updateCnt);
	}

	// 관리자 외박 신청 승인 목록 조회
	@Override
	public void dtAdminOvernightSel(HttpServletRequest req, Model model) {
		int pageSize = 7;		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0 ;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		//5단계. 글갯수 구하기
		cnt = dao.getDormOvernightSelect();
		System.out.println("cnt : "+cnt);	// 테이블에 30건을 insert 할것
		
		pageNum = req.getParameter("pageNum");
		if(req.getParameter("pageNum") == null) {
			pageNum = "1";
		}		
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : "+currentPage);
		
		// 페이지 갯수 계산
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1:0);
		
		start = (currentPage - 1) * pageSize + 1;	// 현재 페이지 시작번호
		end = start + pageSize - 1;					// 현재 페이지 끝번호
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		if(end > cnt) end = cnt;
		
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		 
		System.out.println("number : "+number);
		System.out.println("pageSize : "+pageSize);
		
		//6단계. request나 session으로 처리 결과 저장
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Dt_stu_overnight_selectVO> dtos = dao.getDormOvernightSelectList(map); 
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// 시작 페이지
		if(currentPage % pageBlock == 0) 
			startPage -= pageBlock;
		
		System.out.println("startPage : "+startPage);
		System.out.println("pageBlock : "+pageBlock);
		
		endPage = startPage + pageBlock - 1;	// 마지막 페이지
		if(endPage > pageCount) 
		   endPage = pageCount;	
		
		model.addAttribute("cnt",cnt);			// 글갯수
		model.addAttribute("number",number);		// 글번호
		model.addAttribute("pageNum",pageNum);	// 페이지 번호

				
		if(cnt > 0) {			
			model.addAttribute("startPage",startPage);	// 시작 페이지
			model.addAttribute("endPage",endPage);		// 마지막 페이지
			model.addAttribute("pageBlock",pageBlock);	// 출력할 페이지 갯수
			model.addAttribute("pageCount",pageCount);	// 페이지 갯수
			model.addAttribute("currentPage",currentPage);// 현재 페이지
		}	
		
	}










}
