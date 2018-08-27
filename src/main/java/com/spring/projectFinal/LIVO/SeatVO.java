package com.spring.projectFinal.LIVO;

import java.util.Date;

public class SeatVO {

	private int seat_no;
	private String rdRoom_no;
	private String user_no;
	private String user_name;
	private Date seat_st_dt;
	private Date seat_end_dt;
	private String seat_usetime;
	private int seat_state;

	
	public SeatVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public String getRdRoom_no() {
		return rdRoom_no;
	}

	public void setRdRoom_no(String rdRoom_no) {
		this.rdRoom_no = rdRoom_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public Date getSeat_st_dt() {
		return seat_st_dt;
	}

	public void setSeat_st_dt(Date seat_st_dt) {
		this.seat_st_dt = seat_st_dt;
	}

	public Date getSeat_end_dt() {
		return seat_end_dt;
	}

	public void setSeat_end_dt(Date seat_end_dt) {
		this.seat_end_dt = seat_end_dt;
	}

	public String getseat_usetime() {
		return seat_usetime;
	}

	public void setseat_usetime(String seat_usetime) {
		this.seat_usetime = seat_usetime;
	}

	public int getSeat_state() {
		return seat_state;
	}

	public void setSeat_state(int seat_state) {
		this.seat_state = seat_state;
	}
	
}
