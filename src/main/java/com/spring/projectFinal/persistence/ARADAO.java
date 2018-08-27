package com.spring.projectFinal.persistence;
import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.ARAVO.AdminVO;
import com.spring.projectFinal.ARAVO.ProfessorVO;
import com.spring.projectFinal.ARAVO.StudentVO;




public interface ARADAO {
	public int checkAdmin(Map<String,Object> map);
	public int checkProf(Map<String,Object> map);
	public int checkStudent(Map<String,Object> map);
	
	public AdminVO getAdminInfo(Map<String,Object> map);
	public ProfessorVO getProfInfo(Map<String,Object> map);
	public StudentVO getStudentInfo(Map<String,Object> map);
	
	public ArrayList<AdminVO> getAdminIdPwd(Map<String,Object> map);
	public ArrayList<ProfessorVO> getProfIdPwd(Map<String,Object> map);
	public ArrayList<StudentVO> getStudentIdPwd(Map<String,Object> map);
}
