package com.kh.khu.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.util.LoggingInputStream;
import com.google.gson.Gson;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.project.model.service.ProjectService;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.project.model.vo.StudentProject;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Student;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@Autowired
	private StudentService sService;
	
	@ResponseBody
	@RequestMapping(value="professorProjectEnrollForm.do",produces = "application/json; charset=utf-8")
	public int insertProject(String pjClassName, String pjDeadline, String pjTitle, String pjContent, String pjProfessor,HttpSession session, String classNo) {
		
		Project pj = new Project();
		pj.setPjClassName(pjClassName);
		pj.setPjDeadline(pjDeadline);
		pj.setPjTitle(pjTitle);
		pj.setPjContent(pjContent);
		pj.setPjProfessor(pjProfessor);
		pj.setPjClassNo(classNo);
		
		
		int result = pService.insertProject(pj);

		System.out.println("왜안돼=" + pj);
		//Project p = pService.selectProjectNo();
		

		// insert시 학생프로젝트 테이블에(진행중 상태로)도 등록되게 끔 추가		
			if(result>0) {
				
//				System.out.println("고유번호 와지나" + p);
				
				ArrayList<Course> sList = pService.selectCourseStudent(classNo);
				
				ArrayList<String> studentNos = new ArrayList();
				
				// System.out.println("학생들조회" + sList);
				
				if(sList != null) {		
					for(Course c : sList) {
						int sno = c.getStudentNo();
						
						System.out.println("sno값=" + sno);
						//String studentNo = Integer.toString(studentNoInt);
						//studentNos.add(studentNo);
	
						int resultStu = pService.insertStuProjectTable(sno, classNo);
						}
				}
			}
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
	
	@ResponseBody
	@RequestMapping(value="project.st")
	public ModelAndView selectStudentProject( ModelAndView mv,HttpSession session) {
		
		//System.out.println(classNum);
		String classNum = (String)session.getAttribute("classNum");
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int studentNo = loginStudent.getStudentNo();
		
		ArrayList<StudentProject> spList = pService.selectStudentProject(classNum, studentNo);
		ArrayList<Course> c = sService.selectClassName(classNum);
		
		System.out.println(spList);
		
		//System.out.println("rnum되냐" + spList.get(0).getRnum());
		String className = c.get(0).getClassName();
		int pjCount = pService.ingProjectCount(classNum, studentNo);
		int pjCountMiss = pService.missProjectCount(classNum, studentNo);
		int pjCountDone = pService.doneProjectCount(classNum, studentNo);
		
		session.setAttribute("pjCount", pjCount);
		session.setAttribute("pjCountMiss", pjCountMiss);
		session.setAttribute("pjCountDone", pjCountDone);
		session.setAttribute("studentNo", studentNo);
		session.setAttribute("classNum", classNum);
		session.setAttribute("className", className);
		
		mv.addObject("spList", spList).setViewName("student/studentHomeworkView");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("projectView.st")
	public ModelAndView projectViewStudent(@RequestParam(value="pjno")String pjno, ModelAndView mv) {
		Project p = pService.projectViewStudent(pjno);
		mv.addObject("p", p).setViewName("student/studentHomeWorkFileView");

		return mv;
	}
	

	
	@ResponseBody
	@RequestMapping(value="enrollProject.st", produces="application/json; charset=utf-8")
	public Map<String, Object> enrollProjectStudent(@RequestParam(value="pjno", required=false) String pjno,
	                                   @RequestParam(value="file", required=false) MultipartFile file,
	                                   HttpSession session) {

		 System.out.println("파일 있냐"+file);
			
		String classNum = (String)session.getAttribute("classNum");
		int studentNo = (Integer) session.getAttribute("studentNo");
		
		 Map<String, Object> response = new HashMap();
		
		try {
	        System.out.println("pjno: " + pjno);
	        
	        
	        if (!file.getOriginalFilename().equals("")) {
	           
	        	String changeName = saveFile(file, session);
	        	int pjNo = Integer.parseInt(pjno);	        	
	        	
	        	StudentProject sp = new StudentProject();
	        	
	        	sp.setStpOriginName(file.getOriginalFilename());
				sp.setStpChangeName("resources/projectFiles/" + changeName);
				sp.setStpPjNo(pjNo);
				sp.setStudentNo(studentNo);
				
	            int result = pService.enrollProjectStudent(sp);
	            
	            if (result > 0) {	                   
	            	response.put("success", true);
	            }
		    }
	        
		    }catch (Exception e) {   
		        e.printStackTrace();
		      
		    }
		    return response;
	}
	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키고, 바뀐 파일명을 리턴해서 보내주는 함수
		public String saveFile(MultipartFile upfile, HttpSession session) { // 사용자가 준 첨부파일, session
			String originName = upfile.getOriginalFilename(); // "flower.png"
			
			// "20240405030705" (년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20240403030905"
			int ranNum = (int)(Math.random() * 90000 + 10000); // 23152 (5자리 랜덤값)
			String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .부터 잘라줌! (.png)
			
			// 같은시간에 업로드할경우를 대비해서 년분일시분초 + 5자리 랜덤값 + 파일확장명
			String changeName = currentTime + ranNum + ext;
			
			// 원하는 파일에 저장하기위해 업로드시키고자 하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/projectFiles/");
			      					// application scope             // webapp : / , uploadFiles 안에 넣어야하므로 뒤에 / 꼭 붙이기!
		
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
			}

	
	@RequestMapping(value="projectDoneView.st")
	public String studentDoneView(HttpSession session) {
		HashMap<String, Object> alertMsg = new HashMap<String, Object>();
        alertMsg.put("icon", "success");
        alertMsg.put("text", "성공적으로 과제를 제출하였습니다");
        session.setAttribute("alertMsg", alertMsg);
        
		return "redirect:projectDone.st";
	}
	
	
	@RequestMapping(value="projectDone.st", produces="application/json; charset=utf-8")
	public ModelAndView studentDoneProject(ModelAndView mv, HttpSession session) {
		
		String classNum = (String)session.getAttribute("classNum");
		int studentNo = (Integer)session.getAttribute("studentNo");
		
		System.out.println("갑자기 왜안되냐" + studentNo);

		 ArrayList<StudentProject> spList = pService.selectStudentDoneProject(studentNo, classNum);
         	System.out.println("sPLIST뭘까" + spList);

    		mv.addObject("spList", spList).setViewName("student/studentDoneProjectPage");
    		return mv;
	}
	

	@RequestMapping(value="projectNone.st")
	public ModelAndView studentNoneProject(HttpSession session, ModelAndView mv) {
		
			String classNum = (String)session.getAttribute("classNum");
			int studentNo = (Integer)session.getAttribute("studentNo");
			
			System.out.println("가져오나1" + classNum);
			System.out.println("가져오나2" + studentNo);
		
			ArrayList<StudentProject> spList = pService.selectStudentNoneProject(studentNo, classNum);
         	System.out.println("sPLIST뭘까 NONE" + spList);
         	
         	mv.addObject("spList", spList).setViewName("student/studentNoneProjectPage");
    		return mv;
	}

}
