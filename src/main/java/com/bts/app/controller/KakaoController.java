package com.bts.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bts.app.MemberService;

@Controller
public class KakaoController {
	@Autowired
	MemberService service;

}
