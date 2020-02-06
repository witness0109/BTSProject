
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.box {
	width: 400px;
	height: AUTO;
	border: 1px solid green;
	border-radius: 5px;
	padding: 15px;
	margin: 15px;
	overflow-y: scroll;
}
</style>
<script>

var url;
function searchTrainLaneAJAX() {
	
	
	var xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/trainServiceTime?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&startStationID=3300128&endStationID=3300108"
	//url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&busNo="+busNo+"&CID="+CID;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		
	
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			console.log(resultObj.result);
			var result = resultObj["result"];

			var resultArr2 = resultObj["result"]["station"];
			var str = "";
			for (var i = 0; i < resultArr2.length; i++) {
				str += "<div class='box'>";
				str += "<p>출발역명 : " + result.startStationName + "</p>";
				str += "<p>도착역명 : " + result.endStationName + "</p>";
				str += "<p>노선명 : " + resultArr2[i].railName + "</p>";
				str += "<p>열차종류 - 열차번호 : " + resultArr2[i].trainClass + " - "
					+ resultArr2[i].trainNo + "</p>";
				str += "</div>";
			}
			
			document.getElementById("resultDiv").innerHTML = str;
		}
	}
}

</script>
</head>
<body>
<div>
<input type="text" id="start">
<input type="text" id ="end">
<button onclick="searchTrainLaneAJAX();">click</button>

</div>
<div id="resultDiv">

<!-- 결과창 -->
</div>
<div id="detailDiv"></div>
</body>
</html>