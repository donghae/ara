package com.spring.projectFinal.CLVO;

import java.sql.Date;

public class CyberAttendanceVO {
	private int lec_no;
	private int round_no;
	private long watch_time;
	private String st_no;
	private Date watch_dt;
	public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public int getRound_no() {
		return round_no;
	}
	public void setRound_no(int round_no) {
		this.round_no = round_no;
	}
	public long getWatch_time() {
		return watch_time;
	}
	public void setWatch_time(long watch_time) {
		this.watch_time = watch_time;
	}
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public Date getWatch_dt() {
		return watch_dt;
	}
	public void setWatch_dt(Date watch_dt) {
		this.watch_dt = watch_dt;
	}
	
}
