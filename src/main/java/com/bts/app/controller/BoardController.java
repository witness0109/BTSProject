package com.bts.app.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.board.BoardService;
import com.bts.app.board.BoardVO;
import com.bts.app.board.PageMaker;
import com.bts.app.board.PagingCriteria;
import com.bts.app.board.ReplyService;
import com.bts.app.board.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	
	@RequestMapping("/boardlist")
	public String getBoardList(PagingCriteria cri, Model model) {
		List<BoardVO> list = service.getBoardList(cri);
		int total = service.totalCnt();
		
		// Model 정보 저장
		model.addAttribute("boardlist",list);
		model.addAttribute("paging",new PageMaker(cri,total));
		return "Board/boardlist"; // View 이름 리턴
		
	}
	

	@RequestMapping(value="/boardwrite", method=RequestMethod.GET)
	public ModelAndView BoardWrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("Board/writeform");
		return mav;
		
	}
	
	@RequestMapping(value="/boardwrite", method=RequestMethod.POST)
	public ModelAndView BoardWrite(BoardVO vo) throws IOException {
		ModelAndView mav = new ModelAndView();
		int result = service.namecheck(vo);
		if(result != 0) {
			int a = service.insertBoard(vo);
			if(a == 1) {
				mav.addObject("result", "게시물 작성 완료");
				mav.setViewName("Board/boardwritesuccess");
			}
		} else {
			mav.setViewName("Board/memberinsert");
		}
		
		return mav;
		
	}
	
	@RequestMapping("/boarddetail")
	public ModelAndView getBoardDetail(int seq) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO vo = service.getBoardDetail(seq);
		
		
		mav.addObject("detail", vo);
		mav.setViewName("Board/boarddetail");
		return mav;
	}
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)
	public ModelAndView updateview(int seq,BoardVO vo) {
		ModelAndView mav = new ModelAndView();

		BoardVO board =service.getBoardDetail(seq);
		
		mav.addObject("vo", board);
		mav.setViewName("Board/update");
		return mav;
		
	}
	
	@RequestMapping(value="/update" , method=RequestMethod.POST)
	public ModelAndView update(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		
		service.update(vo);
		
		mav.setViewName("redirect:/boardlist");
		
		return mav;
	}
	
	@RequestMapping(value="/deleteboard")
	public String delete(int seq) {
		service.delete(seq);
		
		return "redirect:/boardlist";
	}
	
	

}
