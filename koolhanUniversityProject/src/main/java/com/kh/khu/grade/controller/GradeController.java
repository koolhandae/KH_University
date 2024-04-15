package com.kh.khu.grade.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.grade.model.service.GradeService;

@Controller
public class GradeController {

	@Autowired
	private GradeService gService;
	
}
