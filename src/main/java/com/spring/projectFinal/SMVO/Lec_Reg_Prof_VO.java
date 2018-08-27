package com.spring.projectFinal.SMVO;

import java.util.Date;

// 강의 + 수강신청 + 교수
public class Lec_Reg_Prof_VO {

	private int lec_no; // 강의번호(PK)
	private String prof_no; // 교수번호(FK)
	private String lec_name; // 강의명
	private String lec_room_no; // 강의실명
	private String lec_day_dt; // 강의요일
	private int lec_dt; // 강의시각
	private int lec_point; // 학점
	private int lec_cy_fl; // 온라인여부
	private int max_person; // 수강최대인원
	private int limit_cnt; // 강의실 수용최대인원

	// private int lec_no;
	private int reg_lec_no;
	private String st_no;
	private int lec_now_person;

	// private String prof_no;
	private int maj_cd;
	private String prof_pwd;
	private String prof_hp;
	private String prof_name;
	private Date prof_birth;
	private String prof_zipcode;
	private String prof_addr1;
	private String prof_addr2;
	private String prof_email;
	private String prof_img;

	public int getLec_no() {
		return lec_no;
	}

	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}

	public String getProf_no() {
		return prof_no;
	}

	public void setProf_no(String prof_no) {
		this.prof_no = prof_no;
	}

	public String getLec_name() {
		return lec_name;
	}

	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}

	public String getLec_room_no() {
		return lec_room_no;
	}

	public void setLec_room_no(String lec_room_no) {
		this.lec_room_no = lec_room_no;
	}

	public String getLec_day_dt() {
		return lec_day_dt;
	}

	public void setLec_day_dt(String lec_day_dt) {
		this.lec_day_dt = lec_day_dt;
	}

	public int getLec_dt() {
		return lec_dt;
	}

	public void setLec_dt(int lec_dt) {
		this.lec_dt = lec_dt;
	}

	public int getLec_point() {
		return lec_point;
	}

	public void setLec_point(int lec_point) {
		this.lec_point = lec_point;
	}

	public int getLec_cy_fl() {
		return lec_cy_fl;
	}

	public void setLec_cy_fl(int lec_cy_fl) {
		this.lec_cy_fl = lec_cy_fl;
	}

	public int getMax_person() {
		return max_person;
	}

	public void setMax_person(int max_person) {
		this.max_person = max_person;
	}

	public int getLimit_cnt() {
		return limit_cnt;
	}

	public void setLimit_cnt(int limit_cnt) {
		this.limit_cnt = limit_cnt;
	}

	public int getReg_lec_no() {
		return reg_lec_no;
	}

	public void setReg_lec_no(int reg_lec_no) {
		this.reg_lec_no = reg_lec_no;
	}

	public String getSt_no() {
		return st_no;
	}

	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}

	public int getLec_now_person() {
		return lec_now_person;
	}

	public void setLec_now_person(int lec_now_person) {
		this.lec_now_person = lec_now_person;
	}

	public int getMaj_cd() {
		return maj_cd;
	}

	public void setMaj_cd(int maj_cd) {
		this.maj_cd = maj_cd;
	}

	public String getProf_pwd() {
		return prof_pwd;
	}

	public void setProf_pwd(String prof_pwd) {
		this.prof_pwd = prof_pwd;
	}

	public String getProf_hp() {
		return prof_hp;
	}

	public void setProf_hp(String prof_hp) {
		this.prof_hp = prof_hp;
	}

	public String getProf_name() {
		return prof_name;
	}

	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}

	public Date getProf_birth() {
		return prof_birth;
	}

	public void setProf_birth(Date prof_birth) {
		this.prof_birth = prof_birth;
	}

	public String getProf_zipcode() {
		return prof_zipcode;
	}

	public void setProf_zipcode(String prof_zipcode) {
		this.prof_zipcode = prof_zipcode;
	}

	public String getProf_addr1() {
		return prof_addr1;
	}

	public void setProf_addr1(String prof_addr1) {
		this.prof_addr1 = prof_addr1;
	}

	public String getProf_addr2() {
		return prof_addr2;
	}

	public void setProf_addr2(String prof_addr2) {
		this.prof_addr2 = prof_addr2;
	}

	public String getProf_email() {
		return prof_email;
	}

	public void setProf_email(String prof_email) {
		this.prof_email = prof_email;
	}

	public String getProf_img() {
		return prof_img;
	}

	public void setProf_img(String prof_img) {
		this.prof_img = prof_img;
	}

}