package com.kh.khu.student.model.service;

import com.kh.khu.student.model.vo.Student;

public interface StudentService {

	Student loginStudent(Student s);

	int insertTakeOff(Student s);
}
