package com.spring.projectFinal.service;


import com.spring.projectFinal.CLVO.CyberAttendanceVO;
import com.spring.projectFinal.CLVO.CyberLecNoticeVO;
import com.spring.projectFinal.CLVO.CyberNoticeVO;
import com.spring.projectFinal.CLVO.LectureVO;
import com.spring.projectFinal.CLVO.RoundVO;
import com.spring.projectFinal.persistence.CLDAO;
import com.xuggle.xuggler.IContainer;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;




@Service
public class CLServiceImpl implements CLService{

	@Autowired
	CLDAO dao;
	
	//동영상 추가
	@Override
	public void addRound(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		MultipartFile file = req.getFile("lectureVideo");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		//파일명이 중복되지않도록 파일명 뒤에 날짜를 붙여준다
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="C:\\Dev36\\workspace_final2\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	        	//파일업로드 부분
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            //IContainer를 이용하여 업로드한 동영상의 길이를 구한다
	            IContainer container = IContainer.make();
	            int result = container.open(saveDir + fileName, IContainer.Type.READ, null);
	            long duration = container.getDuration();
	            long fileSize = container.getFileSize();
	            
	            
	            //강의 번호
	            int lec_no = Integer.parseInt(req.getParameter("lec_no"));
	            //수업 주차
	            int round_no = Integer.parseInt(req.getParameter("round_no"));
	            //수업명
	            String round_name = req.getParameter("round_name");
	            //파일명
	            String file_name = fileName;
	            //파일길이
	            long file_len = duration/1000000;
	            
	            RoundVO vo = new RoundVO();
	            vo.setLec_no(lec_no);
	            vo.setRound_no(round_no);
	            vo.setRound_name(round_name);
	            vo.setFile_name(file_name);
	            vo.setFile_len(file_len);
	                       
	            //추가
	            int insertCnt = dao.addRound(vo);
	            
	            model.addAttribute("insertCnt", insertCnt);
	            model.addAttribute("lec_no",lec_no);
	            System.out.println("duration : " + duration);
	            System.out.println("time : " + file_len + "초");
	            System.out.println("fileSize : " + fileSize);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}

	@Override
	public void downloadFile(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String saveDir = req.getRealPath("/resources/video/");
        String filename = req.getParameter("fileName");
        
        File file = new File(saveDir + filename);
        
//        resp.setContentType("aplication/octet-stream");        // download 동일
        res.setContentType("application/download");
        res.setContentLength((int) file.length());
        //res.setContentLengthLong(file.length());
        
        // 모든 브라우저가 지원
        filename = URLEncoder.encode(filename, "utf-8").replace("+", "%20").replace("(", "%28").replace(")", "%29");
        
        // 익스플로러는 지원 안됨
//        originFileName = new String(originFileName.getBytes("utf-8"), "iso-8859-1").replace("+", "%20");
 
        // Content-Disposition: form-data; name="fileName"; filename="파일명"
        res.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
        
        PrintWriter out = res.getWriter();
        FileInputStream fis = null;
        
        try {
            int temp;
            fis = new FileInputStream(file);
            while((temp = fis.read()) != -1) {
                out.write(temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(fis != null) {
                try {
                    fis.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
            if(out != null) out.close();
        }


	}

	@Override
	public void addLecNotice(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int insertCnt = 0;
		MultipartFile file = req.getFile("attFile");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="C:\\Dev36\\git\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            CyberLecNoticeVO vo = new CyberLecNoticeVO();
	            int lec_no = Integer.parseInt(req.getParameter("lec_no"));
	            vo.setLec_no(lec_no);
	            vo.setCy_lec_n_title(req.getParameter("title"));
	            vo.setCy_lec_n_content(req.getParameter("content"));
	            vo.setProf_no((String)req.getSession().getAttribute("id"));
	            vo.setCy_lec_n_dt(new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime()));
	            vo.setCy_lec_n_file(fileName);
	            vo.setCy_lec_n_cnt(0);
				
				Map<String, Object> map = new HashMap<>();
				map.put("vo", vo);
				insertCnt = dao.addLecNotice(map);
				
				model.addAttribute("lec_no", lec_no);
				model.addAttribute("insertCnt", insertCnt);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}

	@Override
	public void getLecNoticeList(HttpServletRequest req, Model model) {
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
		
		int lec_no = 0;
		
		Map<String,Object> map = new HashMap<>();
		if(req.getParameter("lec_no")!=null) {
			lec_no = Integer.parseInt(req.getParameter("lec_no"));
		}
		map.put("lec_no", lec_no);
		cnt = dao.getLecNoticeCnt(map);
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재페이지 1
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지있으면 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호
		end = start + pageSize - 1; // 현재 페이지 끝번호

		if (end > cnt)
			end = cnt;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호

		ArrayList<CyberLecNoticeVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
						
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getLecNoticeList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

		// 글 개수 구하기
		model.addAttribute("lec_no",lec_no);
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
	public void getLecNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int num= Integer.parseInt(req.getParameter("num"));
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		int pageNum=1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		CyberLecNoticeVO vo = dao.getLecNotice(num);
		
		Map<String,Object> map =new HashMap<String,Object>();
		
		int cnt=vo.getCy_lec_n_cnt()+1;
		
		map.put("num", num);
		map.put("cnt", cnt);
		
		dao.updateCnt2(map);
		
		model.addAttribute("vo", vo);
		model.addAttribute("lec_no", lec_no);
		model.addAttribute("pageNum", pageNum);
	}

	@Override
	public void getLecList(HttpServletRequest req, Model model) {
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
		
		Map<String, Object> map = new HashMap<>();
		
		String id = (String) req.getSession().getAttribute("id");
		if(id != null) {
			if(id.substring(0, 1).equals("0")) {
				map.put("adminId", id);
			}else if(id.substring(0, 1).equals("1")) {
				map.put("profId", id);
			}else if(id.substring(0, 1).equals("2")) {
				map.put("studentId", id);
			}
		}
		cnt = dao.getLecCnt(map);
		
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

		ArrayList<LectureVO> dtos = null;
		HashMap<Integer, Integer> lecPersonCnt = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			
			
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getLecList(map);

			lecPersonCnt = new HashMap<>();
			for (LectureVO vo : dtos) {
				lecPersonCnt.put(vo.getLec_no(), dao.getLecPersonCnt(vo.getLec_no()));
			}
			model.addAttribute("lecPersonCnt", lecPersonCnt);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1; // 마지막 페이지

		if (endPage > pageCount)
			endPage = pageCount;

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
	public void addNotice(MultipartHttpServletRequest req, Model model) {
		int insertCnt = 0;
		MultipartFile file = req.getFile("attFile");
		String saveDir = req.getRealPath("/resources/video/"); //저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
        String fileName = "";
        if(!file.isEmpty()) {
        	String getFileName[] = file.getOriginalFilename().split("\\.");
        	fileName = getFileName[0] + "_" + sdf.format(c.getTime()) + "." +getFileName[1];
        }
        
		
        String realDir="C:\\Dev36\\git\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\video\\"; // 저장 경로
        try {
	        if(!file.isEmpty()) {
	        	file.transferTo(new File(saveDir+fileName));
	            
	            FileInputStream fis = new FileInputStream(saveDir + fileName);
	            FileOutputStream fos = new FileOutputStream(realDir + fileName);
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
	            

	            CyberNoticeVO vo = new CyberNoticeVO();
	            vo.setCy_n_title(req.getParameter("title"));
	            vo.setCy_n_content(req.getParameter("content"));
	            vo.setAd_no((String)req.getSession().getAttribute("id"));
	            vo.setCy_n_dt(new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime()));
	            vo.setCy_n_file(fileName);
	            vo.setCy_n_cnt(0);
				
				Map<String, Object> map = new HashMap<>();
				map.put("vo", vo);
				insertCnt = dao.addNotice(map);
				
				model.addAttribute("insertCnt", insertCnt);
	         
	        }		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}

	//온라인 전체 공지사항
	@Override
	public void getNoticeList(HttpServletRequest req, Model model) {
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
		
		//전체글 갯수
		cnt = dao.getNoticeCnt();
		System.out.println("cnt : " + cnt); 
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

		ArrayList<CyberNoticeVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<>();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);			
			dtos = dao.getNoticeList(map);
			
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
	public void getNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int num= Integer.parseInt(req.getParameter("num"));
		int pageNum=1;
		if(req.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		CyberNoticeVO vo = dao.getNotice(num);
		int cnt=vo.getCy_n_cnt()+1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("cnt",cnt);
		dao.updateCnt(map);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
		
	}

	@Override
	public void getRoundList(HttpServletRequest req, Model model) {
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
		int lec_no = 0;
		Map<String,Object> map = new HashMap<>();
		if(req.getParameter("lec_no")!=null) {
			lec_no = Integer.parseInt(req.getParameter("lec_no"));
		}
		map.put("lec_no", lec_no);
		cnt = dao.getRoundCnt(map);
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

		//수업목록을 담을 변수
		ArrayList<RoundVO> dtos = null;
		//해당 수업목록의 자신의 시청시간을 담을 변수
		Map<Integer,Object> watchTime = new HashMap<>();
		if (cnt > 0) {
			// 게시글 목록 조회
			map.put("start", start);
			map.put("end", end);
			
			//수업목록을 담는다
			dtos = dao.getRoundList(map);
			for(RoundVO dto : dtos) {	//가져온 수업목록에 해당하는 시청시간을 담아온다
				CyberAttendanceVO vo = new CyberAttendanceVO();
				map = new HashMap<>();
				map.put("lec_no", dto.getLec_no());
				System.out.println("dto.getLec_no : " + dto.getLec_no());
				map.put("round_no", dto.getRound_no());
				System.out.println("dto.getRound_no : " + dto.getRound_no());
				map.put("st_no", (String)req.getSession().getAttribute("id"));
				
				//lec_no와 round_no, st_no을 가지고 시청시간을 담아온다
				vo = dao.getCyAttendance(map);
				if(vo!=null) {
					watchTime.put(dto.getRound_no(), vo.getWatch_time());
				}
				
			}
			model.addAttribute("watchTime", watchTime);
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
		model.addAttribute("lec_no",lec_no);
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


	//온라인 출석
	@Override
	public void updateCyAttendance(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int selectCnt = 0;	//처음 시청인지 확인하는 변수
		int insertCnt = 0;	//처음 시청시 값을 저장하고 결과를 받을 변수
		int updateCnt = 0;	//반복 시청시 값을 변경하고 결과를 받을 변수
		
		//과목번호
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		//수업 목차
		int round_no = Integer.parseInt(req.getParameter("round_no"));
		//시청시간
		long watch_time = Long.parseLong(req.getParameter("time"));
		//학생 id
		String st_no = (String)req.getSession().getAttribute("id");
		//현재시간(최종 변경일자)
		Date watch_dt = new java.sql.Date(new Timestamp(System.currentTimeMillis()).getTime());
		
		//출석vo생성
		CyberAttendanceVO vo = new CyberAttendanceVO();
		
		//과목번호
		vo.setLec_no(lec_no);
		//수업목차
		vo.setRound_no(round_no);
		//시청시간
		vo.setWatch_time(watch_time);
		//학생번호
		vo.setSt_no(st_no);
		//최종 변경일자
		vo.setWatch_dt(watch_dt);
		
		//해당 수업을 시청한 적이 있는지 확인
		selectCnt = dao.checkCyAttendance(vo);	
		if(selectCnt>0) {	//시청한 적이 있다면
			//시간 업데이트
			updateCnt = dao.updateCyAttendance(vo);
			model.addAttribute("updateCnt", updateCnt);
		}else {	//없다면
			//새로 추가
			insertCnt = dao.insertCyAttendance(vo);
			model.addAttribute("insertCnt", insertCnt);
		}
		model.addAttribute("lec_no", lec_no);
		model.addAttribute("watch_time", watch_time);
		model.addAttribute("selectCnt", selectCnt);
	}

	@Override
	public void updateNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int updateCnt = 0;
		String numStr = req.getParameter("num");
		int num = 0;
		if(numStr!=null) {
			num = Integer.parseInt(numStr);
		}
		CyberNoticeVO vo = new CyberNoticeVO();
        vo.setCy_n_title(req.getParameter("title"));
        vo.setCy_n_content(req.getParameter("content"));
        
		
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("num", num);
		updateCnt = dao.updateNotice(map);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void deleteNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int deleteCnt = 0;
		String numStr = req.getParameter("num");
		int num = 0;
		if(numStr!=null) {
			num = Integer.parseInt(numStr);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		deleteCnt = dao.deleteNotice(map);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void updateLecNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int updateCnt = 0;
		String numStr = req.getParameter("num");
		int num = 0;
		if(numStr!=null) {
			num = Integer.parseInt(numStr);
		}
		CyberLecNoticeVO vo = new CyberLecNoticeVO();
        vo.setCy_lec_n_title(req.getParameter("title"));
        vo.setCy_lec_n_content(req.getParameter("content"));
        
		
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("num", num);
		updateCnt = dao.updateLecNotice(map);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void deleteLecNotice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int deleteCnt = 0;
		String numStr = req.getParameter("num");
		int num = 0;
		if(numStr!=null) {
			num = Integer.parseInt(numStr);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		deleteCnt = dao.deleteLecNotice(map);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	
	
	
}
