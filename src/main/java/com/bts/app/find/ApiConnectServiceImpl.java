package com.bts.app.find;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
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
//		String apiKey = "bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";// api key;
		String apiKey = URLEncoder.encode("M8SKA0YgQxm9grGE6XQQutSOF6AI5wkAOpA+NNZlhCc", "UTF-8");
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

	private StringBuffer getAPIResult(String apiurl, String stdid) // 시간 남으면 없애도록
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
	public JSONObject getBusanRealTimeBusInfo(String stdid) { // busan..운행종료시 min1사라짐;;;
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

	@Override
	public String getSubwayStatioinCodeOpenApi(String stationName, int subcode) {
		try {
			String url = "http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getKwrdFndSubwaySttnList?"
					+ "serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D"
					+ "&subwayStationName=";
			StringBuffer res = getAPIResult(url, URLEncoder.encode(stationName, "UTF-8"));
			String linename = "";

			switch (subcode) {
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
				linename = "서울 " + subcode + "호선";
				break;
			case 100:
				linename = "분당선";
				break;
			case 101:
				linename = "공항철도";
				break;
			case 104:
				linename = "경의중앙선";
				break;
			case 107:
				linename = "에버라인";
				break;
			case 108:
				linename = "경춘선";
				break;
			case 109:
				linename = "신분당선";
				break;
			case 110:
				linename = "의정부경전철";
				break;
			case 111:
				linename = "수인선";
				break;
			case 112:
				linename = "경강선";
				break;
			case 113:
				linename = "우이신설선";
				break;
			case 21:
				linename = "인천 1호선";
				break;
			case 22:
				linename = "인천 2호선";
				break;
			case 31:
				linename = "대전 1호선";
				break;
			case 41:
				linename = "대구 1호선";
				break;
			case 42:
				linename = "대구 2호선";
				break;
			case 43:
				linename = "대구 3호선";
				break;
			case 51:
				linename = "광주 1호선";
				break;
			case 71:
				linename = "부산 1호선";
				break;
			case 72:
				linename = "부산 2호선";
				break;
			case 73:
				linename = "부산 3호선";
				break;
			case 74:
				linename = "부산 4호선";
				break;
			case 78:
				linename = "동해선";
				break;
			case 79:
				linename = "부산김해경전철";
				break;

			default:
				break;
			}

			JSONObject jsonObj = XML.toJSONObject(res.toString());
			if (jsonObj.getJSONObject("response").getJSONObject("header").getString("resultCode").equals("00")) {// 호출성공
				if (jsonObj.getJSONObject("response").getJSONObject("body").get("items") instanceof String) {
					return "결과없음";
				}

				Object obj = jsonObj.getJSONObject("response").getJSONObject("body").getJSONObject("items").get("item");
				if (obj instanceof JSONArray) {
					JSONArray items = (JSONArray) obj;
					for (int i = 0; i < items.length(); i++) {
						String stnName = items.getJSONObject(i).getString("subwayStationName");
						String subwayRouteName = items.getJSONObject(i).getString("subwayRouteName");
						if (stnName.equals(stationName)) {
							if (linename.equals(subwayRouteName)) {
								return items.getJSONObject(i).getString("subwayStationId");
							}
						}
					}
				} else if (obj instanceof JSONObject) {
					JSONObject items = (JSONObject) obj;
					return items.getString("subwayStationId");
				}

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "";
	}

	@Override
	public JSONObject getSubwayTimeTableOpenApi(String stnCode, int dailyType, char updown) {
		try {
			String url = "http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getSubwaySttnAcctoSchdulList?"
					+ "serviceKey=lVBFII5EjomsSHjRIfMkfciLDo5uGCjFPdvcF6DqA0wiNin9PnMAfkCV3oAUabVi414OM9%2FzSBoJ3Eu2srOjyA%3D%3D"
					+ "&numOfRows=300" + "&subwayStationId=" + stnCode + "&dailyTypeCode=0" + dailyType
					+ "&upDownTypeCode="; // 500개 불러옴
			StringBuffer res = getAPIResult(url, "" + updown);
			JSONObject jsonObj = XML.toJSONObject(res.toString());
			if (jsonObj.getJSONObject("response").getJSONObject("header").getString("resultCode").equals("00")) {// 호출성공
				int total = jsonObj.getJSONObject("response").getJSONObject("body").getInt("totalCount");

				return jsonObj.getJSONObject("response").getJSONObject("body");

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return new JSONObject();

	}

}
