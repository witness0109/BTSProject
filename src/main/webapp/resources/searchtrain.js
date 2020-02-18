//전역변수
var url;
var cityname;
var endname;
var citycode;
var xhr;
var _startid;

function searchTrainStationAJAX() {

	cityname = document.getElementById("cityname").value;

	xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/trainTerminals?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&terminalName="
		+ cityname;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function () {

		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			var start = resultObj["result"];
			var str = "";
			var startcity;

			str += "<div class='box'><h1> 출발역 선택</h1>";

			for (var i = 0; i < start.length; i++) {
				_startid = start[i].stationID;
				startcity = start[i].stationName;
				if(_startid != '3300197' && startcity == '용산'){
					startcity = 'ITX 용산'
					
				}
				str += '<p><label onclick ="trainDestinationAJAX(\''+start[i].stationName + '\',\''+_startid+'\')">'  + startcity + '</label></p>';
				// output arrivestations
				

			}

			str += "</div>";

			document.getElementById("resultDiv").innerHTML = str;

		}
	}
}
// 역코드 조회 끝

function trainDestinationAJAX(startStation,sid) {

	xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/trainTerminals?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&terminalName="
		+ startStation;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function () {

		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);
			var start = resultObj["result"];
			var index = 0;
			for (let i = 0; i < start.length; i++) {
				const result = start[i];

				if(result.stationID == sid){
					index = i;
					break;
				}
				
			}

			var end = resultObj["result"][index]["arrivalTerminals"];
			var str = "";
			var endid;

			str += "<div class='box'><h1> 도착역 선택 </h1>";

			for (var i = 0; i < end.length; i++) {
				endid = end[i].stationID;
				str += "<pre><label onclick = 'searchTraininformationAJAX("
					+ _startid + "," + endid + ")'도착 : >"
					+ end[i].stationName + "</label></pre>";
				// <label onclick
				// ='trainDestinationAJAX(\""+startcity+"\")'>"+startcity+"</label></p>";

			}
			str += "</div>";
			document.getElementById("resultDiv2").innerHTML = str;
			// searchTraininformationAJAX(startid, endid);

		}
	}
}

// 열차 . ktx 운행정보 검색
function searchTraininformationAJAX(start, end) {

	xhr = new XMLHttpRequest();
	url = "https://api.odsay.com/v1/api/trainServiceTime?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&startStationID="
		+ start + "&endStationID=" + end;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function () {

		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultObj = JSON.parse(xhr.responseText);

			var station_inf = resultObj["result"];
			var train_inf = resultObj["result"]["station"];
			var fare_inf = "";

			var cnt1 = 0;
			var cnt2 = 0;
			var cnt3 = 0;

			var str = "", str2 = "", str3 = "", str4 = "", fare = "";

			str += "<div class='box expbus'>";
			str += "<p>출발역 : " + station_inf.startStationName + "</p>";
			str += "<p>도착역 : " + station_inf.endStationName + "</p>";
			str += "<p>검색결과개수 : " + station_inf.count + "</p>";
			str += "</div>";

			for (var i = 0; i < train_inf.length; i++) {
				if ((train_inf[i].trainClass.includes("KTX")) && cnt1 == 0) {
					str2 += "<table class='traintable'><caption>KTX</caption>";
					str2 += "<tr><th>열차종류</th><th>열차번호</th><th>출발시간</th><th>도착시간</th><th>소요시간</th><th>노선명</th>";
					cnt1++;
				}

				if (train_inf[i].trainClass.includes("ITX") && cnt2 == 0) {
					str3 += "<table class='traintable'><caption>ITX 새마을/청춘</caption>";
					str3 += "<tr><th>열차종류</th><th>열차번호</th><th>출발시간</th><th>도착시간</th><th>소요시간</th><th>노선명</th>";
					cnt2++;
				}
				if (train_inf[i].trainClass.includes("누리로") || train_inf[i].trainClass.includes("무궁화") && cnt3 == 0) {
					str4 += "<table class='traintable'><caption>무궁화/누리로</caption>";
					str4 += "<tr><th>열차종류</th><th>열차번호</th><th>출발시간</th><th>도착시간</th><th>소요시간</th><th>노선명</th>";
					cnt3++;
				}

			}

			for (var i = 0; i < train_inf.length; i++) {

				if (train_inf[i].trainClass.includes("KTX")) {

					str2 += "<tr><td>" + train_inf[i].trainClass + "</td>"
						+ "<td> " + train_inf[i].trainNo + "</td>";
					str2 += "<td> " + train_inf[i].departureTime + "</td>";
					str2 += "<td> " + train_inf[i].arrivalTime + "</td>";
					str2 += "<td> " + train_inf[i].wasteTime + "</td>";
					str2 += "<td> " + train_inf[i].railName + "</td></tr>"; // KTX 안뜨게 변경

				} else if (train_inf[i].trainClass.includes("ITX")) {

					str3 += "<tr><td>" + train_inf[i].trainClass + "</td>"
						+ "<td> " + train_inf[i].trainNo + "</td>";
					str3 += "<td> " + train_inf[i].departureTime + "</td>";
					str3 += "<td> " + train_inf[i].arrivalTime + "</td>";
					str3 += "<td> " + train_inf[i].wasteTime + "</td>";
					str3 += "<td> " + train_inf[i].railName + "</td></tr>";

				} else {

					str4 += "<tr><td>" + train_inf[i].trainClass + "</td>"
						+ "<td> " + train_inf[i].trainNo + "</td>";
					str4 += "<td> " + train_inf[i].departureTime + "</td>";
					str4 += "<td> " + train_inf[i].arrivalTime + "</td>";
					str4 += "<td> " + train_inf[i].wasteTime + "</td>";
					str4 += "<td> " + train_inf[i].railName + "</td></tr>";
				}

			}

			str2 += "</table>";
			str3 += "</table>";
			str4 += "</table>";

			var ktx_fare = "";
			var sae_fare = "";
			var mu_fare = "";

			for (var i = 0; i < train_inf.length; i++) {
				fare_inf = resultObj["result"]["station"][i]["generalFare"];

				// 열차별로 뽑기 (ktx, 새마을, 무궁화) //undefined 나올시.. 그리고 누리로,통근열차 처리
				if (fare_inf.weekday != undefined && train_inf[i].trainClass.includes("KTX")) {
					ktx_fare = "<tr><td>" + fare_inf.weekday + "</td><td>"
						+ fare_inf.weekend + "</td><td>" + fare_inf.holiday
						+ "</td></tr>";

				} else if (fare_inf.weekend != undefined && train_inf[i].trainClass.includes("ITX")) {

					sae_fare = "<tr><td>" + fare_inf.weekday + "</td><td>"
						+ fare_inf.weekend + "</td><td>" + fare_inf.holiday
						+ "</td></tr>";

				} else if (fare_inf.holiday != undefined && train_inf[i].trainClass.includes("무궁화")
					|| train_inf[i].trainClass.includes("누리로")) {
					mu_fare = "<tr><td>" + fare_inf.weekday + "</td><td>"
						+ fare_inf.weekend + "</td><td>" + fare_inf.holiday
						+ "</td></tr>";

				}

			}
			
			if (ktx_fare.length == 0) {
				ktx_fare = "<tr><td>없음 </td><td>없음</td><td>없음</td></tr>";
					fare_inf.weekend = " 없음 ";
					fare_inf.holiday = " 없음 ";
			}

				if ( sae_fare.length == 0) {

					sae_fare = "<tr><td>없음 </td><td>없음</td><td>없음</td></tr>";
						fare_inf.weekend = " 없음 ";
						fare_inf.holiday = " 없음 ";
				}

			
				if ( mu_fare.length ==0) {
					mu_fare = "<tr><td>없음 </td><td>없음</td><td>없음</td></tr>";
						fare_inf.weekend = " 없음 ";
						fare_inf.holiday = " 없음 ";
				}

			
			
			console.log(ktx_fare);
			console.log(sae_fare);
			console.log(mu_fare);

			fare += "<div class='fareTb box train'>";
			fare += "<h3>기차 요금표</h3>";
			fare += "<table class='traintable'>"
			fare += "<tr><th colspan='3'>KTX</th></tr>";
			fare += "<tr><td>평일</td><td>주말</td><td>공휴일</td></tr>";
			fare += ktx_fare;
			fare += "</table>";

			fare += "<table class='traintable'>"
			fare += "<tr><th colspan='3'>ITX</th></tr>";
			fare += "<tr><td>평일</td><td>주말</td><td>공휴일</td></tr>";
			fare += sae_fare;
			fare += "</table>";

			fare += "<table class='traintable'>"
			fare += "<tr><th colspan='3'>무궁화</th></tr>";
			fare += "<tr><td>평일</td><td>주말</td><td>공휴일</td></tr>";
			fare += mu_fare;
			fare += "</table>";

			fare += "</div>";

			document.getElementById("resultDiv2").innerHTML = str;

			document.getElementById("fareDiv").innerHTML = fare;

			document.getElementById("resultDiv3").classList.remove('box')
			document.getElementById("resultDiv4").classList.remove('box')
			document.getElementById("resultDiv5").classList.remove('box')

			document.getElementById("resultDiv3").innerHTML = str2;
			if (cnt1 != 0) {
				document.getElementById("resultDiv3").classList.add('box')
			}
			document.getElementById("resultDiv4").innerHTML = str3;
			if (cnt2 != 0) {
				document.getElementById("resultDiv4").classList.add('box')
			}
			document.getElementById("resultDiv5").innerHTML = str4;
			if (cnt3 != 0) {
				document.getElementById("resultDiv5").classList.add('box')
			}
		}

	}
}