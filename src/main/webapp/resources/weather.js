function getWeather(map) {

    // 지도의 레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다
    var latlng = map.getCenter(); 

 
    url = "https://apis.openapi.sk.com/weather/current/hourly?APPKey=l7xxacab725f5bca4094909b27b4d5244e78&"+
    "lat="+latlng.getLat()+"&lon="+latlng.getLng();

                
    console.log(url);
   
   	$.ajax({
		
		type: "GET",
		url : url,
		contentType : 'application/json',
		success : function(g){
			getWeatherInf(g);
		},
		error : function(error){
			alert(error + "에러");
		}
	});
    
   	// 날씨정보 입력창 (임시)
    var message = "";
    function getWeatherInf(w){
    	var key = w.weather.hourly[0];
    	
    	//위치정보
    	var city = key.grid.city;
    	var county = key.grid.county;
    	var village = key.grid.village;
    	
    	//날씨정보
    	var sky = key.sky.name;
    	var nowtp = key.temperature.tc;
    	var maxtp = key.temperature.tmax;
    	var mintp = key.temperature.tmin;
    	var hum = key.humidity;
    	
    	message += "<h2> 오늘의 날씨</h3><br>";
    	message +=  city+ " " +county +" "+ village + "<br>";
    	message += "하늘상태 : " + sky + "<br>현재기온 : " + nowtp +"℃<br>최고기온 : " + maxtp + "℃<br>최저기온 : " +mintp + "℃<br>습도 : " + hum+"%";
    	var resultDiv = document.getElementById('weather');
        resultDiv.innerHTML = message;
    	
    }
    
}