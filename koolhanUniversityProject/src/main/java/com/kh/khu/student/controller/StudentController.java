package com.kh.khu.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.student.model.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	
}
