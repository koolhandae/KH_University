package com.kh.khu.classroom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.service.ClassService;
import com.kh.khu.classroom.model.service.ClassServiceImpl;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.project.model.vo.Project;

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
	@RequestMapping("classEnroll.co")
	public String classEnrollForm() {
		return "professor/professorClassEnrollForm";
	}
	
	
	@RequestMapping("insertClass.do")
	public String insertClass(int profNo, Classroom c, MultipartFile fileupload,HttpSession session,Model model) {
		System.out.println("class c"+c);
		System.out.println("class fileupload"+fileupload);
		System.out.println("class memberNo"+profNo);
		
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
			 return "professor/professorClassListView";
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
		} catch (IllegalStateException | IOException e) {
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
		System.out.println("memberId" + memberId);
		ArrayList<Classroom> list = cService.classSelect(memberId);
		System.out.println("list" + list);
		
		return new Gson().toJson(list);
	}
}
