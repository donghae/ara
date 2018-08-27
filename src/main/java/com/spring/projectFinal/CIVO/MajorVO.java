package com.spring.projectFinal.CIVO;

public class MajorVO {
	//전공 코드
	private int maj_cd;	
	//교수 번호
	private String prof_no;
	//사무실 번호
	private int maj_office_no;
	//과 최대인원
	private int maj_cnt;
	//등록금
	private int maj_tuition;
	//학과 정보
	private String maj_info;
	
	public int getMaj_cd() {
		return maj_cd;
	}
	public void setMaj_cd(int maj_cd) {
		this.maj_cd = maj_cd;
	}
	public String getProf_no() {
		return prof_no;
	}
	public void setProf_no(String prof_no) {
		this.prof_no = prof_no;
	}
	public int getMaj_office_no() {
		return maj_office_no;
	}
	public void setMaj_office_no(int maj_office_no) {
		this.maj_office_no = maj_office_no;
	}
	public int getMaj_cnt() {
		return maj_cnt;
	}
	public void setMaj_cnt(int maj_cnt) {
		this.maj_cnt = maj_cnt;
	}
	public int getMaj_tuition() {
		return maj_tuition;
	}
	public void setMaj_tuition(int maj_tuition) {
		this.maj_tuition = maj_tuition;
	}
	public String getMaj_info() {
		return maj_info;
	}
	public void setMaj_info(String maj_info) {
		this.maj_info = maj_info;
	}
	
}
