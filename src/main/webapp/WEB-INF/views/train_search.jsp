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
	//전역변수
	var url;
	var cityname;
	var endname;
	var citycode;
	var xhr;


	function searchTrainStationAJAX() {

		cityname = document.getElementById("cityname").value;
		endname = document.getElementById("endname").value;

		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/trainTerminals?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&terminalName="
				+ cityname;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				console.log(resultObj.result);
				var start = resultObj["result"];
				var end = resultObj["result"]["0"]["arrivalTerminals"];
				console.log(end)
				var str = "";
				var startid;
				var endid;

				str += "<div class='box'>";

				for (var i = 0; i < start.length; i++) {

					if (cityname == start[i].stationName) {
						str += "<p>출발역코드 : " + start[i].stationID + "</p>";
						startid = start[i].stationID
						for (var j = 0; j < end.length; j++) {
							if (endname == end[j].stationName) {

								endid = end[j].stationID
								str += "<p>도착역코드 : " + end[j].stationID
										+ "</p>";
							}

						}
						str += "</div>";
						//document.getElementById("resultDiv").innerHTML = str;
						searchTraininformationAJAX(startid, endid);

					}

				}
			}
		}
	}// 역코드 조회 끝

	//열차 . ktx 운행정보 검색
	function searchTraininformationAJAX(start, end) {

		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/trainServiceTime?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&startStationID="
				+ start + "&endStationID=" + end;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				console.log(resultObj.result);
				var inf = resultObj["result"]["station"];

				var str = "";

				for (var i = 0; i < inf.length; i++) {
					str += "<div class='box'>";
					str += "<p>열차종류 : " + inf[i].trainClass + " - 열차번호 : " + inf[i].trainNo + "</p>";
					str += "<p>출발시간 : " + inf[i].departureTime + "</p>";
					str += "<p>도착시간 : " + inf[i].arrivalTime + "</p>";
					str += "<p>소요시간 : " + inf[i].wasteTime + "</p>";
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
		<input type="text" id="cityname"> <input type="text"
			id="endname">
		<button onclick="searchTrainStationAJAX();">click</button>

	</div>
	<div id="resultDiv">

		<!-- 결과창 -->
</div>

</body>
</html>