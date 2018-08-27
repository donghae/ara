package com.spring.projectFinal.AndroidAra;

import java.util.List;
import java.util.Map;

import com.spring.projectFinal.AndroidAra.StudentVO;


public interface AndroidDAO {
	
	public int confirmIdPwd(Map<String, Object> map);
	
	public StudentVO getMemberInfo(String id);
	
	public List<AttendVO> getAttendList(String id);

	public List<Gpa_Total_VO> getGpaList(String id);
	
	public List<Stu_Reg_Lec_VO> getLectureInfo(Map<String, Object> map);
}
