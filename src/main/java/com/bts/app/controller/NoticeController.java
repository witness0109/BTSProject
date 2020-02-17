package com.bts.app.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.board.BoardService;
import com.bts.app.board.BoardVO;
import com.bts.app.board.PageMaker;
import com.bts.app.board.ReplyService;
import com.bts.app.board.ReplyVO;
import com.bts.app.notice.NoticeService;
import com.bts.app.notice.NoticeVO;
import com.bts.app.notice.PageMaker2;
import com.bts.app.notice.PagingCriteria2;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	
	@RequestMapping("/noticelist")
	public String getnoticelist(PagingCriteria2 cri2, Model model) {
		List<NoticeVO> list = service.getnoticelist(cri2);
		int total = service.totalCnt();
		
		// Model 정보 저장
		model.addAttribute("boardlist",list);
		model.addAttribute("paging",new PageMaker2(cri2,total));
		return "Notice/noticelist"; // View 이름 리턴
		
	}
	
	@RequestMapping(value="/noticewrite", method=RequestMethod.GET)
	public ModelAndView noticewrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("Notice/noticewriteform");
		return mav;
		
	}
	
	@RequestMapping(value="/noticewrite", method=RequestMethod.POST)
	public ModelAndView noticewrite(NoticeVO vo) throws IOException {
		ModelAndView mav = new ModelAndView();
		int result = service.namecheck(vo);
		if(result != 0) {
			int a = service.insertnotice(vo);
			if(a == 1) {
				mav.addObject("result", "게시물 작성 완료");
				mav.setViewName("Notice/noticewritesuccess");
			}
		} else {
			mav.setViewName("Notice/memberinsert");
		}
		
		return mav;
		
	}
	
	@RequestMapping("/noticedetail")
	public ModelAndView getnoticedetail(int seq) {
		ModelAndView mav = new ModelAndView();
		
		NoticeVO vo = service.getnoticedetail(seq);
		
		
		mav.addObject("detail", vo);
		mav.setViewName("Notice/noticedetail");
		return mav;
	}
	
	@RequestMapping(value="/noticeupdate" , method=RequestMethod.GET)
	public ModelAndView noticeupdateview(int seq,NoticeVO vo) {
		ModelAndView mav = new ModelAndView();

		NoticeVO board =service.getnoticedetail(seq);
		
		mav.addObject("vo", board);
		mav.setViewName("Notice/noticeupdate");
		return mav;
		
	}
	
	@RequestMapping(value="/noticeupdate" , method=RequestMethod.POST)
	public ModelAndView noticeupdate(NoticeVO vo) {
		ModelAndView mav = new ModelAndView();
		
		service.noticeupdate(vo);
		
		mav.setViewName("redirect:/noticelist");
		
		return mav;
	}
	
	@RequestMapping(value="/noticedelete")
	public String noticedelete(int seq) {
		service.noticedelete(seq);
		
		return "redirect:/noticelist";
	}

}
