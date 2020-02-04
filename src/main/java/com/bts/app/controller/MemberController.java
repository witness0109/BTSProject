package com.bts.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bts.app.MemberService;
import com.bts.app.MemberVO;

@Controller
public class MemberController {
@Autowired
MemberService service;

@RequestMapping(value="/joinmember", method = RequestMethod.POST)
public void joinMemberService(MemberVO vo) {
	service.joinMember(vo);
	
}


	
}
