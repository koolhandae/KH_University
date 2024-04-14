package com.kh.khu.scholarships.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.scholarships.model.service.ScholarshipsService;

@Controller
public class ScholarshipsController {

	@Autowired
	private ScholarshipsService sService;
	
}
