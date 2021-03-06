package com.bts.app.find;

import org.json.JSONObject;

public interface FindService {

	JSONObject findpath(double sx, double sy, double ex, double ey);

	JSONObject readCitycode();

	JSONObject findStationTimetable(String stationName, int subcode);

	JSONObject findOutpath(double sx, double sy, double ex, double ey);
}
