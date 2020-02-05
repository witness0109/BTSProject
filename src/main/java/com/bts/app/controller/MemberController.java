package com.bts.app.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberService;
import com.bts.app.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;

	/*
	 * @RequestMapping(value = "/insertmember", method = RequestMethod.GET) public
	 * ModelAndView joinMemberService(MemberVO vo) { ModelAndView mav = new
	 * ModelAndView(); return mav; }
	 */

	@RequestMapping(value = "/insertmember", method = RequestMethod.POST)
	public String joinMemberServiceresult(MemberVO vo) {
		
		service.joinMember(vo);
		System.out.println(vo);
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
	public void checkPwService() {
	
	}
	
	@RequestMapping(value="/checkpw",method = RequestMethod.POST)
	public ModelAndView checkPwServiceSuccess(@RequestParam String id, String name) {
		ModelAndView mav = new ModelAndView();
		
		String[] list = new String[2];
		list[0] = id;
		list[1] = name;
		
		List<String> c_pw = service.checkPw(list);
		mav.addObject("password",c_pw);
		mav.addObject("check", "no_id");
		mav.setViewName("checkpw");
		return mav;
		}

}
