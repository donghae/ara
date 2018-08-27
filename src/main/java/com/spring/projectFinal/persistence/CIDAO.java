package com.spring.projectFinal.persistence;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.CIVO.MajorVO;



public interface CIDAO {

	public int getMajorCnt();

	public ArrayList<MajorVO> getMajorList(Map<String, Object> map);

	public MajorVO getMajor(int maj_cd);
	
	public int modifyMajor(MajorVO vo);
	
	public int addMajor(MajorVO vo);
	
	public int deleteMajor(int maj_cd);
	
	public Date getDate();
}
