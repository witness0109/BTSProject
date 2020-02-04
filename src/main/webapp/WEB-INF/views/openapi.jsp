<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */

html { box-sizing: border-box; }

*, *:before, *:after { box-sizing: inherit; }

body {
  background: #fafafa;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  margin: 0;
}

a { text-decoration: none; }

.container {
  width: 1000px;
  margin: auto;
}

div #map {



}

h1 { text-align:center; margin-top:150px;}

/* Navigation Styles */

nav { background: #2ba0db; }

nav ul {
  font-size: 0;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline-block;
  position: relative;
}

nav ul li a {
  color: #fff;
  display: block;
  font-size: 14px;
  padding: 15px 14px;
  transition: 0.3s linear;
}

nav ul li:hover { background: #126d9b; }

nav ul li ul {
  border-bottom: 5px solid #2ba0db;
  display: none;
  position: absolute;
  width: 250px;
}

nav ul li ul li {
  border-top: 1px solid #444;
  display: block;
}

nav ul li ul li:first-child { border-top: none; }

nav ul li ul li a {
  background: #373737;
  display: block;
  padding: 10px 14px;
}

nav ul li ul li a:hover { background: #126d9b; }

nav .fa.fa-angle-down { margin-left: 6px; }
</style>
<title>Insert title here</title>
</head>
<body>
<nav>
  <div class="container">
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About Us</a></li>
      <li> <a href="#">Categories<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">Category One</a></li>
          <li><a href="#">Category Two</a></li>
          <li><a href="#">Category Three</a></li>
        </ul>
      </li>
      <li class='sub-menu'> <a href="#">Services<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">Service One</a></li>
          <li><a href="#">Service Two</a></li>
          <li><a href="#">Service Three</a></li>
          <li><a href="#">Service Four</a></li>
          <li><a href="#">Service Five</a></li>
          <li><a href="#">Service Six</a></li>
        </ul>
      </li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>
</nav>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script>
$('nav li').hover(
  function() {
	  $('ul', this).stop().slideDown(200);
  },
	function() {
    $('ul', this).stop().slideUp(200);
  }
);
</script>



<div id="map" style="width:100%;height:800px;"></div>

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