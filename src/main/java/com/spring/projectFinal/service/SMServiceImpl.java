package com.spring.projectFinal.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.projectFinal.SMVO.ApplicationVO;
import com.spring.projectFinal.SMVO.Attend_Lec_VO;
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
import com.spring.projectFinal.persistence.SM2DAO;
import com.spring.projectFinal.persistence.SMDAO;

@Service
public class SMServiceImpl implements SMService {

	@Autowired
	SMDAO dao;
	
	@Autowired
	SM2DAO dao2;

	// 중복확인
	@Override
	public int juminChk(HttpServletRequest req, Model model) {

		String REGI_NO = "";
		String REGI_NO1 = req.getParameter("REGI_NO1");
		String REGI_NO2 = req.getParameter("REGI_NO2");
		if (!REGI_NO1.equals("") && !REGI_NO2.equals("")) {
			REGI_NO = REGI_NO1 + "-" + REGI_NO2;
		}

		int chkCnt = dao.juminChk(REGI_NO);
		model.addAttribute("chkCnt", chkCnt);
		return chkCnt;
	}

	@Override
	public void appPro(MultipartHttpServletRequest req, Model model) {

		ApplicationVO vo = new ApplicationVO();

		MultipartFile file = req.getFile("image");
		String saveDir = req.getRealPath("/resources/images/addmission_img/");
		String realDir = "C:\\Dev36\\git\\final_project\\SPRING_Project_Final\\src\\main\\webapp\\resources\\images\\addmission_img\\";

		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			// 객체에 입력받은 값 저장
			vo.setEnt_name(req.getParameter("name"));

			String REGI_NO = "";
			String REGI_NO1 = req.getParameter("REGI_NO1");
			String REGI_NO2 = req.getParameter("REGI_NO2");
			if (!REGI_NO1.equals("") && !REGI_NO2.equals("")) {
				REGI_NO = REGI_NO1 + "-" + REGI_NO2;
			}

			vo.setEnt_regi_no(REGI_NO);
			vo.setEnt_grade(Integer.parseInt(req.getParameter("grade")));
			vo.setEnt_highschool(req.getParameter("highSchool"));
			vo.setEnt_maj(req.getParameter("major"));

			String hp = "";
			String hp1 = req.getParameter("hp1");
			String hp2 = req.getParameter("hp2");
			String hp3 = req.getParameter("hp3");
			if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
				hp = hp1 + "-" + hp2 + "-" + hp3;
			}
			vo.setEnt_hp(hp);

			String email = "";
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			if (!email1.equals("") && !email2.equals("")) {
				email = email1 + "@" + email2;
			}
			vo.setEnt_email(email);
			vo.setEnt_zipcode(Integer.parseInt(req.getParameter("zipcode")));
			vo.setEnt_addr1(req.getParameter("address1"));
			vo.setEnt_addr2(req.getParameter("address2"));
			vo.setEnt_image(file.getOriginalFilename());

			int insertcnt = dao.applyMember(vo);

			// 디비 성공여부 저장
			model.addAttribute("insertcnt", insertcnt);
			System.out.println(insertcnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void applyList(HttpServletRequest req, Model model) {
		int cnt = 0; // 글 개수
		Map<String, Object> map = new HashMap<String, Object>();
		if (req.getParameter("major") != null) {
			int majorNum = Integer.parseInt(req.getParameter("major"));
			cnt = dao.getArticleCnt(majorNum);
			map.put("majorNum", majorNum);
			if (cnt > 0) { // 게시글 목록 조회
				ArrayList<ApplicationVO> dtos = dao.getArticleList(map);
				model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은 바구니 : 게시글 1건
			}
			model.addAttribute("major", majorNum);
			model.addAttribute("cnt", cnt);
		}
	}

	@Override
	public void recognize(HttpServletRequest req, Model model) {
		int majorNum = Integer.parseInt(req.getParameter("major"));
		int extra = Integer.parseInt(req.getParameter("extra")); 
		//추가 합격여부 extra:1 일반 합격 extra:2 추가합격
		if (extra == 1) {
			dao.recognizePass(majorNum);
			dao.recognizeFail(majorNum);
		}
		if (extra == 2) {
			dao.extraRecognizePass(majorNum);
		}
	}

	@Override
	public void applyPassList(HttpServletRequest req, Model model) {
		int cnt = 0; // 글 개수
		Map<String, Object> map = new HashMap<String, Object>();
		if (req.getParameter("major") != null) {
			int majorNum = Integer.parseInt(req.getParameter("major"));
			cnt = dao.getPassArticleCnt(majorNum);
			map.put("majorNum", majorNum);
			if (cnt > 0) { // 게시글 목록 조회
				ArrayList<ApplicationVO> dtos = dao.getPassArticleList(map);
				model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은 바구니 : 게시글 1건
			}
			model.addAttribute("cnt", cnt);
			model.addAttribute("major", majorNum);
		}
	}

	@Override
	public void applyExtraList(HttpServletRequest req, Model model) {
		int cnt = 0; // 글 개수
		Map<String, Object> map = new HashMap<String, Object>();
		if (req.getParameter("major") != null) {
			int majorNum = Integer.parseInt(req.getParameter("major"));
			cnt = dao.getExtraArticleCnt(majorNum);
			map.put("majorNum", majorNum);
			if (cnt > 0) { // 게시글 목록 조회
				ArrayList<ApplicationVO> dtos = dao.getExtraArticleList(map);
				model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은 바구니 : 게시글 1건
			}
			model.addAttribute("cnt", cnt);
			model.addAttribute("major", majorNum);
		}
	}

	// 강의 리스트
	@Override
	public void lectureList(HttpServletRequest req, Model model) {
		int cnt = 0; // 글 개수
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		String lec_day_dt = "";
		String lec_name = "";
		if (req.getParameter("lec_day_dt") != null) {
			lec_day_dt = req.getParameter("lec_day_dt");
		}
		if (req.getParameter("lec_name") != null) {
			lec_name = req.getParameter("lec_name");
		}
		if (!lec_day_dt.equals("")) {
			map2.put("lec_day_dt", lec_day_dt);
		}
		if (!lec_name.equals("")) {
			map2.put("lec_name", lec_name);
		}

		cnt = dao.getLectureCnt(map2);
		if (!lec_day_dt.equals("")) {
			map.put("lec_day_dt", lec_day_dt);
		}
		if (!lec_name.equals("")) {
			map.put("lec_name", lec_name);
		}
		if (cnt > 0) { // 게시글 목록 조회
			ArrayList<Lec_Prof_VO> dtos = dao.getLectureList(map);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은 바구니 : 게시글 1건
		}

		model.addAttribute("lec_day_dt", lec_day_dt);
		model.addAttribute("lec_name", lec_name);
		model.addAttribute("cnt", cnt);
	}

	// 강의 추가
	@Override
	public void lecturePlus(HttpServletRequest req, Model model) {
		LectureVO vo = new LectureVO();

		try {
			String lec_room_no = req.getParameter("lec_room_no");
			int lec_point =Integer.parseInt(req.getParameter("lec_point"));
			int lec_dt = Integer.parseInt(req.getParameter("lec_dt"));
			vo.setLec_name(req.getParameter("lec_name"));
			vo.setLec_point(lec_point);
			vo.setProf_no(req.getParameter("prof_no"));
			vo.setLec_dt(lec_dt);
			vo.setLec_day_dt(req.getParameter("lec_day_dt"));
			vo.setLec_room_no(lec_room_no);
			vo.setLec_cy_fl(Integer.parseInt(req.getParameter("lec_cy_fl")));
			vo.setMax_person(Integer.parseInt(req.getParameter("max_person")));
			
			int insertcnt = dao.lecturePlus(vo);
			// 디비 성공여부 저장
			System.out.println(insertcnt+" : cnt");
			model.addAttribute("insertcnt", insertcnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 교수 검색
	@Override
	public void searchProf(HttpServletRequest req, Model model) {

		int cnt = 0; // 글 개수
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		String maj_cd = "";
		String prof_name = "";
		if (req.getParameter("maj_cd") != null) {
			maj_cd = req.getParameter("maj_cd");
		}
		if (req.getParameter("prof_name") != null) {
			prof_name = req.getParameter("prof_name");
		}
		if (!maj_cd.equals("")) {
			map2.put("maj_cd", maj_cd);
		}
		if (!prof_name.equals("")) {
			map2.put("prof_name", prof_name);
		}

		cnt = dao.getProfCnt(map2);

		if (!maj_cd.equals("")) {
			map.put("maj_cd", maj_cd);
		}
		if (!prof_name.equals("")) {
			map.put("prof_name", prof_name);
		}
		if (cnt > 0) { // 게시글 목록 조회
			ArrayList<ProfessorVO> dtos = dao.getProfList(map);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은 바구니 : 게시글 1건
		}

		model.addAttribute("maj_cd", maj_cd);
		model.addAttribute("prof_name", prof_name);
		model.addAttribute("cnt", cnt);
	}

	// 강의 수정 페이지
	@Override
	public void lectureModi(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		Lec_Prof_VO dto = new Lec_Prof_VO();
		dto = dao.LectureModi(lec_no);
		model.addAttribute("dto", dto);
	}

	// 강의 수정
	@Override
	public void lectureModiPro(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		String prof_no = req.getParameter("prof_no");
		String lec_name = req.getParameter("lec_name");
		String lec_room_no = req.getParameter("lec_room_no");
		String lec_day_dt = req.getParameter("lec_day_dt");
		int lec_dt = Integer.parseInt(req.getParameter("lec_dt"));
		int lec_point = Integer.parseInt(req.getParameter("lec_point"));
		int lec_cy_fl = Integer.parseInt(req.getParameter("lec_cy_fl"));
		int max_person = Integer.parseInt(req.getParameter("max_person"));
		LectureVO vo = new LectureVO();

		vo.setLec_no(lec_no);
		vo.setProf_no(prof_no);
		vo.setLec_name(lec_name);
		vo.setLec_room_no(lec_room_no);
		vo.setLec_day_dt(lec_day_dt);
		vo.setLec_dt(lec_dt);
		vo.setLec_point(lec_point);
		vo.setLec_cy_fl(lec_cy_fl);
		vo.setMax_person(max_person);

		dao.lectureModiPro(vo);
	}

	// 강의 삭제
	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		dao.lectureDel(lec_no);
	}
	// 수강신청 시작
	@Override
	public void regStart(HttpServletRequest req, Model model) {
		dao.regStart();
	}
	// 수강신청 종료
	@Override
	public void regEnd(HttpServletRequest req, Model model) {
		dao.regEnd();
	}

	// 수강계획도우미 > 리스트 조회
	@Override
	public void cartList(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		int cnt = dao.cartCnt(id);
		ArrayList<Lecture_Wish_VO> dtos = dao.cartList(id);
		model.addAttribute("dtos_wish", dtos);
		model.addAttribute("cnt_wish", cnt);
		
	}

	// 수강계획도우미 > 추가 버튼
	@Override
	public void cartPlus(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		String id = (String) req.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("lec_no", lec_no);
		dao.cartPlus(map);
	}

	// 수강계획도우미 > 삭제버튼
	@Override
	public void cartDel(HttpServletRequest req, Model model) {
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		String id = (String)req.getSession().getAttribute("id");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lec_no",lec_no);
		map.put("id", id);
		dao.cartDel(map);
	}

	// 수강계획도우미 -현재 인원수
	@Override
	public void cartUpdate(HttpServletRequest req, Model model) {
		if (req.getParameter("lec_no") != null) {
			int lec_no = Integer.parseInt(req.getParameter("lec_no"));
			System.out.println("lec_no : "+lec_no);
			dao.cartUpdate(lec_no);
		}
	}

	// 수강계획도우미 중복확인
	@Override
	public int cartChk(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("lec_no", lec_no);
		int cnt = dao.cartChk(map);
		return cnt;
	}
	
	// 수강계획도우미>시간표
	@Override
	public void cartTimeTable(HttpServletRequest req, Model model) {
		ArrayList<LectureVO> cartList = new ArrayList<>();
		String[][] timeTable = new String[5][14];
		String[][] lecRoom = new String[5][14];
		String id = (String)req.getSession().getAttribute("id");
		for (int i = 0; i < 5; i++) { //월=0 ~ 금 =4
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("d", i);
			map.put("id", id);
			cartList = dao.getCartInfo(map); //해당 요일의 강의 가져오기 // 카트 강의 가져오기 여기부터 할것~!
			for (LectureVO vo : cartList) {
				int startTime = vo.getLec_dt() - 8;
				int endTime = vo.getLec_dt() + vo.getLec_point() - 8;

				for (int j = startTime; j < endTime; j++) {
					timeTable[i][j] = vo.getLec_name();
					lecRoom[i][j] = vo.getLec_room_no();
				}
			}
		}
		model.addAttribute("lecRoom", lecRoom);
		model.addAttribute("timeTable", timeTable);
	}
	
	// 수강신청 리스트 조회
	@Override
	public void regList(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int cnt = dao.regCnt(id);
		ArrayList<Lecture_Wish_VO> dtos = dao.regList(id);
		model.addAttribute("dtos_reg", dtos);
		model.addAttribute("cnt_reg", cnt);
	}

	// 수강신청 > 추가버튼
	@Override
	public void regPlus(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lec_no", lec_no);
		map.put("id", id);
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("lec_no", lec_no);
		map2.put("id", id);
		dao.regPlus(map);
		dao.gpaPlus(map2);
	}
	
	// 수강신청 > 추가버튼 - 인원초과 체크
	@Override
	public int personChk(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lec_no", lec_no);
		map.put("id", id);
		int personChk=0;
		int maxPerson=0,nowPerson=0;
		Reg_Lec_LectureVO vo=dao.personChk(map);
		if(vo!=null) {
			maxPerson=vo.getMax_person();
			nowPerson=vo.getLec_now_person();
		}
		if(maxPerson==nowPerson&&maxPerson!=0)
			personChk=1;
		System.out.println("현재인원 : "+nowPerson + "최대인원 : "+maxPerson);
		return personChk;
	}

	// 수강신청 > 삭제버튼
	@Override
	public void regDel(HttpServletRequest req, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> map2 = new HashMap<String,Object>();
		String id = (String)req.getSession().getAttribute("id");
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		map.put("id", id);
		map.put("lec_no", lec_no);
		map2.put("id", id);
		map2.put("lec_no", lec_no);
		dao.regDel(map);
		dao.gpaDel(map2);
	}

	// 수강신청 > 신청인원수 업데이트
	@Override
	public void regUpdate(HttpServletRequest req, Model model) {
		if (req.getParameter("lec_no") != null) {
			Map<String,Object> map = new HashMap<String,Object>();
			String id =(String)req.getSession().getAttribute("id");
			int lec_no = Integer.parseInt(req.getParameter("lec_no"));
			map.put("id", id);
			map.put("lec_no", lec_no);
			dao.regUpdate(map);
		}
	}
	
	// 수강신청 중복확인
	@Override
	public int regChk(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int lec_no = Integer.parseInt(req.getParameter("lec_no"));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("lec_no", lec_no);
		int cnt = dao.regChk(map);
		return cnt;
	}
	
	// 수강신청 > 시간표
	@Override
	public int regTimeTable(HttpServletRequest req, Model model) {
		ArrayList<LectureVO> cartList = new ArrayList<>();
		int chk=0;
		String id = (String)req.getSession().getAttribute("id");
		String[][] timeTable = new String[5][14];
		String[][] lecRoom = new String[5][14];
		for (int i = 0; i < 5; i++) { //월=0 ~ 금 =4
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("d", i);
			map.put("id", id);
			cartList = dao.getRegInfo(map); //해당 요일의 강의 가져오기
			for (LectureVO vo : cartList) {
				int startTime = vo.getLec_dt() - 8;
				int endTime = vo.getLec_dt() + vo.getLec_point() - 8;

				for (int j = startTime; j < endTime; j++) {
					if(timeTable[i][j]!=null) {
						chk=1;
					}
					timeTable[i][j] = vo.getLec_name();
					lecRoom[i][j] = vo.getLec_room_no();
				}
			}
		}
		model.addAttribute("lecRoom", lecRoom);
		model.addAttribute("timeTable", timeTable);
		return chk;
	}
	
	// 등록금 관리 > 등록금 납부 조회
	@Override
	public int tuition(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int tuition =dao.tuition(id);
		return tuition;
	}
	
	//장학금관리 > 장학금 수여내역 조회
	@Override
	public void gpaList(HttpServletRequest req, Model model) {
		int cnt;
		String id = (String)req.getSession().getAttribute("id");
		cnt = dao.getGpaCnt(id);
		if (cnt > 0) {
			ArrayList<Gpa_Total_VO> dtos = dao.getGpaList(id);
			model.addAttribute("dtos", dtos);
		}
		model.addAttribute("cnt",cnt);
	}
	
	//장학금관리 > 장학금 수여내역 조회
	@Override
	public void stuTotal(HttpServletRequest req, Model model) {
		int total;
		total = dao.getTotal();
		model.addAttribute("total",total);
	}
	
	//등록금관리 > 금년 순위 구하기
	@Override
	public void rank(HttpServletRequest req, Model model) {
		int rank;
		String id=(String)req.getSession().getAttribute("id");
		
		if(dao.getGpaCntThis(id)>0) {
			rank = dao.getRank(id);
			model.addAttribute("rank",rank);
		}
	}
	
	//강의관리 - 수강신청 상태 조회
	@Override
	public int regfl(HttpServletRequest req, Model model) {
		int regfl=dao.regfl();
		return regfl;
	}
	
	//합격관리 - 합격자 - 학번제공
	@Override
	public void provideSt_no(HttpServletRequest req, Model model) {
		
		int ent_no = Integer.parseInt(req.getParameter("ent_no"));
		ApplicationVO dto = dao.provideSt_no(ent_no);
		int updateStu = 0;
		
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("dto", dto);
		System.out.println("maj : "+dto.getEnt_maj());
		int insertCnt = dao.provide(map);
		System.out.println("insertCnt : "+insertCnt);
		if(insertCnt==1) {
			updateStu=dao.updateStu(ent_no);
		}
		model.addAttribute("updateStu",updateStu);
		model.addAttribute("insertCnt",insertCnt);
		model.addAttribute("dto",dto);
	}
	
	
	//합격자 수험번호 조회
	@Override
	public void st_no(HttpServletRequest req, Model model) {
			String regi_no = (String) req.getAttribute("regi_no");
			String st_no = dao.st_no(regi_no);
			System.out.println(st_no+"???");
			model.addAttribute("st_no",st_no);
	}
	
	
	
	
	
	
	// 아름

   // 합격자 조회
   @Override
   public void passChkPro(HttpServletRequest req, Model model) {
      String strName = req.getParameter("name");
      String strJumin = req.getParameter("jumin1") + "-" + req.getParameter("jumin2");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("strName", strName);
      map.put("strJumin", strJumin);
      int selectCnt = dao.nmJuminChk(map);
      
      ApplicationVO vo = new ApplicationVO();
      vo = dao.entStateChk(map);
      if(vo!=null) {
      model.addAttribute("maj",vo.getEnt_maj());
      model.addAttribute("vo", vo);
      model.addAttribute("selectCnt", selectCnt);
      }
   }

   // 학적 관리 > 기본 학적
   @Override
   public void st_profile(HttpServletRequest req, Model model) {
      String id = (String) req.getSession().getAttribute("id");
      
      StudentVO vo = new StudentVO();
      vo = dao.getStudentInfo(id);

      model.addAttribute("vo", vo);
      model.addAttribute("id", id);

   }

   // 학적 관리 > 기본 학적 - 정보수정 처리
   @Override
   public void st_profileModiPro(HttpServletRequest req, Model model) {
      StudentVO vo = new StudentVO();
      String id = (String) req.getSession().getAttribute("id");
      vo.setSt_email(req.getParameter("email"));
      String hp = "";
      String hp1 = req.getParameter("hp1");
      String hp2 = req.getParameter("hp2");
      String hp3 = req.getParameter("hp3");
      
      if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
         hp = hp1 + "-" + hp2 + "-" + hp3;
      }
      vo.setSt_no(id);
      vo.setSt_hp(hp);
      vo.setSt_zipcode(Integer.parseInt(req.getParameter("st_zipcode")));
      vo.setSt_addr1(req.getParameter("addr1"));
      vo.setSt_addr2(req.getParameter("addr2"));
      vo.setSt_bk(req.getParameter("st_bk"));
      vo.setSt_bkno(req.getParameter("st_bkno"));
      vo.setSt_bk_holder(req.getParameter("st_bk_holder"));

      int updateCnt = dao.updateStInfo(vo);
      model.addAttribute("updateCnt", updateCnt);
   }

   // 수업관리 > 시간표
   @Override
   public void st_timetable(HttpServletRequest req, Model model) {
      int st_state = Integer.parseInt(req.getParameter("st_state"));
      String id = (String) req.getSession().getAttribute("id");
      ArrayList<Stu_Reg_Lec_VO> lectureList = new ArrayList<>();
      String[][] timeTable = new String[5][14];
      String[][] lecRoom = new String[5][14];
      for (int i = 0; i < 5; i++) {
         Map<String, Object> map = new HashMap<>();
         map.put("d", i);
         map.put("st_no", id);
         lectureList = dao.getLectureInfo(map);
         for (Stu_Reg_Lec_VO vo : lectureList) {
            int startTime = vo.getLec_dt() - 8;
            int endTime = vo.getLec_dt() + vo.getLec_point() - 8;

            for (int j = startTime; j < endTime; j++) {
               timeTable[i][j] = vo.getLec_name();
               lecRoom[i][j] = vo.getLec_room_no();
            }
         }
      }
      model.addAttribute("lecRoom", lecRoom);
      model.addAttribute("timeTable", timeTable);
      model.addAttribute("st_state", st_state);
   }

   // 수업관리 > 내 강의실 > 내 강의 목록
   @Override
   public void st_lectureList(HttpServletRequest req, Model model) {
      String id = (String) req.getSession().getAttribute("id");
      int cnt = dao.getMyLecCnt(id);

      if (cnt > 0) {
         Map<String, Object> map = new HashMap<>();
         map.put("st_no", id);
         ArrayList<Lec_Prof_VO> dtos = dao.getMyLecList(map);
         model.addAttribute("dtos", dtos);
      }
      model.addAttribute("cnt", cnt);
   }

   // 수업관리 > 내 강의실 > 강의목록 > 출결현황
   @Override
   public void st_attendList(HttpServletRequest req, Model model) {
      String id = (String) req.getSession().getAttribute("id");
      String lec_name= req.getParameter("lec_name");
      
      String dto3 = dao2.lecStart(dao2.changeLec(lec_name));
      req.setAttribute("dto3", dto3);
      System.out.println("dto3 : " + dto3);
      model.addAttribute("dto3", dto3);
      
      Map<String, Object> map2 = new HashMap<>();
      map2.put("st_no", id);
      map2.put("lec_no", dao2.changeLec(lec_name));
      ArrayList<Attend_Lec_VO> dtos2 = dao2.getAttendLi(map2);

      Map<String, Object> map3 = new HashMap<>();
      map3.put("st_no", id);
      map3.put("lec_no", dao2.changeLec(lec_name));
      ArrayList<Attend_Lec_VO> dtos4 = dao2.attendList(map3);
      
      model.addAttribute("lec_name",lec_name);
      model.addAttribute("st_no", id);   
      model.addAttribute("dtos2", dtos2);
      model.addAttribute("dtos4", dtos4);
   }

   // 성적관리 > 성적조회
   @Override
   public void st_gpaList(HttpServletRequest req, Model model) {
      String id = (String) req.getSession().getAttribute("id");
      String semester = req.getParameter("semester");
      int cnt;

      if (req.getParameter("semester") != null) {
         Map<String, Object> map2 = new HashMap<>();
         map2.put("st_no", id);
         map2.put("semester", semester);
         cnt = dao.getGpaThisCnt(map2);
         if (cnt > 0) {
            Map<String, Object> map = new HashMap<>();
            map.put("st_no", id);
            map.put("semester", semester);
            
            ArrayList<Gpa_Lec_VO> dtos = dao.getGpaThisList(map);
            model.addAttribute("cnt", cnt);
            model.addAttribute("dtos", dtos);
         }
         model.addAttribute("cnt", cnt);
         model.addAttribute("semester", semester);
      }
   }
   
   // 학생 전체 조회
   @Override
   public void stuList(HttpServletRequest req, Model model) {
      int cnt = 0;
      String major = req.getParameter("major");
      model.addAttribute("major",major);
      cnt = dao.getStudentCnt(major);
      if (cnt > 0) {
         ArrayList<StudentVO> dtos = dao.getStudentList(major);
         model.addAttribute("dtos", dtos);
         }
         model.addAttribute("cnt", cnt);
      
   }

   // 성적 전체 조회
   @Override
   public void adminGpaList(HttpServletRequest req, Model model) {
      int cnt = 0;
      cnt = dao.getAdminGpaCnt();
      
      if (cnt > 0) {
         ArrayList<Gpa_Lec_Stu_VO> dtos = dao.getAdminGpaList();
         model.addAttribute("dtos", dtos);
         }
         model.addAttribute("cnt", cnt);
      
   }
   
   
}
