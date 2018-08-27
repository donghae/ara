package com.spring.projectFinal.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CLService {
	//test
	public void addRound(MultipartHttpServletRequest req, Model model);
	
	//test
	public void downloadFile(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
	
	//온라인 강의 공지사항 쓰기
	public void addLecNotice(MultipartHttpServletRequest req, Model model);
	
	//온라인 강의 공지사항 리스트
	public void getLecNoticeList(HttpServletRequest req, Model model);
	
	//온라인 강의 공지사항 하나
	public void getLecNotice(HttpServletRequest req, Model model);
	
	//온라인강의 공지사항 하나 수정
	public void updateLecNotice(HttpServletRequest req, Model model);
	
	//온라인강의 공지사항 하나 삭제
	public void deleteLecNotice(HttpServletRequest req, Model model);
	
	//온라인 강의 전체 공지사항 쓰기
	public void addNotice(MultipartHttpServletRequest req, Model model);
	
	//온라인 강의 전체 공지사항 리스트
	public void getNoticeList(HttpServletRequest req, Model model);
	
	//온라인 강의 전체 공지사항 하나가져오기
	public void getNotice(HttpServletRequest req, Model model);
	
	//전체 온라인강의 공지사항 하나 수정
	public void updateNotice(HttpServletRequest req, Model model);
	
	//전체 온라인강의 공지사항 하나 삭제
	public void deleteNotice(HttpServletRequest req, Model model);
	
	//온라인 강의 리스트
	public void getLecList(HttpServletRequest req, Model model);
	
	//강의 회차 리스트
	public void getRoundList(HttpServletRequest req, Model model);
	
	//온라인 출석 업데이트
	public void updateCyAttendance(HttpServletRequest req, Model model);
	
	
}
