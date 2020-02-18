package com.bts.app.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberVO;
import com.bts.app.SystemService;
import com.bts.app.board.BoardVO;
import com.bts.app.board.PageMaker;
import com.bts.app.board.PagingCriteria;


@Controller
public class SystemContorller {
	@Autowired
	SystemService service;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/manageMember")
	public ModelAndView getEmpList(PagingCriteria cri, Model model) {
		ModelAndView mav = new ModelAndView();
		int total = service.memberCnt();

		List<MemberVO> list = service.getMemberList(cri);
		model.addAttribute("manageMember",list);
		model.addAttribute("paging", new PageMaker(cri,total));
		

		mav.addObject("list", list);

		mav.setViewName("System/manageMember");
		return mav;
	}
	
	@RequestMapping("/kickMember")
	public String kikcMember(String id) {
		
		service.deleteMem(id);
		
		return "redirect:/manageMember";
	}
	
	
	
}
