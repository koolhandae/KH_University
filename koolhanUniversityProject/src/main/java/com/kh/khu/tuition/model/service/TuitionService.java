package com.kh.khu.tuition.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;
import com.kh.khu.tuition.model.vo.TuitionStudentMake;

public interface TuitionService {
	
	int insertTuitionPay(Tuition t);
	
	ArrayList<Tuition> tuitionBillForm(String studentId);

	ArrayList<Tuition> tuitionPayForm(String studentId);

	ArrayList<Tuition> studentTuition(int studentNo);
	
	ArrayList<AdminTuitionMake> tuitionMakeForm();

	AdminTuitionMake latestTuition();

	List<TuitionStudentMake> makeTuitionStudent();

	Tuition selectTuition(int studentNo);
}
