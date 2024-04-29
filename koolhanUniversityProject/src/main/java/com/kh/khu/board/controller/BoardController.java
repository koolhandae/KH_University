package com.kh.khu.board.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.khu.board.model.service.BoardService;
import com.kh.khu.board.model.vo.Board;
import com.kh.khu.board.model.vo.Reply;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.common.template.SaveFile;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("board/boardListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String boardEnrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, Model model, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.saveFile(upfile, session);
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/b_" + changeName);
		}
		
		int result = bService.insertBoard(b);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(result>0) { 
			map.put("title", "게시글 등록 성공");
			map.put("text", "성공적으로 게시글을 등록했습니다.");
			map.put("icon", "success");
			session.setAttribute("alertMsg", map);
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		int result = bService.increaseCount(bno);
		if(result > 0) {
			Board b = bService.selectBoard(bno);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) { 
		int result = bService.deleteBoard(bno);
		HashMap<String , Object> map = new HashMap<String, Object>();
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			map.put("title", "게시글 삭제 성공");
			map.put("text", "성공적으로 게시글을 삭제했습니다.");
			map.put("icon", "success");
			session.setAttribute("alertMsg", map);
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b", bService.selectBoard(bno));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(Board b, MultipartFile reupfile, HttpSession session, ModelAndView mv) {
		//System.out.println(session.getServletContext().getRealPath(b.getChangeName()));
		if(!reupfile.getOriginalFilename().equals("")){
			new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			String changeName = SaveFile.saveFile(reupfile, session);
			b.setChangeName("/resources/uploadFiles/" + changeName);
			b.setOriginName(reupfile.getOriginalFilename());
		}
		int result = bService.updateBoard(b);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(result > 0) { 
			map.put("title", "게시글 수정 성공");
			map.put("text", "성공적으로 게시글을 수정했습니다.");
			map.put("icon", "success");
			session.setAttribute("alertMsg", map);
			mv.addObject("b", b);
			mv.setViewName("redirect:detail.bo?bno="+b.getBoardNo());
		} else { 
			mv.addObject("errorMsg", "게시글 수정실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String selectRelpyList(int bno) {
		return new Gson().toJson(bService.selectReplyList(bno));
	}
	
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public String insertReply(Reply r) {
		int result = bService.insertReply(r);
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	
	
}
