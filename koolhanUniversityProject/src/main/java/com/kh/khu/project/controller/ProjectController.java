package com.kh.khu.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.project.model.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
}
