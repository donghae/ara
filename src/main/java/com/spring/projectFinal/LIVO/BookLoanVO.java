package com.spring.projectFinal.LIVO;

import java.util.Date;

public class BookLoanVO {

	private int loan_no;
	private String b_no;
	private String user_no;
	private Date loan_dt;
	private String return_sche;
	private int overdue;
	private Date return_dt;
	private int loan_state;
	
	
	public BookLoanVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getLoan_no() {
		return loan_no;
	}


	public void setLoan_no(int loan_no) {
		this.loan_no = loan_no;
	}


	public String getB_no() {
		return b_no;
	}


	public void setB_no(String b_no) {
		this.b_no = b_no;
	}


	public String getUser_no() {
		return user_no;
	}


	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}


	public Date getLoan_dt() {
		return loan_dt;
	}


	public void setLoan_dt(Date loan_dt) {
		this.loan_dt = loan_dt;
	}


	public String getReturn_sche() {
		return return_sche;
	}


	public void setReturn_sche(String return_sche) {
		this.return_sche = return_sche;
	}


	public int getOverdue() {
		return overdue;
	}


	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}


	public Date getReturn_dt() {
		return return_dt;
	}


	public void setReturn_dt(Date return_dt) {
		this.return_dt = return_dt;
	}


	public int getLoan_state() {
		return loan_state;
	}


	public void setLoan_state(int loan_state) {
		this.loan_state = loan_state;
	}



}
