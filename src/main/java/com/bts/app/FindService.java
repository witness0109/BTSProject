package com.bts.app;

import org.json.JSONObject;

public interface FindService {

	org.json.JSONObject findpath(double sx, double sy, double ex, double ey);

	JSONObject readCitycode();
}
