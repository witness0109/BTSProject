package com.bts.app.find;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

@Service
public class ApiConnectServiceImpl implements ApiConnectService {
	@Override
	public JSONObject GetOdsayApiResponseMap(String apiAddress, String option) {
		try {

			StringBuffer res = getOdsayConnection(apiAddress, option);
			JSONObject jsonObj = new JSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

	@Override
	public String GetApiResponse(String apiAddress, String option) {
		StringBuffer res = new StringBuffer();
		try {

			res = getOdsayConnection(apiAddress, option);
			// JSONObject jsonObj = new JSONObject(new String(res.toString().getBytes(),
			// "utf-8"));

//			return ConvertJSONToMap(jsonObj);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return res.toString();
	}

	private StringBuffer getOdsayConnection(String apiAddress, String option)
			throws MalformedURLException, IOException, ProtocolException, UnsupportedEncodingException {
		String apiKey = "bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";// api key;
		String apiURL = "https://api.odsay.com/v1/api/" + apiAddress + "?&lang=0&apiKey=" + apiKey + option;
		return connectAPI(apiURL);
	}

	private StringBuffer connectAPI(String apiURL)
			throws MalformedURLException, IOException, ProtocolException, UnsupportedEncodingException {
		System.out.println(apiURL);
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		// con.setRequestProperty("apiKey", apiKey);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		String inputLine;
		StringBuffer sb = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			System.out.println(inputLine);
			sb.append(inputLine);
		}
		br.close();
		return sb;
	}

	private Map<String, Object> ConvertJSONToMap(JSONObject jsonObj) {
		Map<String, Object> map = new HashMap<String, Object>();
		Iterator<String> keysItr = jsonObj.keys();
		while (keysItr.hasNext()) {
			String key = keysItr.next();
			Object value = jsonObj.get(key);
			if (value instanceof JSONObject) {
				map.put(key, ConvertJSONToMap((JSONObject) value));
				continue;
			}
			if (value instanceof JSONArray) {
				JSONArray jsonArr = (JSONArray) value;

				map.put(key, ConvertJSONArrayToMap(jsonArr));

				continue;
			}
			map.put(key, value);
		}
		return map;
	}

	private Map<String, Object> ConvertJSONArrayToMap(JSONArray jsonArr) {
		Map<String, Object> map = new HashMap<String, Object>();
		int num = 1;

		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jo = jsonArr.getJSONObject(i);
			Set<String> keys = jo.keySet();
			JSONObject currentJO = (JSONObject) jsonArr.get(i);
			for (String key1 : keys) {
				if (currentJO.get(key1) instanceof JSONObject) {
					map.put(key1, ConvertJSONToMap((JSONObject) currentJO.get(key1)));
				} else if (currentJO.get(key1) instanceof JSONArray) {
					map.put(key1, ConvertJSONArrayToMap((JSONArray) currentJO.get(key1)));
				} else {
					map.put(key1, currentJO.get(key1));
				}
			}

		}
		return map;
	}

	@Override
	public JSONObject getSeoulRealTimeBusInfo(String stdid) {
		try {
			String url = "http://ws.bus.go.kr/api/rest/stationinfo/getStationByUid?serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D&arsId=";
			StringBuffer res = getAPIResult(url, stdid);

			JSONObject jsonObj = XML.toJSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

	private StringBuffer getAPIResult(String apiurl, String stdid)
			throws MalformedURLException, IOException, ProtocolException, UnsupportedEncodingException {
		String apiURL = apiurl + stdid;
		return connectAPI(apiURL);
	}

	@Override
	public JSONObject getGGRealTimeBusInfo(String stdid) { // Gyenggi
		try {
			String url = "http://openapi.gbis.go.kr/ws/rest/busarrivalservice/station?serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D&stationId=";
			StringBuffer res = getAPIResult(url, stdid);

			JSONObject jsonObj = XML.toJSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

	@Override
	public JSONObject getGGBusDetail(String routeId) { // Gyenggi
		try {
			String url = "http://openapi.gbis.go.kr/ws/rest/busrouteservice/info?serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D&routeId=";
			StringBuffer res = getAPIResult(url, routeId);

			JSONObject jsonObj = XML.toJSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

	@Override
	public JSONObject getBusanRealTimeBusInfo(String stdid) { // Gyenggi
		try {
			String url = "http://61.43.246.153/openapi-data/service/busanBIMS2/stopArr?serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D&bstopid=";
			StringBuffer res = getAPIResult(url, stdid);

			JSONObject jsonObj = XML.toJSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

	@Override
	public JSONObject getETCRealTimeBusInfo(String cityCode, String stationID) {
		try {
			String url = "http://openapi.tago.go.kr/openapi/service/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D"
					+ "&cityCode=" + cityCode + "&nodeId=";
			StringBuffer res = getAPIResult(url, stationID);

			JSONObject jsonObj = XML.toJSONObject(res.toString());

			return jsonObj;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();
	}

}
