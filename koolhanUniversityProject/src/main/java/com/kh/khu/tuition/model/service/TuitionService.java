package com.kh.khu.tuition.model.service;

import java.util.ArrayList;

import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;

public interface TuitionService {
	
	int insertTuitionPay(Tuition t);
	
	ArrayList<Tuition> tuitionBillForm(Tuition t);
	
	ArrayList<AdminTuitionMake> tuitionMakeForm(AdminTuitionMake at);

}
