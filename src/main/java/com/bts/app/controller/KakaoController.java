package com.bts.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bts.app.MemberService;

@Controller
public class KakaoController {
	@Autowired
	MemberService service;

	@RequestMapping(value="/kakaocheck" )
	public String kakaoMemberCheck(HttpSession session, String email, String name){
		service.membercheck(session,"kakao_"+email, name);
		
		return "login2";
	}
	
	
}
