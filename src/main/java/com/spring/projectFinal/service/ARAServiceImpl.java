package com.spring.projectFinal.service;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;
import com.spring.projectFinal.persistence.ARADAO;



@Service
public class ARAServiceImpl implements ARAService{
	@Autowired
	ARADAO dao;
	
	
	
	@Override
	public void login(HttpServletRequest req, Model model) {
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
			vo = dao.getAdminInfo(map);
			if(vo!=null) {
				System.out.println("AdminVO");
				req.getSession().setAttribute("id", id);
				req.getSession().setAttribute("name", vo.getAd_name());
			}
		}else if(id.substring(0, 1).equals("1")) {
			ProfessorVO vo = new ProfessorVO();
			vo = dao.getProfInfo(map);
			if(vo!=null) {
				System.out.println("ProfessorVO");
				req.getSession().setAttribute("id", id);
				req.getSession().setAttribute("name", vo.getProf_name());
			}
		}else if(id.substring(0, 1).equals("2")) {
			StudentVO vo = new StudentVO();
			vo = dao.getStudentInfo(map);
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



	@Override
	public void findIdPwd(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String name = req.getParameter("userName");
		String birth = req.getParameter("birth1")+req.getParameter("birth2");
		String id = req.getParameter("id");
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("birth", birth);
		map.put("id", id);
		ArrayList<AdminVO> adminList = dao.getAdminIdPwd(map);
		ArrayList<ProfessorVO> profList = dao.getProfIdPwd(map);
		ArrayList<StudentVO> stuList = dao.getStudentIdPwd(map);
		
		ArrayList<String> idList = new ArrayList<>();
		ArrayList<String> pwdList = new ArrayList<>();
		ArrayList<String> emailList = new ArrayList<>();
		for(AdminVO vo : adminList) {
			idList.add(vo.getAd_no());
			pwdList.add(vo.getAd_pwd());
			emailList.add(vo.getAd_email());
		}
		for(ProfessorVO vo : profList) {
			idList.add(vo.getProf_no());
			pwdList.add(vo.getProf_pwd());
			emailList.add(vo.getProf_email());
		}
		for(StudentVO vo : stuList) {
			idList.add(vo.getSt_no());
			pwdList.add(vo.getSt_pwd());
			emailList.add(vo.getSt_email());
		}
		
		if(idList.size()>0) {
			model.addAttribute("idList", idList);
		}
		
		
		if(id!=null) {
			for(String email : emailList) {
				req.setAttribute("email", email);				
			}
			for(String pwd : pwdList) {
				req.setAttribute("pwd", pwd);
			}
			smtp(req,model);
		}
		
	}
	@SuppressWarnings("restriction")
	@Override
	public void smtp(HttpServletRequest req, Model model) {
		String user = "donghae12@naver.com";
		String password = "donghae123";
		String toAddress = (String) req.getAttribute("email");
		String findPwd = (String) req.getAttribute("pwd");
		Properties prop = new Properties();
		prop.put("mail.smtp.host","smtp.naver.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
			
			//메일 제목
			message.setSubject("ara대학교 비밀번호 찾기 결과 메일입니다.");
			
			
			
			//메일 내용
			message.setText("비밀번호는   \n\n    "+findPwd+"   입니다");
			
			Transport.send(message);
			
			System.out.println("message sent succ");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
