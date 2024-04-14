package com.kh.khu.tuition.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.tuition.model.service.TuitionService;

@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService tService;

}
