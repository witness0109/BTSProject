package com.bts.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberService;
import com.bts.app.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;

	@RequestMapping(value = "/insertmember", method = RequestMethod.GET)
	public ModelAndView joinMemberService(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping(value = "/insertmember", method = RequestMethod.POST)
	public String joinMemberServiceresult(MemberVO vo) {
		service.joinMember(vo);

		return "login";
	}

	// 회원가입창 아이디 중복체크
	@RequestMapping(value = "/checkmember", method = RequestMethod.POST)
	@ResponseBody
	public String checkIdService(String id) {
		
		return ""+service.checkID(id);
	}
	
	//비밀번호 찾기 
	@RequestMapping(value="/checkpw" , method = RequestMethod.GET)
	public String checkPwService(String id) {
		
		return service.checkPw(id);
	}
	
	@RequestMapping(value="/checkpw" ,method = RequestMethod.POST)
	public String checkPwServiceSuccess(String id) {
		
		return service.checkPw(id);
	}

}
