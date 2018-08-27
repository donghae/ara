package com.spring.projectFinal.LIVO;

import java.sql.Date;

public class BookVO {

	private String b_no;		//isbn번호+000
	private long b_isbn;		//isbn
	private int b_global;	//대분류
	private int b_category;	//중분류
	private String b_title;	//책제목
	private int b_price;	//가격
	private String b_author;//작가
	private String b_publish;//출판사
	private String b_date;	//발행일
	private String b_img;	//책 이미지
	private Date b_intoDate;	//입고일
	private int b_state_fl;	//대출가능여부

	
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getB_no() {
		return b_no;
	}

	public void setB_no(String b_no) {
		this.b_no = b_no;
	}

	public long getB_isbn() {
		return b_isbn;
	}

	public void setB_isbn(long b_isbn) {
		this.b_isbn = b_isbn;
	}

	public int getB_global() {
		return b_global;
	}

	public void setB_global(int b_global) {
		this.b_global = b_global;
	}

	public int getB_category() {
		return b_category;
	}

	public void setB_category(int b_category) {
		this.b_category = b_category;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		this.b_author = b_author;
	}

	public String getB_publish() {
		return b_publish;
	}

	public void setB_publish(String b_publish) {
		this.b_publish = b_publish;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public Date getB_intoDate() {
		return b_intoDate;
	}

	public void setB_intoDate(Date b_intoDate) {
		this.b_intoDate = b_intoDate;
	}

	public int getB_state_fl() {
		return b_state_fl;
	}

	public void setB_state_fl(int b_state_fl) {
		this.b_state_fl = b_state_fl;
	}


}
