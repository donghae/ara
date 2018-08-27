package com.spring.projectFinal.DTVO;

import java.sql.Date;

public class Dt_stu_penalty_selectVO {

	private String st_no;
	private String st_name;
	private int dorm_room;
	private int dorm_penalty;
	private Date dorm_penalty_dt;
	private String dorm_reason;
	
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
	
	public int getDorm_penalty() {
		return dorm_penalty;
	}
	
	public void setDorm_penalty(int dorm_penalty) {
		this.dorm_penalty = dorm_penalty;
	}
	
	public Date getDorm_penalty_dt() {
		return dorm_penalty_dt;
	}
	
	public void setDorm_penalty_dt(Date dorm_penalty_dt) {
		this.dorm_penalty_dt = dorm_penalty_dt;
	}
	
	public String getDorm_reason() {
		return dorm_reason;
	}
	
	public void setDorm_reason(String dorm_reason) {
		this.dorm_reason = dorm_reason;
	}
	

	
	
}
