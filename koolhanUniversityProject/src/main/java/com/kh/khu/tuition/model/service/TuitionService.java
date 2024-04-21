package com.kh.khu.tuition.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;
import com.kh.khu.tuition.model.vo.TuitionStudentMake;

public interface TuitionService {
	
	int insertTuitionPay(Tuition t);
	
	ArrayList<Tuition> tuitionBillForm(Tuition t);
	
	ArrayList<AdminTuitionMake> tuitionMakeForm();

	AdminTuitionMake latestTuition();

	List<TuitionStudentMake> makeTuitionStudent();

}
