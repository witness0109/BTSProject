package com.bts.app.board;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	//Modelattribute =  mav.addbject 
	
	@RequestMapping("/boardlist")
	public ModelAndView getAllBoard() {
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> list = service.getAlLBoard();
		mav.addObject("boardlist", list);
		mav.setViewName("Board/boardlist");
		
		return mav;
		
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
