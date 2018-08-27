package com.spring.projectFinal.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.projectFinal.CIVO.MajorVO;
import com.spring.projectFinal.persistence.CIDAO;



@Service
public class CIServiceImpl implements CIService{
	@Autowired
	CIDAO dao;
	
	@Override
	public void getMajorList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 10; // 한페이지당 출력할 글 개수
		int pageBlock = 5; // 한 블럭당 페이지 개수
		int cnt = 0; // 전체 글 개수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0;
		
		cnt = dao.getMajorCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert할것
		pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1

		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		end = start + pageSize - 1; // 현재 페이지 끝번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		ArrayList<MajorVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getMajorList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		// 글 개수 구하기
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		

	}

	@Override
	public void getMajor(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int maj_cd = Integer.parseInt(req.getParameter("maj_cd"));
		int pageNum = 1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
			System.out.println("pageNum : " + pageNum);
		}
		 
		MajorVO vo = null;
		vo = dao.getMajor(maj_cd);

		model.addAttribute("vo", vo);
		model.addAttribute("maj_cd", maj_cd);
		model.addAttribute("pageNum", pageNum);
	}

	@Override
	public void modifyMajor(HttpServletRequest req, Model model) {		
		int pageNum = 1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
			System.out.println("pageNum : " + pageNum);
		}
		
		int maj_cd = Integer.parseInt(req.getParameter("maj_cd"));
		int maj_cnt = Integer.parseInt(req.getParameter("maj_cnt"));
		String maj_info = req.getParameter("maj_info");
		int maj_tuition = Integer.parseInt(req.getParameter("maj_tuition"));
		String prof_no = req.getParameter("prof_no");
		MajorVO vo = new MajorVO();
		vo.setMaj_cd(maj_cd);
		vo.setMaj_cnt(maj_cnt);
		vo.setMaj_info(maj_info);
		vo.setMaj_tuition(maj_tuition);
		vo.setProf_no(prof_no);
		
		int updateCnt = dao.modifyMajor(vo);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void addMajor(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int maj_cd = Integer.parseInt(req.getParameter("maj_cd"));
		int maj_office_no = Integer.parseInt(req.getParameter("maj_office_no"));
		int maj_cnt = Integer.parseInt(req.getParameter("maj_cnt"));
		String maj_info = req.getParameter("maj_info");
		int maj_tuition = Integer.parseInt(req.getParameter("maj_tuition"));
		String prof_no = req.getParameter("prof_no");
		
		MajorVO vo = new MajorVO();
		vo.setMaj_cd(maj_cd);
		vo.setMaj_cnt(maj_cnt);
		vo.setMaj_info(maj_info);
		vo.setMaj_office_no(maj_office_no);
		vo.setMaj_tuition(maj_tuition);
		vo.setProf_no(prof_no);
		
		int insertCnt = dao.addMajor(vo);
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void deleteMajor(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int maj_cd = Integer.parseInt(req.getParameter("maj_cd"));
		
		int deleteCnt = dao.deleteMajor(maj_cd);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	
}
