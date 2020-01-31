<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>

<title>Insert title here</title>
</head>
<body>


<div id="map" style="width:100%;height:400px;"></div>

<script type="text/javascript">

var lat , lng;
navigator.geolocation.getCurrentPosition(function(gg){
	lat = gg.coords.latitude;
	lng = gg.coords.longitude;
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: markerPosition, //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
})


</script>
</body>
</html>