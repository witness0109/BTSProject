package com.bts.app.find;

import org.json.JSONObject;

public interface ApiConnectService {

	JSONObject GetOdsayApiResponseMap(String apiAddress, String option);

	JSONObject getSeoulRealTimeBusInfo(String stdid);

	String GetApiResponse(String apiAddress, String option);

	JSONObject getGGRealTimeBusInfo(String stdid);

}
