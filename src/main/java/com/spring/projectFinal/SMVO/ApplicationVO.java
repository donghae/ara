package com.spring.projectFinal.SMVO;

// 입학신청 테이블(tbl_entrance)
public class ApplicationVO {
	private int ent_no; // 수험번호(PK)
	private String ent_name; // 이름
	private String ent_regi_no; // 주민등록번호
	private String ent_maj; // 지원학과
	private String ent_image; // 사진
	private int ent_grade; // 수능성적	
	private String ent_highschool; // 출신학교
	private String ent_email; // 이메일
	private String ent_hp; // 전화번호
	private int ent_zipcode; // 우편번호
	private String ent_addr1; // 주소1
	private String ent_addr2; // 주소2
	private int ent_disablity_fl; // 장애여부
	private int ent_state; // 입학지원상태

	public int getEnt_no() {
		return ent_no;
	}

	public void setEnt_no(int ent_no) {
		this.ent_no = ent_no;
	}

	public String getEnt_name() {
		return ent_name;
	}

	public void setEnt_name(String ent_name) {
		this.ent_name = ent_name;
	}

	public String getEnt_regi_no() {
		return ent_regi_no;
	}

	public void setEnt_regi_no(String ent_regi_no) {
		this.ent_regi_no = ent_regi_no;
	}

	public String getEnt_maj() {
		return ent_maj;
	}

	public void setEnt_maj(String ent_maj) {
		this.ent_maj = ent_maj;
	}

	public String getEnt_image() {
		return ent_image;
	}

	public void setEnt_image(String ent_image) {
		this.ent_image = ent_image;
	}

	public int getEnt_grade() {
		return ent_grade;
	}

	public void setEnt_grade(int ent_grade) {
		this.ent_grade = ent_grade;
	}

	public String getEnt_highschool() {
		return ent_highschool;
	}

	public void setEnt_highschool(String ent_highschool) {
		this.ent_highschool = ent_highschool;
	}

	public String getEnt_email() {
		return ent_email;
	}

	public void setEnt_email(String ent_email) {
		this.ent_email = ent_email;
	}

	public String getEnt_hp() {
		return ent_hp;
	}

	public void setEnt_hp(String ent_hp) {
		this.ent_hp = ent_hp;
	}

	public int getEnt_zipcode() {
		return ent_zipcode;
	}

	public void setEnt_zipcode(int ent_zipcode) {
		this.ent_zipcode = ent_zipcode;
	}

	public String getEnt_addr1() {
		return ent_addr1;
	}

	public void setEnt_addr1(String ent_addr1) {
		this.ent_addr1 = ent_addr1;
	}

	public String getEnt_addr2() {
		return ent_addr2;
	}

	public void setEnt_addr2(String ent_addr2) {
		this.ent_addr2 = ent_addr2;
	}

	public int getEnt_disablity_fl() {
		return ent_disablity_fl;
	}

	public void setEnt_disablity_fl(int ent_disablity_fl) {
		this.ent_disablity_fl = ent_disablity_fl;
	}

	public int getEnt_state() {
		return ent_state;
	}

	public void setEnt_state(int ent_state) {
		this.ent_state = ent_state;
	}
}