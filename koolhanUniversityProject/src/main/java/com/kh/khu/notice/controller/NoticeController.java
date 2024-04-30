package com.kh.khu.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@ResponseBody
	@RequestMapping(value="insert.no",produces = "application/json; charset=utf-8")
	public int insertNotice(String noticeTitle,String noticeWriter, String noticeContent, HttpSession session) {
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeWriter(noticeWriter);
		n.setNoticeContent(noticeContent);
		
		int result = nService.insertNotice(n);
		return result;
	}
	
	@RequestMapping("adminNTenrollSuccess.do")
	public String NoticeListgogoPage(HttpSession session) {
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
			alertMsg.put("icon", "success");
			alertMsg.put("title", "공지사항 작성 완료.");
			alertMsg.put("text", "성공적으로 공지사항이 작성되었습니다.");
			session.setAttribute("alertMsg", alertMsg);
			return "redirect:list.no";
	}

	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		mv.addObject("n",nService.selectNotice(nno)).setViewName("admin/noticeDetailView");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="mainList.no", produces="application/json; charset=utf-8")
	public ArrayList<Notice> selectMainList() {
		return nService.selectMainList();
	}
	
	@RequestMapping("noticeUpdateForm.bo")
	public String noticeUpdateForm(int nno, Model model) {
		model.addAttribute("n",nService.selectNotice(nno));
		return "admin/noticeUpdateForm";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="noticeUpdate.no", produces="application/json; charset=utf-8")
	public int noticeUpdate(int noticeNo,String noticeTitle,String noticeWriter, String noticeContent,HttpSession session) {
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeWriter(noticeWriter);
		n.setNoticeContent(noticeContent);
		n.setNoticeNo(noticeNo);
		
		HashMap<String, Object> alertMsg = new HashMap<String, Object>();
		alertMsg.put("icon", "success");
		alertMsg.put("title", "공지사항 수정 완료.");
		alertMsg.put("text", "성공적으로 공지사항이 수정되었습니다.");
		session.setAttribute("alertMsg", alertMsg);
		
		int result = nService.updateNotice(n);
		return  result;
	}
	
	@RequestMapping(value="noticeDelete.bo")
	public String deleteNotice(int nno,HttpSession session ) {
		int result = nService.deleteNotice(nno);
		
		
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
			alertMsg.put("icon", "success");
			alertMsg.put("title", "공지사항 삭제 완료.");
			alertMsg.put("text", "성공적으로 공지사항이 삭제되었습니다.");
			session.setAttribute("alertMsg", alertMsg);
			return "redirect:list.no";
		
	}
	
}
