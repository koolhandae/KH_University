package com.kh.khu.student.model.service;

import com.kh.khu.student.model.vo.Student;

public interface StudentService {

	Student loginStudent(Student s);
	
	Student selectChkStudent(String email);
	
	int changePwd(String userId, String encPwd);
	
	int insertStudent(Student s);
	
	String selectStudentId(Student s);
	
	int verifyEmail(String email);
}
