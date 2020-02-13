package com.bts.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberVO;
import com.bts.app.SystemService;


@Controller
public class SystemContorller {
	@Autowired
	SystemService service;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/manageMember")
	public ModelAndView getEmpList() {
		ModelAndView mav = new ModelAndView();

		List<MemberVO> list = service.getAllMem();
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
