<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="./resources/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="./resources/style.css"> <!-- Resource style -->
	<script src="./resources/modernizr.js"></script> <!-- Modernizr -->
  	
	<title>BTS</title>
</head>
<body>
<header>
	<nav class="cd-stretchy-nav">
		<a class="cd-nav-trigger" href="#0">
			Menu
			<span aria-hidden="true"></span>
		</a>

		<ul>
			<li><a href="#0" class="active"><span>MyPage</span></a></li>
			<li><a href="#0"><span>SEARCH</span></a></li>
			<li><a href="#0"><span>BUS</span></a></li>
			<li><a href="#0"><span>TRAIN</span></a></li>
			<li><a href="#0"><span>SUBWAY</span></a></li>
		</ul>

		<span aria-hidden="true" class="stretchy-nav-bg"></span>
	</nav>
</header>

<main class="cd-main-content" id ="map11">
	<!-- main content here -->
	
	



	
</main>

	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>
<script>
var lat , lng;
navigator.geolocation.getCurrentPosition(function(gg){
	lat = gg.coords.latitude;
	lng = gg.coords.longitude;
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 
	var container = document.getElementById('map11'); //지도를 담을 영역의 DOM 레퍼런스
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
<script src="./resources/main.js"></script> <!-- Resource jQuery -->
</body>
</html>