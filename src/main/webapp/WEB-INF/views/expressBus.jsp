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
						document.getElementById("resultDiv").innerHTML = str;

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
				str += "<div class='box'> <h1> 노선 정보</h1>";
				if(inf.length==2){
					for(var i =0;i<inf.length;i++){
						
						infd[i] = resultObj["result"]["station"][i];
						console.log(inf.length);
						
						
						
			
						
						if(i==0){
								str += "<h3> 프리미엄 버스입니다.</h3>";
								str += "<p> 출발 터미널	:	"+infd[i].startTerminal+"</p>";
								str += "<p> 도착 터미널:	"+infd[i].destTerminal+"</p>";
								str += "<p> 스케줄:	"+infd[i].schedule+"</p>";
								str += "<p> 소요시간 : " +infd[i].wasteTime+"</br>"+ "</p>";
								if(infd[i].specialFare>=10000){
									str += "<p>금액 : " + (infd[i].specialFare-infd[i].specialFare%10000)/10000+"만	"+ infd[i].specialFare%10000+"원"+ "</p>";
									}else{
										"<p> 금액:	" +infd[i].specialFare+"원"+ "</p>";
									}
								
								
								
						
						}else if(i==1){
							str += "<div class='box'> <h1> 노선 정보</h1>";
								str += "<h3> 일반, 우등 버스 입니다.</h3>";
								str += "<p> 출발 터미널	:	"+infd[i].startTerminal+"</p>";
								str += "<p> 도착 터미널:	"+infd[i].destTerminal+"</p>";
								str += "<p> 스케줄:	"+infd[i].schedule+"</p>";
								str += "<p> 소요시간 : " +infd[i].wasteTime+ "</p>";
								if(inf[i].specialFare>=10000){
									str += "<p>금액 : " + (infd[i].specialFare-infd[i].specialFare%10000)/10000+"만	"+ infd[i].specialFare%10000+"원"+ "</p>";
									}else{
										"<p> 금액:	" +infd[i].specialFare+"원"+ "</p>";
									}
								
								
								}
						str += "</div>";
						document.getElementById("resultDiv").innerHTML = str;	
						}	
					
				}else{
					
						for(var i =0;i<inf.length;i++){
						
						infd[i] = resultObj["result"]["station"][i];

						
						
							str += "<h3> 일반, 우등 버스 입니다.</h3>";
								str += "<p> 출발 터미널	:	"+infd[i].startTerminal+"</p>";
								str += "<p> 도착 터미널:	"+infd[i].destTerminal+"</p>";
								str += "<p> 스케줄:	"+infd[i].schedule+"</p>";
								str += "<p> 소요시간 : " +infd[i].wasteTime+ "</p>";
								if(inf[i].specialFare>=10000){
									str += "<p>금액 : " + (infd[i].specialFare-infd[i].specialFare%10000)/10000+"만	"+ infd[i].specialFare%10000+"원"+ "</p>";
									}else{
										"<p> 금액:	" +infd[i].specialFare+"원"+ "</p>";
									}
								
								
								}
						str += "</div>";
						document.getElementById("resultDiv").innerHTML = str;	
						}	
					
					
					
					
				}
			
					
				}
					
				}
				
				
			
		
		
	
		
</script>
</head>
<body>
	<div>
		<input type="text" id="startCityTerminal">
		<button onclick="searchExpressBusTerminalAJAX();">click</button>

	</div>
	<div id="resultDiv">

		<!-- 결과창 -->
</div>

</body>
</html>