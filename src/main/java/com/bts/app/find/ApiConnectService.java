package com.bts.app.find;

import org.json.JSONObject;

public interface ApiConnectService {

	JSONObject GetOdsayApiResponseMap(String apiAddress, String option);

	JSONObject getSeoulRealTimeBusInfo(String stdid);

	String GetApiResponse(String apiAddress, String option);

	JSONObject getGGRealTimeBusInfo(String stdid);

	JSONObject getGGBusDetail(String routeId);

	JSONObject getBusanRealTimeBusInfo(String stdid);

	JSONObject getETCRealTimeBusInfo(String cityCode, String stationID);

	String getSubwayStatioinCodeOpenApi(String stationName, int subcode);

	JSONObject getSubwayTimeTableOpenApi(String stnCode, int dailyType, char updown);
}
