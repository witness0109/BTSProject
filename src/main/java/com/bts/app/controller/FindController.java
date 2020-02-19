package com.bts.app.controller;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bts.app.find.ApiConnectService;
import com.bts.app.find.FindService;
import com.bts.app.find.FindServiceImpl;

@Controller
public class FindController {

	@Autowired
	FindService fservice;
	@Autowired
	ApiConnectService apiService;

	@RequestMapping(value = "/findapi/findpath", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPath(@RequestParam double sx, @RequestParam double sy, @RequestParam double ex,
			@RequestParam double ey) {

		JSONObject map = fservice.findpath(sx, sy, ex, ey);
		return map.toString();
		// return ((FindServiceImpl) fservice).readOutCityJSON("부천에서구로").toString();

	}

	@RequestMapping(value = "/findapi/findoutpath", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findOutPath(@RequestParam double sx, @RequestParam double sy, @RequestParam double ex,
			@RequestParam double ey) {

						JSONObject map = fservice.findOutpath(sx, sy, ex, ey);
		return map.toString();
//		return ((FindServiceImpl) fservice).readOutCityJSON("ddg").toString();


	}

	@RequestMapping(value = "/findapi/subway", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findStationTimetable(@RequestParam String stationName, @RequestParam int subwayCode) {
		JSONObject map = fservice.findStationTimetable(stationName, subwayCode);

		return map.toString();

	}

	@RequestMapping(value = "/findapi/citycode", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readCityCode(HttpServletResponse res) {
		res.setCharacterEncoding("utf-8");
		System.out.println(fservice.readCitycode().toString());
		return fservice.readCitycode().toString();

	}
}
