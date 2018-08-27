package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface ARAService {
	public void login(HttpServletRequest req, Model model);
	
	public void findIdPwd(HttpServletRequest req, Model model);
	
	public void smtp(HttpServletRequest req, Model model);
}
