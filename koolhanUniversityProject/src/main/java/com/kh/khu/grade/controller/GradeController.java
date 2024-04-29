package com.kh.khu.grade.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.khu.classroom.model.service.ClassService;
import com.kh.khu.classroom.model.service.ClassServiceImpl;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.grade.model.service.GradeService;
import com.kh.khu.grade.model.vo.Grade;
import com.kh.khu.member.model.vo.Member;

@Controller
public class GradeController {

	@Autowired
	private GradeService gService;
	
	@Autowired
	private ClassService cService;
	
	@RequestMapping("professorGradeStuList.co")
	public ModelAndView selectGradeStuList(@RequestParam(value="cpage", defaultValue="1")int currentPage,ModelAndView mv,int gno ) {
		// gno라는 키값을 가져왔음
		// g no에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		
		int listCount = gService.selectGradeStuCount(gno);
		
		
		Grade g = gService.selectGradeDetail(gno);
		//model.addAttribute("g",g);
		//return "professor/professorGradeStudentList";
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		//진짜로 목록조회
		ArrayList<Grade> list = gService.selectGradeStuList(pi, gno);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .addObject("gd",g)
		  .setViewName("professor/professorGradeStudentList");
		
		return mv;
		
	}
	
	@ResponseBody
	@PostMapping("inputGradeAjax.do") // Ajax 요청의 URL
    public String inputGradeAjax(@RequestBody ArrayList<Grade> gradesData) {
        // gradesData에는 Ajax 요청으로 전송된 학생 성적 데이터가 자동으로 매핑됩니다.
        // 이후 이 데이터를 원하는 대로 처리할 수 있습니다.
		
		//ArrayList<Grade> list = new ArrayList<Grade>();
		//System.out.println(gradesData);
		//for (Grade grade : gradesData) {
            // 여기에 필요한 작업을 수행합니다.
            // 예: 데이터베이스에 저장, 비즈니스 로직 수행 등
			
        	//System.out.println("컨트롤러"+ grade);
        	int result =  gService.insertGradeStudent(gradesData);

   			return new Gson().toJson(result);
        		
    }
	
	@ResponseBody
	@PostMapping("updateGradeAjax.do")
	public String updateGradeAjax(@RequestBody ArrayList<Grade> gradesData) {
    	int result =  gService.updateGradeStudent(gradesData);

		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="selectGradeAjax.do",produces="application/json; charset=utf-8")
	public String selectProfessorInputStudent(@RequestParam("classNo")Integer classNo) {
		//System.out.println("이거 타나?"+classNo);
		ArrayList<Grade> list =  gService.selectProfessorInputStudent(classNo);
		
		return new Gson().toJson(list);
	
	}
	
	@RequestMapping("courseScore.st")
	public String courseScoreView() {
		return "student/studentScorePage";
	}
	
	@ResponseBody
	@RequestMapping(value="selectScore.st" , produces="application/json; charset=utf-8")
	public HashMap<String, Object> selectScoreStudent(@RequestParam(value="stuNo")int stuNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Course> cList = gService.selectScoreYear(stuNo);
		ArrayList<Grade> gList = gService.selectScoreStudent(stuNo);
		
		map.put("cList", cList);
		map.put("gList", gList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="chooseScore.st")
	public ArrayList<Grade> chooseScoreStudent(@RequestParam("year")String year,
			                                   @RequestParam("term")String term,
			                                   @RequestParam("stuNo")int stuNo){
		
		ArrayList<Grade> gList = gService.chooseScoreStudent(year, term, stuNo);
		return gList;
	}
	
	
}
