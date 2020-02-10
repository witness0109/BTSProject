package com.bts.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "login";
	}
	
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public void of3() {
	}
	@RequestMapping(value = "/BTS_MAIN", method = RequestMethod.GET)
	public void of9() {
	}
	@RequestMapping(value = "/intercityBus", method = RequestMethod.GET)
	public void of10() {
	}
	@RequestMapping(value = "/line", method = RequestMethod.GET)
	public void of11() {
	}
	@RequestMapping(value = "/bus_search2", method = RequestMethod.GET)
	public void of12() {
	}
	@RequestMapping(value = "/train_search", method = RequestMethod.GET)
	public void of13() {
	}
	@RequestMapping(value = "/expressBus", method = RequestMethod.GET)
	public void of15() {
	}
	

		
	

	}

	
