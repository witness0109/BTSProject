
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
var busID;
var url;
function searchBusLaneAJAX() {
	var busNo = document.getElementById('busNo').value;
	var CID = document.getElementById('CID').value;
	var xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&busNo="+busNo+"&CID="+CID;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			console.log(resultObj.result);
			var resultArr = resultObj["result"]["lane"];
			console.log(resultArr);

			var str = "";
			for (var i = 0; i < resultArr.length; i++) {
				
				if(busNo==(resultArr[i].busNo)){
				str += "<div class='box'>";
				str += "<p>지역이름 : " + resultArr[i].busCityName + "</p>";
				str += "<p>버스회사 : " + resultArr[i].busCompanyNameKor + "</p>";
				str += "<p>버스번호 : " + resultArr[i].busNo + "</p>";
				str += "<p>출발점 / 도착점 : " + resultArr[i].busStartPoint + " - "
					+ resultArr[i].busEndPoint + "</p>";
				str += "<p>버스노선 ID : " + resultArr[i].busID + "</p>";
				busID = resultArr[i].busID;			
				str += "<label onclick ='searchdetailBusLaneAJAX("+busID+");'> 노선 자세히 보기1</label></div>";											
				}				
			}
		
			document.getElementById("resultDiv").innerHTML = str;
		}
	}
	
}
function searchdetailBusLaneAJAX(busIDID) {
	var xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/busLaneDetail?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&busID="+busIDID;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);		
			var resultArr = resultObj["result"]["station"];
			var str = "";
			str += "<div class='box'>";
			for (var i = 0; i < resultArr.length; i++) {				
				str += "<p>" + resultArr[i].idx + ".	"+ resultArr[i].stationName + "</p>";
			}
			str += "</div>";
			document.getElementById("detailDiv").innerHTML = str;
		}
	}
}

function totalAJAX(){
	searchBusLaneAJAX();
	
	
	
}
</script>
</head>
<body>
<div>
<input type="text" id="busNo">
<input type="text" id ="CID">
<button onclick="totalAJAX();">click</button>

</div>
<div id="resultDiv">

<!-- 결과창 -->
</div>
<div id="detailDiv"></div>
</body>
</html>