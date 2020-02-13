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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bts.app.MemberService;
import com.bts.app.MemberVO;
import com.bts.app.NaverLoginBO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	private JavaMailSender mailSender;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/*
	 * @RequestMapping(value = "/insertmember", method = RequestMethod.GET) public
	 * ModelAndView joinMemberService(MemberVO vo) { ModelAndView mav = new
	 * ModelAndView(); return mav; }
	 */
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		if (session.getAttribute("id") == null) {// 로그인 안 된 상태

			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			// 네이버
			model.addAttribute("url", naverAuthUrl);
			return "login";
		} else { // 세션에 있을시 못넘어가게

			return "loginsuccess";
		}

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String id, String pw, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String[] inf = new String[2];
		inf[0] = id;
		inf[1] = pw;
		int result = service.login(inf);
		
		if (result == 1) { // 로그인 성공
			// main.jsp로 이동
			mav.setViewName("loginsuccess");
			session.setAttribute("id", id);
		} else { // 로그인 실패
			mav.setViewName("login");

		}
		return mav;

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
	@RequestMapping(value = "/loginsuccess", method = RequestMethod.GET)
	public void lginsss() {
	}
	@RequestMapping(value = "/checkpw", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
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

		// 수신자 인코딩을 위한 설정
		String charSet = "UTF-8";
		String fromName = "BTS 운영자";
		InternetAddress from = new InternetAddress();

		try {
			from = new InternetAddress(new String(fromName.getBytes(charSet), "8859_1") + "<witness0109@gmail.com>");
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
	
	
	
	@RequestMapping(value="/Mypage", method=RequestMethod.GET)
		public String updatemember() {
			return "Mypage";
		}
		
	
		@RequestMapping(value="/Mypage", method=RequestMethod.POST)
			public String updatemember(String id, MemberVO vo, HttpSession session) {
				service.updatemember(vo);
				session.setAttribute("id", id);
				
				return "redirect:/";
			}
		

	


}
