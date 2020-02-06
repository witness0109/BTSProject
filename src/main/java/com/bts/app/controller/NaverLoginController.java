package com.bts.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bts.app.MemberService;
import com.bts.app.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {

	@Autowired
	MemberService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/openapi", method = RequestMethod.GET)
	public void oa() {
	}

	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public void oa1() {
	}

	@RequestMapping(value = "/Overlay", method = RequestMethod.GET)
	public void oa2() {
	}

	@RequestMapping(value = "/naverlogin", method = RequestMethod.GET)
	public void oa3() {
	}

	/*
	 * @RequestMapping(value = "/callback", method = RequestMethod.GET) public void
	 * oa4() { }
	 */
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	

	// 네이버 로그인 성공시 callback호출 메소드 (로그인 결과로 날아온 사용자 정보를 이용해서 추가 작업을 할 수 있다.)
	@RequestMapping(value = "/callback2", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			// 1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
			// 2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			// 3. 데이터 파싱
			// Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			String email = "naver_" + ((String) response_obj.get("email"));
			service.membercheck(session, email, (String) response_obj.get("name"));
			model.addAttribute("result", apiResult);
			return "redirect:login";
		

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:login";
	}

}
