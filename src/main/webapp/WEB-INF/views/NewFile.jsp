<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <style>
        .markingov {
            position: absolute;
            width: 80px;
            margin-left: -40px;
            bottom: 70px;
            border: 1px solid black;
            font-size: 20px;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            text-align: center;
        }

        .wrap {
            position: absolute;
            left: 0;
            bottom: 46px;
            width: 150px;
            height: 80px;
            margin-left: -75px;
            text-align: center;
            overflow: hidden;
            font-size: 20px;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            line-height: 1.5;
            background: #fff;
        }

        .wrap * {
            padding: 0;
            margin: 0;
        }

        .wrap .setContainer div {
            display: inline-block;
            margin: auto;
            height: 100%;
            width: 50%;
        }

        .wrap #startset {
            background-color: aqua;
            padding-top: 8px;
        }

        .wrap #destset {
            background-color: yellowgreen;
            padding-top: 8px;
        }

        button.findbtn {
            border-radius: 50px;
            width: 50px;
            float: left;
            color: white;
            z-index: 1;
            background-color: red;
            font-size: 15px;
            ;
        }

        .divcontainer {
            width: inherit;
            height: 800px;
        }

        .divcontainer #map11 {
            float: left;
            width: 70%;
            height: 100%;
        }

        .divcontainer #leftside {
            width: 30%;
            height: 100%;
            float: left;
            overflow: scroll;
            background-color : #ffffff;
        }

        .divcontainer #leftside .box {
            width: 85%;
            height: AUTO;
            border: 1px solid green;
            border-radius: 5px;
            padding: 15px;
            margin: 15px;
        }

        .divcontainer #leftside .box.expbus {
            width: 85%;
            height: AUTO;
            border: 1px solid violet;
            border-radius: 5px;
            padding: 15px;
            margin: 15px;
        }

        .divcontainer #leftside .box.train {
            width: 85%;
            height: AUTO;
            border: 1px solid red;
            border-radius: 5px;
            padding: 15px;
            margin: 15px;
        }
    </style>
	
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
			<li><a href="./logout" id="logoutbtn">로그아웃</a></li>
			
			
		</ul>

		<span aria-hidden="true" class="stretchy-nav-bg"></span>
	</nav>
</header>

	<!-- main content here -->
	<div class="divcontainer">
        <div id="leftside" class="cd-main-content"><div><button class="findbtn" id="findpath">길찾기</button>
            <button class="findbtn" id="findpath2">길찾기2</button>
            <select id="searchOption"><option>검색먼저</option></select><button id="applyopt">조건 적용</button>
        </div>
            <div id="findresult">

            </div>
        </div>
        <div id="map11" class="cd-main-content">
        </div>
    </div>

	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>

<script>


$(document).ready(function(){ 
	$("#logoutbtn").on('click', function(){
		alert("로그아웃 되었습니다.");
		location.href="./logout"
	});
});





</script>

<script type="text/javascript" src="./resources/mapcontrol1.js"></script>
 <script type="text/javascript" src="./resources/mapcontrol2.js"></script>
 
 <script src="./resources/main.js"></script> <!-- Resource jQuery -->
<script src="./resources/pathcontrol1.js"></script>
</body>
</html>