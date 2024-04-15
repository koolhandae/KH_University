package com.kh.khu.classroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.classroom.model.service.ClassService;

@Controller
public class ClassController {

	@Autowired
	private ClassService cService;
}
