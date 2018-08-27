package com.spring.projectFinal.ARAVO;

import java.sql.Date;

public class StudentVO {
   private String st_no; //학번
   private String maj_cd; //전공명
   private String st_pwd; //비밀번호   
   private String st_name; //이름
   private String st_hp; //전화번호
   private Date st_ent_dt; //입학일
   private int st_level; //학년
   private int st_abs_fl; //휴학여부
   private int st_disable_fl; //장애여부
   private String st_birth; //생년월일
   private int st_zipcode; //우편번호
   private String st_addr1; //주소1
   private String st_addr2; //주소2
   private String st_email; //이메일   
   private String st_bk; //은행명
   private String st_bk_holder; //예금주명
   private String st_bkno; //계좌번호
   private int st_point; //이수학점
   private int st_schol; //장학금
   private Date st_tuition_dt; //등록금납부일
   private String cc_name; //동아리명
   private String st_img; //사진
   private String enabled;
   public String getEnabled() {
	return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getSt_no() {
      return st_no;
   }
   public void setSt_no(String st_no) {
      this.st_no = st_no;
   }
   public String getMaj_cd() {
      return maj_cd;
   }
   public void setMaj_cd(String maj_cd) {
      this.maj_cd = maj_cd;
   }
   public String getSt_pwd() {
      return st_pwd;
   }
   public void setSt_pwd(String st_pwd) {
      this.st_pwd = st_pwd;
   }
   public String getSt_name() {
      return st_name;
   }
   public void setSt_name(String st_name) {
      this.st_name = st_name;
   }
   public String getSt_hp() {
      return st_hp;
   }
   public void setSt_hp(String st_hp) {
      this.st_hp = st_hp;
   }
   public Date getSt_ent_dt() {
      return st_ent_dt;
   }
   public void setSt_ent_dt(Date st_ent_dt) {
      this.st_ent_dt = st_ent_dt;
   }
   public int getSt_level() {
      return st_level;
   }
   public void setSt_level(int st_level) {
      this.st_level = st_level;
   }
   public int getSt_abs_fl() {
      return st_abs_fl;
   }
   public void setSt_abs_fl(int st_abs_fl) {
      this.st_abs_fl = st_abs_fl;
   }
   public int getSt_disable_fl() {
      return st_disable_fl;
   }
   public void setSt_disable_fl(int st_disable_fl) {
      this.st_disable_fl = st_disable_fl;
   }
   public String getSt_birth() {
      return st_birth;
   }
   public void setSt_birth(String st_birth) {
      this.st_birth = st_birth;
   }
   public int getSt_zipcode() {
      return st_zipcode;
   }
   public void setSt_zipcode(int st_zipcode) {
      this.st_zipcode = st_zipcode;
   }
   public String getSt_addr1() {
      return st_addr1;
   }
   public void setSt_addr1(String st_addr1) {
      this.st_addr1 = st_addr1;
   }
   public String getSt_addr2() {
      return st_addr2;
   }
   public void setSt_addr2(String st_addr2) {
      this.st_addr2 = st_addr2;
   }
   public String getSt_email() {
      return st_email;
   }
   public void setSt_email(String st_email) {
      this.st_email = st_email;
   }
   public String getSt_bk() {
      return st_bk;
   }
   public void setSt_bk(String st_bk) {
      this.st_bk = st_bk;
   }
   public String getSt_bk_holder() {
      return st_bk_holder;
   }
   public void setSt_bk_holder(String st_bk_holder) {
      this.st_bk_holder = st_bk_holder;
   }
   public String getSt_bkno() {
      return st_bkno;
   }
   public void setSt_bkno(String st_bkno) {
      this.st_bkno = st_bkno;
   }
   public int getSt_point() {
      return st_point;
   }
   public void setSt_point(int st_point) {
      this.st_point = st_point;
   }
   public int getSt_schol() {
      return st_schol;
   }
   public void setSt_schol(int st_schol) {
      this.st_schol = st_schol;
   }
   public Date getSt_tuition_dt() {
      return st_tuition_dt;
   }
   public void setSt_tuition_dt(Date st_tuition_dt) {
      this.st_tuition_dt = st_tuition_dt;
   }
   public String getCc_name() {
      return cc_name;
   }
   public void setCc_name(String cc_name) {
      this.cc_name = cc_name;
   }
   public String getSt_img() {
      return st_img;
   }
   public void setSt_img(String st_img) {
      this.st_img = st_img;
   }
}