package com.kh.khu.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.project.model.service.ProjectService;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.project.model.vo.StudentProject;

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
		return "redirect:professorPJStateList.do";
	}
	
	@RequestMapping(value="professorPJStateList.do")
	public ModelAndView projectList(@RequestParam(value="cpage",defaultValue="1")int currentPage,ModelAndView mv, HttpSession session) {
		// cpage에 아무것도 안줬을때는 1을 준다
		// professorPJStateList.do 이렇게 아무것도 안주면 defaultValue인 1이찍힘
		
		// 세션에서 loginUser정보 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 세션에서 memberId가져오기
		String memberId = loginUser.getMemberId();
		
		// 총 게시글의 갯수
		int listCount = pService.selectProfessorProjectListCount(memberId);
		
		PageInfo  pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//찐 목록조회
		ArrayList<Project> list = pService.selectProfessorProjectList(pi,memberId);
		
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("professor/professorHomeworkState");
		
		
		
		return mv;
	}
	
	@RequestMapping(value="professorProjectDetail.do")
	public String selectProfessorProjectDetail(int pno, Model model){
		//pno라는 키값을 가져왔음
		//pno에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		Project p = pService.selectProfessorProjectDetail(pno);
		model.addAttribute("p",p);
		
		return "professor/professorHomeworkDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="projectAllSelectAjax.do",produces="application/json; charset=utf-8")
	public String classAllSelectAjaxMethod(String memberId) {
		ArrayList<Project> list = pService.selectProjectList(memberId);
		System.out.println("list" + list);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="project.st")
	public String selectProjectList(@RequestParam(value="classNum") String classNum, 
									@RequestParam(value="stuId") String studentId) {
		ArrayList<StudentProject> spList = pService.selectStudentProject(classNum, studentId);
		
		return "student/studentHomeworkView";
	}
	
	
	
	
}
