package com.bts.app.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private JavaMailSender mailSender;

	/*
	 * @RequestMapping(value = "/insertmember", method = RequestMethod.GET) public
	 * ModelAndView joinMemberService(MemberVO vo) { ModelAndView mav = new
	 * ModelAndView(); return mav; }
	 */

	@RequestMapping(value = "/login", method =  RequestMethod.POST )
	public int login(HttpSession session) {
	
	
		return service.login(session);
	}

	
	
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

		return "" + service.checkID(id);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/checkpw", method = RequestMethod.GET)
	public void checkPwService() {

	}

	@RequestMapping(value = "/checkpw", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ModelAndView checkPwServiceSuccess(@RequestParam String id, String name, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String[] list = new String[2];
		list[0] = id;
		list[1] = name;
		List<String> c_mail = service.checkMail(list);
		List<String> c_pw = service.checkPw(list);

		String email = c_mail.get(0);
		String password = c_pw.get(0);
		
		mav.addObject("mail", c_mail);
		mav.addObject("check", "no_id");

		//수신자 인코딩을 위한 설정
		String charSet = "UTF-8";
		String fromName = "BTS 운영자";
		InternetAddress from = new InternetAddress() ;
				
		try {
			from= new InternetAddress(new String(fromName.getBytes(charSet), "8859_1")+"<witness0109@gmail.com>");		
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(from); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject("비밀번호 입니다"); // 메일제목은 생략이 가능하다
			messageHelper.setText(password + " 입니다. "); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		mav.setViewName("login");
		return mav;
	}

	// mailForm
	@RequestMapping(value = "/mailForm")
	public String mailForm() {

		return "mailForm";
	}

	// mailSending 코드
	@RequestMapping(value = "/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "witness0109@ gmail.com";
		String tomail = request.getParameter("mail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:mailForm";
	}

	/*
	 * @RequestMapping(value="/checkpw" ,method = RequestMethod.POST) public
	 * ModelAndView checkPwServiceSuccess(String id) { ModelAndView mav = new
	 * ModelAndView(); String c_pw = service.checkPw(id);
	 * 
	 * mav.addObject("password",c_pw); mav.addObject("check", "no_id");
	 * mav.setViewName("checkpw"); return mav; }
	 */

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		service.logout(session);

		return "redirect:/BTS/login";

	}

}
