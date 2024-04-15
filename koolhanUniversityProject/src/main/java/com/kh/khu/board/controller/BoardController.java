package com.kh.khu.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.khu.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
}
