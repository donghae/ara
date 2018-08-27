package com.spring.projectFinal.CLVO;

import java.sql.Date;

public class CyberLecNoticeVO {
	private int cy_lec_n_no;
	private String prof_no;
	private String prof_name;
	private int lec_no;
	private String cy_lec_n_title;
	private String cy_lec_n_content;
	private Date cy_lec_n_dt;
	private String cy_lec_n_file;
	private int cy_lec_n_cnt;
	
    public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public int getCy_lec_n_no() {
		return cy_lec_n_no;
	}
	public void setCy_lec_n_no(int cy_lec_n_no) {
		this.cy_lec_n_no = cy_lec_n_no;
	}
	
	public String getCy_lec_n_title() {
		return cy_lec_n_title;
	}
	public void setCy_lec_n_title(String cy_lec_n_title) {
		this.cy_lec_n_title = cy_lec_n_title;
	}
	public String getCy_lec_n_content() {
		return cy_lec_n_content;
	}
	public void setCy_lec_n_content(String cy_lec_n_content) {
		this.cy_lec_n_content = cy_lec_n_content;
	}
	public Date getCy_lec_n_dt() {
		return cy_lec_n_dt;
	}
	public void setCy_lec_n_dt(Date cy_lec_n_dt) {
		this.cy_lec_n_dt = cy_lec_n_dt;
	}
	public String getCy_lec_n_file() {
		return cy_lec_n_file;
	}
	public void setCy_lec_n_file(String cy_lec_n_file) {
		this.cy_lec_n_file = cy_lec_n_file;
	}
	public int getCy_lec_n_cnt() {
		return cy_lec_n_cnt;
	}
	public void setCy_lec_n_cnt(int cy_lec_n_cnt) {
		this.cy_lec_n_cnt = cy_lec_n_cnt;
	}
	public String getProf_no() {
		return prof_no;
	}
	public void setProf_no(String prof_no) {
		this.prof_no = prof_no;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	
	
}
