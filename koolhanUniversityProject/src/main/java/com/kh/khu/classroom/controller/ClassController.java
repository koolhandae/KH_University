package com.kh.khu.classroom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.service.ClassService;
import com.kh.khu.classroom.model.service.ClassServiceImpl;
import com.kh.khu.classroom.model.vo.ClassBoard;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.student.model.service.StudentService;

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
    @Autowired
    private HttpServletRequest request;
	
	@RequestMapping("classEnroll.co")
	public String classEnrollForm() {
		return "professor/professorClassEnrollForm";
	}
	
	@Autowired
	private StudentService sService;
	
//	@RequestMapping("classList.bo")
//	public String classListReal() {
//		return "professor/professorClassListView";
//	}
	

	@RequestMapping(value="classList.bo")
	public ModelAndView classList(@RequestParam(value="cpage", defaultValue="1")int currentPage,ModelAndView mv,HttpSession session) {
		//cpage에 아무것도 안줬을때는 1을 준다
		//classList.co?cpage=2를 주면 sysout에 2가 찍히고
		//classList.co 이렇게 아무것도 안주면 defaultValue인 1이 찍힘
		
		
		// 세션에서 loginUser 정보 가져오기
	    Member loginUser = (Member)session.getAttribute("loginUser");
	    
	    // 세션에서 memberId 가져오기
	    String memberId = loginUser.getMemberId();
	    //System.out.println("class 멤버아이디조회" + memberId);
	     
		int listCount = cService.selectClassListCount(memberId); // 총게시글의 갯수


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//진짜로 목록조회
		ArrayList<Classroom> list = cService.selectClassList(pi, memberId);
		//System.out.println("list" + list);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("professor/professorClassListView");
		return mv;
		
		//		return new Gson().toJson(list);
		
	}
	
	@RequestMapping("insertClass.do")
	public String insertClass(int profNo, Classroom c, MultipartFile fileupload,HttpSession session,Model model) {
		//System.out.println("class c"+c);
		//System.out.println("class fileupload"+fileupload);
		//System.out.println("class memberNo"+profNo);
		
		c.setProfNo(profNo);
		
		
		if(!fileupload.getOriginalFilename().equals("")) { //전달된 파일의 이름이 비어있는게 아닐때
			
			
			// 파일명 수정 작업 후 서버에 업로드 시키기 ("flower.png" => "202404151510"+랜덤숫자 5개.png")
			String changeName = SaveFile(fileupload,session);
			
			// 원본명, 서버업로드된 경로를 Classroom c에 이어서 담기
			c.setOriginName(fileupload.getOriginalFilename()); //오리지널네임이 들어감
			c.setChangeName("resources/classPlanFile/" + changeName);
			
			//
		}
		
		// 넘어온 첨부파일 있을 경우 : 제목, 작성자, 내용, 파일
		// 넘어온 첨부파일 없을 경우 : 제목, 작성자, 내용
		
		int result = cService.insertClass(c);
		
		if(result>0) { //성공
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "성공!");
	         alertMsg.put("text", "성공적으로 강의 등록이 완료되었습니다");
	         session.setAttribute("alertMsg", alertMsg);
			 return "redirect:classList.bo";
		}else {
			//실패
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage500";
		}
		
		
		
	}
	
	// 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키고, 바뀐 파일명 리턴하는 함수
	public String SaveFile(MultipartFile fileupload,HttpSession session) {
		
		String originName = fileupload.getOriginalFilename(); //"flower.png"
		
		//"20240415151005"(년월시분초)
		//String currentTime = new SimpleDateFormat("특정포맷").format("특정날짜")
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); //5자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		//ex) flower.png 에서 점을 찾고 점부터 자름 그래서 .png이게 담김
		
		String changeName = currentTime + ranNum + ext; //바뀐파일명 완성
		
				
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("resources/classPlanFile/");
		
	
		try {
			fileupload.transferTo(new File(savePath+changeName));
			//이 경로에 (savePath) changeName 바뀐이름으로 저장해줘
			// 우리 로컬에 바뀐이름이 저장됨
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	@RequestMapping(value="professorPJEnrollForm.do")
	public String projectEnrollForm() {
		return "professor/professorHomeworkEnrollForm";
	}
	
	@ResponseBody
	@RequestMapping(value="classSelectAjax.do",produces="application/json; charset=utf-8")
	public String classSelectAjaxMethod(String memberId) {
		//System.out.println("memberId" + memberId);
		ArrayList<Classroom> list = cService.classSelect(memberId);
		//System.out.println("project list select list" + list);
		
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	
	// 강의실 자유게시판 리스트 조회
	
	@ResponseBody
	@RequestMapping(value="board.co", produces="application/json; charset=utf-8")
	public ModelAndView selectBoardListCounst(@RequestParam(value="bpage", defaultValue="1")int currentPage, 
			                                  ModelAndView mv, HttpSession session) {
		
		String classNum = (String)session.getAttribute("classNum");
		
		Map<String, Object> response = new HashMap();
		
		//System.out.println("boardList" + classNum);
		
		ArrayList<Course> c = sService.selectClassName(classNum);
		String className = c.get(0).getClassName();
		
		int boardCount = cService.selectBoardListCount(classNum);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 5, 5);
		ArrayList<ClassBoard> list = cService.selectClassBoardList(pi, classNum);
			
		mv.addObject("pi", pi).addObject("list", list).addObject("className", className).setViewName("student/studentClassBoardList");
		return mv;
	}
	
	@RequestMapping(value="boardDetail.co")
	public String selectClassBoardDetail(@RequestParam(value="bno")String bno, 
			                             @RequestParam(value="classNum")String classNum, Model model) {
		
		//System.out.println(bno);
		//System.out.println(classNum);
		
		int boardCount = cService.classBoardCount(bno, classNum);
		
		if(boardCount > 0) {
			ClassBoard cb = cService.selectClassDetailBoard(bno, classNum);
			model.addAttribute("cb", cb);
			model.addAttribute("classNum", classNum);
			
			//System.out.println("자유게시판" + cb);
			return "student/studentClassBoardDetail";
			
		}else {
			model.addAttribute("errorMsg", "수강 자유게시판 세부조회에 실패하셨습니다.");
			return "common/errorPage404";
		}
	}
	@RequestMapping(value="classDetail.co")
	public String selectClassDetail(int cno,Model model ) {
		// cno라는 키값을 가져왔음
		// cno에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		Classroom c = cService.selectClassDetail(cno);
		model.addAttribute("c",c);
		return "professor/professorClassDetailView";
		
	}
	
	@RequestMapping("classDelete.co")
	public String deleteClass(int cno, String filePath, HttpSession session, Model model) {
		int result = cService.delectClass(cno);
		
		if(result>0) { //삭제성공
			
			if(!filePath.equals("")) {//파일이 있을경우
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
            alertMsg.put("icon", "success");
            alertMsg.put("title", "완료!");
            alertMsg.put("text", "성공적으로 강의가 삭제되었습니다!");
            session.setAttribute("alertMsg", alertMsg);
            return "redirect:classList.bo"; 
		}else {
			// 삭제실패
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
            alertMsg.put("icon", "error");
            alertMsg.put("title", "실패");
            alertMsg.put("text", "강의 삭제가 실패했습니다. 다시 시도해주세요.");
            session.setAttribute("alertMsg", alertMsg);
            return "professor/professorClassDetailView";
		}
		
	}
	
	@RequestMapping("classUpdateForm.co")
	public String classUpdateForm(int cno, Model model ) {
		model.addAttribute("c",cService.selectClassDetail(cno));
		return "professor/professorClassUpdateForm";
	}
	
	@RequestMapping("professorUpdateClass.do")
	public String professorUpdateClass(Classroom c, MultipartFile reFileupload, HttpSession session, Model model ) {
		
		//새로 넘어온 첨부파일이 있을 경우
		if(reFileupload != null && !reFileupload.getOriginalFilename().equals("")) {
			if(c.getOriginName()!=null) {
				new File(session.getServletContext().getRealPath(c.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버에 업로드 시키기
			String changeName = SaveFile(reFileupload,session);
			
			c.setOriginName(reFileupload.getOriginalFilename());
			c.setChangeName("resources/classPlanFile/" + changeName);
			
		}
		int result = cService.professorClassUpdate(c);
		
		if(result>0) {
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "성공!");
	         alertMsg.put("text", "성공적으로 강의 수정이 완료되었습니다");
	         session.setAttribute("alertMsg", alertMsg);
	         
	         return "redirect:classDetail.co?cno=" + c.getClassNo();
		}else { // 수정 실패 => 에러페이지
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "error");
	         alertMsg.put("title", "실패");
	         alertMsg.put("text", "오류가 발생했습니다. 다시 시도해주세요.");
	         session.setAttribute("alertMsg", alertMsg);
			return "common/errorPage404";
			
		}
	}
	
	@RequestMapping(value="professorGDEnroll.do")
	public ModelAndView selectClassList(@RequestParam(value="cpage", defaultValue="1")int currentPage,ModelAndView mv,HttpSession session) {
		//cpage에 아무것도 안줬을때는 1을 준다
				//classList.co?cpage=2를 주면 sysout에 2가 찍히고
				//classList.co 이렇게 아무것도 안주면 defaultValue인 1이 찍힘
				
				
				// 세션에서 loginUser 정보 가져오기
			    Member loginUser = (Member)session.getAttribute("loginUser");
			    
			    // 세션에서 memberId 가져오기
			    String memberId = loginUser.getMemberId();
			    //System.out.println("class 멤버아이디조회" + memberId);
			     
				int listCount = cService.selectClassListCount(memberId); // 총게시글의 갯수


				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
				
				//진짜로 목록조회
				ArrayList<Classroom> list = cService.selectClassList(pi, memberId);
				//System.out.println("list" + list);
				mv.addObject("pi",pi)
				  .addObject("list",list)
				  .setViewName("professor/professorGradeList");
				return mv;
				
	}
	
}
