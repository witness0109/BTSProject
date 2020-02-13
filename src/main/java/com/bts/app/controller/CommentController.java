package com.bts.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bts.app.board.ReplyService;
import com.bts.app.board.ReplyVO;

@Controller
public class CommentController {

	@Autowired
	ReplyService service;
	
	@RequestMapping("/replylist")
	@ResponseBody
	private List<ReplyVO> commentList(Model model) {
		return service.commentList();
	}
	
	@RequestMapping("/replyinsert")
	@ResponseBody
	private int commentInsert(@RequestParam int seq, @RequestParam String contents, HttpSession session) {
		
		ReplyVO vo = new ReplyVO();
		vo.setSeq(seq);
		vo.setContents(contents);
		vo.setWriter((String) session.getAttribute("id"));
		
		
		return service.commentInsert(vo);
		
	}
	
	@RequestMapping("/replyupdate")
	@ResponseBody
	private int commentUpdate(@RequestParam int rno, @RequestParam String contents) {
		ReplyVO vo = new ReplyVO();
		vo.setRno(rno);
		vo.setContents(contents);
		
		return service.commentUpdate(vo);
	}
	
	@RequestMapping("/replydelete")
	@ResponseBody
	private int commentDelete(@PathVariable int rno) {
		return service.commentDelete(rno);
	}
}
