package com.spring.projectFinal.DTVO;

import java.sql.Date;

public class Dt_stu_overnight_selectVO {
	private int overnight_no;
	private String st_no;
	private String st_name;
	private int dorm_room;
	private int dorm_on_sc;
	private Date dorm_ex_dt;
	private int dorm_ex_fl;
	private String dorm_reason;
	
	
	public int getOvernight_no() {
		return overnight_no;
	}
	
	public void setOvernight_no(int overnight_no) {
		this.overnight_no = overnight_no;
	}
	
	public String getSt_no() {
		return st_no;
	}
	
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	
	public String getSt_name() {
		return st_name;
	}
	
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	
	public int getDorm_room() {
		return dorm_room;
	}
	
	public void setDorm_room(int dorm_room) {
		this.dorm_room = dorm_room;
	}
	
	public int getDorm_on_sc() {
		return dorm_on_sc;
	}
	
	public void setDorm_on_sc(int dorm_on_sc) {
		this.dorm_on_sc = dorm_on_sc;
	}
	
	public Date getDorm_ex_dt() {
		return dorm_ex_dt;
	}
	
	public void setDorm_ex_dt(Date dorm_ex_dt) {
		this.dorm_ex_dt = dorm_ex_dt;
	}
	
	public int getDorm_ex_fl() {
		return dorm_ex_fl;
	}
	
	public void setDorm_ex_fl(int dorm_ex_fl) {
		this.dorm_ex_fl = dorm_ex_fl;
	}
	
	public String getDorm_reason() {
		return dorm_reason;
	}
	
	public void setDorm_reason(String dorm_reason) {
		this.dorm_reason = dorm_reason;
	}
	
	

	
	
}
