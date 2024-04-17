package com.kh.khu.student.model.service;

import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.student.model.vo.Student;

public interface StudentService {

	Student loginStudent(Student s);

	int insertTakeOff(Absence a);
	
	Student selectChkStudent(String email);
	
	int changePwd(String userId, String encPwd);
	
	int selectTakeOff(Absence a);
	
	int insertReturnSchool(Presence p);
	
	int insertStudent(Student s);
	
	String selectStudentId(Student s);
}
