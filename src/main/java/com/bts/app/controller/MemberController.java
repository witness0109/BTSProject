package com.bts.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberService;
import com.bts.app.MemberVO;

@Controller
public class MemberController {
@Autowired
MemberService service;

@RequestMapping(value="/join", method = RequestMethod.GET)
public ModelAndView joinMemberService(MemberVO vo) {
	ModelAndView mav = new ModelAndView();
	return mav;
}



@RequestMapping(value="/join", method = RequestMethod.POST)
public void joinMemberServiceresult(MemberVO vo) {
	service.joinMember(vo);
	
}


	
}
