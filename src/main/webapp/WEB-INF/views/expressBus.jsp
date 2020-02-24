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
</head>
<body>
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
	var apikey ="apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";
	var inf;
	var str = "";	
	var infd = new Array();

	
	function searchExpressBusTerminalAJAX() {
		
		str = "";
		cityname = document.getElementById("startCityTerminal").value;
		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/expressBusTerminals?"+apikey+"&lang=0&terminalName="
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
						//console.log(startID[i]);
						}
						str += "</div>";
						document.getElementById("resultDiv").innerHTML = str;
					

					}

				}
			}
	function destinationTerminalsAJAX(startTerminalID, statTerminalName) {
		str ="";
		
		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/expressBusTerminals?"+apikey+"&lang=0&terminalName="
				+ statTerminalName;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				
				
				//startTerminal =resultObj["result"];	
				//['1']["destinationTerminals"]
				destinationTerminal = resultObj["result"]["0"]["destinationTerminals"];
				//console.log(destinationTerminal);
			
				str += "<div class='box'><h1> 도착역 선택</h1>";
 
				for (var i = 0; i < destinationTerminal.length; i++) {			
						//str+="<p>"+destinationTerminal[i].stationName+ "</p>";
						//onclick ='searchIntercityBusinformationAJAX("+startID,destinationTerminal[i].stationID+");'
						str += "<p><label onclick ='searchExpressBusinformationAJAX("+startTerminalID+","+destinationTerminal[i].stationID+");'>"+destinationTerminal[i].stationName+"</label></p>";								
						}
						str += "</div>";
						document.getElementById("resultDiv2").innerHTML = str;

					} 

				}
			}
	


	//열차 . ktx 운행정보 검색
function searchExpressBusinformationAJAX(start, end) {
		
		str = "";
		

		xhr = new XMLHttpRequest();
		url = "https://api.odsay.com/v1/api/expressServiceTime?"+apikey+"&lang=0&startStationID="
				+ start + "&endStationID=" + end;
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				//console.log(resultObj.result);
				
				inf = resultObj["result"]["station"];
				//console.log(inf);

				if(inf.length==2){
					for(var i =0;i<inf.length;i++){
						
						infd[i] = resultObj["result"]["station"][i];
						console.log(inf.length);
						
					if(i==0){
							
								str += "<table class='busT'> <tr><th>노선 정보</th><td colspan='3'>고속 프리미엄버스</td></tr>"+
								"<tr><th>출발 터미널</th><td>"+infd[i].startTerminal+"</td><th>도착 터미널</th><td>"+ infd[i].destTerminal+"</td></tr>";
								str += "<tr><th>스케줄</th><td colspan='3'>"+replaceAll(infd[i].schedule,"(우등)","")+"</td></tr>";
								str += "<tr><th>소요 시간</th><td>"+infd[i].wasteTime
									+"</td><th>금액</th><td>"+numberFormat(infd[i].specialFare)+"</td></tr></table>";
						
						}else if(i==1){
							str += "<table class='busT'> <tr><th>노선 정보</th><td colspan='3'>고속 일반버스/ 우등버스</td></tr>"+
							"<tr><th>출발 터미널</th><td>"+infd[i].startTerminal+"</td><th>도착 터미널</th><td>"+ infd[i].destTerminal+"</td></tr>";
							str += "<tr><th>스케줄</th><td colspan='3'>"+replaceAll(infd[i].schedule,"(우등)","")+"</td></tr>";
							str += "<tr><th>소요 시간</th><td>"+infd[i].wasteTime
								+"</td><th>금액</th><td> 우등:	"+numberFormat(infd[i].specialFare)+"일반:"+numberFormat(infd[i].normalFare)+"</td></tr></table>";
																
								}			
						document.getElementById("resultDiv").innerHTML = str;	
						}	
					
				}else{
					
						for(var i =0;i<inf.length;i++){
						
						infd[i] = resultObj["result"]["station"][i];

						
						
						str += "<table class='busT'> <tr><th>노선 정보</th><td colspan='3'>고속 일반버스/ 우등버스</td></tr>"+
						"<tr><th>출발 터미널</th><td>"+infd[i].startTerminal+"</td><th>도착 터미널</th><td>"+ infd[i].destTerminal+"</td></tr>";
						str += "<tr><th>스케줄</th><td colspan='3'>"+replaceAll(infd[i].schedule,"(우등)","")+"</td></tr>";
						str += "<tr><th>소요 시간</th><td>"+infd[i].wasteTime
							+"</td><th>금액</th><td>우등:	"+numberFormat(infd[i].specialFare)+"일반:"+numberFormat(infd[i].normalFare)+"</td></tr></table>";
								
								
								}

						document.getElementById("resultDiv").innerHTML = str;	
						
						}	
					
				document.getElementById("resultDiv2").innerHTML = "";	
					
					
				}
			
					
				}
					
				}
				
function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
	}
			
		
		
	
		
</script>

	<div id ="busD">
		<h3> 고속버스 터미널 조회 <br>
		<input type="text" id="startCityTerminal">
		<button onclick="searchExpressBusTerminalAJAX();">찾기</button>
		</h3>
	</div>
	<div id="resultDiv"></div>
	<div id="resultDiv2">

		<!-- 결과창 -->
</div>

</body>
</html>