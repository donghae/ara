package com.spring.projectFinal.SMVO;

// 성적관리 > 금학기 성적 조회, 누적 성적조회
public class Gpa_Lec_VO {

	private String st_no; // 학번
	private int lec_no; // 강의번호
	private String gpa_semester; // 학기
	private float gpa; // 평점
	private String lec_name; // 강의명
	private int st_level; // 학년
	private int lec_point; // 학점
	private int rnum;

	public int getLec_point() {
		return lec_point;
	}

	public void setLec_point(int lec_point) {
		this.lec_point = lec_point;
	}

	public int getSt_level() {
		return st_level;
	}

	public void setSt_level(int st_level) {
		this.st_level = st_level;
	}

	public float getGpa() {
		return gpa;
	}

	public void setGpa(float gpa) {
		this.gpa = gpa;
	}

	public int getLec_no() {
		return lec_no;
	}

	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}

	public String getGpa_semester() {
		return gpa_semester;
	}

	public void setGpa_semester(String gpa_semester) {
		this.gpa_semester = gpa_semester;
	}

	public String getLec_name() {
		return lec_name;
	}

	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getSt_no() {
		return st_no;
	}

	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
}