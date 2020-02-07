<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	var str = "";
	var startID=new Array();
	var endID;
	var startCityTerminal;
	var destinationTerminal;

	
	function searchIntercityBusTerminalAJAX() {

		cityname = document.getElementById("startCityTerminal").value;
		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/intercityBusTerminals?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&terminalName="
				+ cityname;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				
				
				startCityTerminal =resultObj["result"];			
				str += "<div class='box'><h1> 출발역 선택</h1>";

				for (var i = 0; i < startCityTerminal.length; i++) {			
						//"+startCityTerminal[i].stationID+",
						str += "<p><label onclick ='destinationTerminalsAJAX("+startCityTerminal[i].stationID+",\""+startCityTerminal[i].stationName+"\");'>"+startCityTerminal[i].stationName+"</label></p>";							
						startID[i] = startCityTerminal[i].stationID;	
						console.log(startID[i]);
						}
						str += "</div>";
						document.getElementById("resultDiv").innerHTML = str;
					

					}

				}
			}
	function destinationTerminalsAJAX(startTerminalID, statTerminalName) {

		
		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/intercityBusTerminals?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&terminalName="
				+ statTerminalName;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				
				
				//startTerminal =resultObj["result"];	
				//['1']["destinationTerminals"]
				destinationTerminal = resultObj["result"]["0"]["destinationTerminals"];
				console.log(destinationTerminal);
			
				str += "<div class='box'><h1> 도착역 선택</h1>";
 
				for (var i = 0; i < destinationTerminal.length; i++) {			
						//str+="<p>"+destinationTerminal[i].stationName+ "</p>";
						//onclick ='searchIntercityBusinformationAJAX("+startID,destinationTerminal[i].stationID+");'
						str += "<p><label onclick ='searchIntercityBusinformationAJAX("+startTerminalID+","+destinationTerminal[i].stationID+");'>"+destinationTerminal[i].stationName+"</label></p>";								
						}
						str += "</div>";
						document.getElementById("resultDiv").innerHTML = str;

					} 

				}
			}
	


	//열차 . ktx 운행정보 검색
function searchIntercityBusinformationAJAX(start, end) {
		

		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/intercityServiceTime?apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY&lang=0&startStationID="
				+ start + "&endStationID=" + end;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				console.log(resultObj.result);
				//[1][start][end]
				var inf = resultObj["result"]["station"];

				var str = "";
					
				for (var i = 0; i < inf.length; i++) {
					
					str += "<div class='box'> <h1> 노선 정보</h1>";
					str += "<p> 출발 터미널:	" +inf[i].startTerminal+ "</p>";
					str += "<p> 도착 터미널:	" + inf[i].destTerminal+ "</p>";
					str += "<p>스케줄 : " + inf[i].schedule + "</p>";
					str += "<p>소요시간 : " + (inf[i].wasteTime-inf[i].wasteTime%60)/60+"시간	"+inf[i].wasteTime%60+"분"+ "</p>"; 
					if(inf[i].normalFare>=10000){
						str += "<p>금액 : " + (inf[i].normalFare-inf[i].normalFare%10000)/10000+"만	"+ inf[i].normalFare%10000+"원"+ "</p>";
						}else{
							"<p> 첫차:	" +inf[i].normalFare+"원"+ "</p>";
						}
					
					str += "<p> 첫차:	" +inf[i].firstTime+"	막차 :	" + inf[i].lastTime+ "</p>";
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
		<input type="text" id="startCityTerminal">
		<button onclick="searchIntercityBusTerminalAJAX();">click</button>

	</div>
	<div id="resultDiv">

		<!-- 결과창 -->
</div>

</body>
</html>