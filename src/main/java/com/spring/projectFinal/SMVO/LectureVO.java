package com.spring.projectFinal.SMVO;

public class LectureVO {

	private int lec_no; // 강의번호
	private String prof_no; // 교수번호
	private String lec_name; // 강의명
	private String lec_room_no; // 강의실명
	private String lec_day_dt; // 강의요일
	private int lec_dt; // 강의시각
	private int lec_point; // 학점
	private int lec_cy_fl; // 온라인여부
	private int max_person; // 수강최대인원
	private int limit_cnt; // 강의실 수용최대인원

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

}