package com.kh.khu.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.project.model.service.ProjectService;
import com.kh.khu.project.model.vo.Project;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@ResponseBody
	@RequestMapping(value="professorProjectEnrollForm.do",produces = "application/json; charset=utf-8")
	public int insertProject(String pjClassName, String pjDeadline, String pjTitle, String pjContent, String pjProfessor,HttpSession session) {
		
		Project pj = new Project();
		pj.setPjClassName(pjClassName);
		pj.setPjDeadline(pjDeadline);
		pj.setPjTitle(pjTitle);
		pj.setPjContent(pjContent);
		pj.setPjProfessor(pjProfessor);
		
		
		
		System.out.println("controller project p"+pj);
		
		int result = pService.insertProject(pj);
		
		return result;
		
	}
	

	@RequestMapping("professorPJenrollSuccess.do")
	public String successProjectPagegogo(HttpSession session) {
		HashMap<String, Object> alertMsg = new HashMap<String, Object>();
        alertMsg.put("icon", "success");
        alertMsg.put("title", "성공!");
        alertMsg.put("text", "성공적으로 과제 등록이 완료되었습니다");
        session.setAttribute("alertMsg", alertMsg);
		return "professor/professorHomeworkDetail";
	}
	
	@RequestMapping(value="professorPJStateList.do")
	public String projectEnrollForm() {
		return "professor/professorHomeworkState";
	}
	
	@ResponseBody
	@RequestMapping(value="projectAllSelectAjax.do",produces="application/json; charset=utf-8")
	public String classAllSelectAjaxMethod(String memberId) {
		ArrayList<Project> list = pService.selectProjectList(memberId);
		System.out.println("list" + list);
		
		return new Gson().toJson(list);
	}
	
	
	
	
	
}
