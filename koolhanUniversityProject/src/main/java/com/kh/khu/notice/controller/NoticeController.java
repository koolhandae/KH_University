package com.kh.khu.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.notice.model.service.NoticeServiceImpl;
import com.kh.khu.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl nService;
	
	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/noticeListView");
		
		return mv;
	}
	
	@RequestMapping("insertForm.no")
	public String noticeEnrollForm() {
		return "admin/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public ModelAndView insertNotice(Notice n, ModelAndView mv) {
		System.out.println(n);
		int result = nService.insertNotice(n);
		if(result > 0) { //성공
			mv.addObject("alertMsg", "성공적으로 추가되었습니다.");
			mv.setViewName("redirect:list.no");
		}else {
			mv.addObject("errorMsg", "공지사항 등록 실패");
			mv.setViewName("common/errorPage500");
		}
		return mv;
	}
	
//	@RequestMapping("detail.no")
//	public ModelAndView 
	
}
