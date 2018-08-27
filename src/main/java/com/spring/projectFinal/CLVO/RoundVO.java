package com.spring.projectFinal.CLVO;

public class RoundVO {
	private int lec_no;
	private int round_no;
	private String round_name;
	private String file_name;
	private long file_len;
	public long getFile_len() {
		return file_len;
	}
	public void setFile_len(long file_len) {
		this.file_len = file_len;
	}
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
	public String getRound_name() {
		return round_name;
	}
	public void setRound_name(String round_name) {
		this.round_name = round_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
}
