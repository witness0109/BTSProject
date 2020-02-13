<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<style>
		@import url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');

		@import url('http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css');
		
		html, body {
            margin: 0;
            width: 100%;
            height: 100%;
        }
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
			border-radius: 5px;			
			border: 2px solid #293949;
			width: auto;
			padding-left: 5px;
			color: #23313f;
			z-index: 1;
			background-color: white;
			font-size: 15px;
			text-align: center;
			letter-spacing: 0.1em;

		}

		.content {
			float: left;
		}

		.divcontainer {
		left: 240px;
		margin-right: -240px;
		height: 100%;
		width: 100%;
 		position: absolute;
		z-index: 1;	
  		background-color: #23313f;
  		

		}

		.divcontainer #map11 {
		width: 75%;
		height: 100%;	
		}
		

		.divcontainer #leftside {
		
			padding-top: 5%;
			padding-left:	1%;
			padding-right: 1%;
			width: 25%;
			height: 100%;
			float: left;
			background-color: #23313f;
			overflow: scroll;
			

		}

		.divcontainer #leftside .box {
			width: 100%;
			height: AUTO;
			border: 2px solid white;
			border-radius: 5px;
			padding: 15px;
			margin: 15px;
			float: left;
			color: #ffffff;
			line-height: 2em;
		}

		.divcontainer #leftside .box.expbus {
			/*  width: 85%; */
			height: AUTO;
			width: 100%;
			border: 1px solid violet;
			border-radius: 5px;
			padding: 15px;
			margin: 15px;
			line-height: 2em;
		}

		.divcontainer #leftside .box.train {
			/*  width: 85%; */
			height: AUTO;
			border: 1px solid red;
			border-radius: 5px;
			padding: 15px;
			margin: 15px;
			line-height: 2em;
		}

	
		.sidebar-toggle {
			margin-left: -240px;
		}

		.sidebar {
			width: 240px;
			height: 100%;
			background: #293949;
			position: absolute;
			-webkit-transition: all 0.3s ease-in-out;
			-moz-transition: all 0.3s ease-in-out;
			-o-transition: all 0.3s ease-in-out;
			-ms-transition: all 0.3s ease-in-out;
			transition: all 0.3s ease-in-out;
			z-index: 100;
		}

		.sidebar #leftside-navigation ul,
		.sidebar #leftside-navigation ul ul {
			margin: -2px 0 0;
			padding: 0;
		}

		.sidebar #leftside-navigation ul li {
			list-style-type: none;
			border-bottom: 1px solid rgba(255, 255, 255, 0.05);
		}

		.sidebar #leftside-navigation ul li.active>a {
			/* 클릭시 글자 색 */
			color: #1abc9c;
		}

		.sidebar #leftside-navigation ul li.active ul {
			display: block;
		}

		.sidebar #leftside-navigation ul li a {
			color: #aeb2b7;
			text-decoration: none;
			display: block;
			padding: 18px 0 18px 25px;
			font-size: 12px;
			outline: 0;
			-webkit-transition: all 200ms ease-in;
			-moz-transition: all 200ms ease-in;
			-o-transition: all 200ms ease-in;
			-ms-transition: all 200ms ease-in;
			transition: all 200ms ease-in;
		}

		.sidebar #leftside-navigation ul li a:hover {
			color: #1abc9c;
		}

		.sidebar #leftside-navigation ul li a span {
			display: inline-block;
		}

		.sidebar #leftside-navigation ul li a i {
			width: 20px;
		}

		.sidebar #leftside-navigation ul li a i .fa-angle-left,
		.sidebar #leftside-navigation ul li a i .fa-angle-right {
			padding-top: 3px;
		}

		.sidebar #leftside-navigation ul ul {
			display: none;
		}

		.sidebar #leftside-navigation ul ul li {
			background: #23313f;
			margin-bottom: 0;
			margin-left: 0;
			margin-right: 0;
			border-bottom: none;
		}

		.sidebar #leftside-navigation ul ul li a {
			font-size: 12px;
			padding-top: 13px;
			padding-bottom: 13px;
			color: #aeb2b7;
		}

		.divcontainer #leftside .box.train {
			/*  width: 85%; */
			height: AUTO;
			border: 1px solid red;
			border-radius: 5px;
			padding: 15px;
			margin: 15px;
			line-height: 1.5em;
		}

		.divcontainer #leftside.cd-main-content {
			left: 240px;
			float: left;
			height: 400px;
			overflow: scroll;
		}

		table.traintable {
			text-align: center;
			border: 1px solid white;
			width: 100%
		}

		table.traintable td {
			width: 33.3%;
			border: 1px solid white;
		}


		div#weather{
			/* border : 1px double gold; */
			
			padding: 20px 20px 20px 20px;
			color : white;
			text-align: justify;
			font-size: 15px;
			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
			letter-spacing: 0.1em;
			line-height: 1.5em;
			
		}
		h2{
			text-align: center;
			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;	
			color : white;	
		}
	
		#busD{
			color: white;
			font-size: xx-large;
			letter-spacing: 0.1em;
			line-height: 1.5em;
		}
		
		#asidedivbtn{
			text-align: center;
			padding-bottom: 0;

			
		}
		.asidebtn{
			
			background: none;
			color: #aeb2b7;
			border: none;
			padding-left: 5px;
		}
		
		#intercityB {
		border: 2px solid white;
		}
		
		th,tr,td {
		border: 2px solid white;
		
		}
		
	
		</style>

</style>


</style>

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="./resources/reset.css">
	<!-- CSS reset -->
	<link rel="stylesheet" href="./resources/style.css">
	<!-- Resource style -->
	<link rel="stylesheet" href="./resources/pathbox.css">
	
	<!-- Resource style -->


	<script type="text/javascript">
		var id = '<%=session.getAttribute("id")%>';
	</script>

	<link rel="stylesheet" href="./resources/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="./resources/style.css"> <!-- Resource style -->
	<link rel="stylesheet" href="./resources/pathbox.css"> <!-- Resource style -->


	<title>BTS</title>
</head>

<body>	
	
<aside class="sidebar" >
		<div id="leftside-navigation" class="nano">
			<ul class="nano-content" id="parent">
			<!-- BTS 클릭시 홈화면으로 이동 -->
				<li><a href="./BTSMap"><i class="fa fa-dashboard"></i><span>BTS</span></a></li>
				<li class="sub-menu"><a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>길 찾기</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>


					</ul>
				</li>


				<li class="sub-menu"><a href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i><span>기차 정보</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a id="train_TM">기차 시간표 조회</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="javascript:void(0);"><i class="fa fa-map-marker"></i><span>버스 정보</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a id="busTM">시내 버스 노선 조회</a></li>
						<li><a id="intercityBusTM">시외 버스 시간표 조회</a></li>
						<li><a id="expressBusTM">고속 버스 시간표 조회</a></li>
					</ul>
				</li>
				<li class="sub-menu" id="son"><a href="javascript:void(0);"><i class="fa fa-file"></i><span>MyPage</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a href="pages-blank.html">즐겨 찾기 목록</a></li>
						<li><a href="pages-login.html">경로 검색 목록</a></li>
						<li><a href="./Mypage">회원 정보 수정</a></li>
					</ul>
				</li>
			</ul>
			
			
		</div>
		<div id="weather"></div>
		
		<div id= "asidedivbtn">
		<input type="button" id="logoutbtn"  class= "asidebtn" value="로그아웃"> 
		<input type="button" id="boardbtn"  class= "asidebtn" value="고객의소리">
		</div>
		
	</aside>

<div class="divcontainer">
		<!-- class="cd-main-content" -->
		<div id="leftside" >
			<div>
				<button class="findbtn" id="findpath">길찾기</button>
				<button class="findbtn" id="findpath2">길찾기2</button>
				<select id="searchOption" class="content">
					<option>검색먼저</option>
				</select>
				<button id="applyopt" class="content">조건 적용</button>
			</div>
			<div id="findresult" class="content">
				<!-- class=content 수정해야돼  css 바꿔야돼 -->

			</div>

		</div>
<div id="map11" ></div>
	</div>

	<!-- main content here -->
	




<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>
<script type="text/javascript" src="./resources/mapcontrol1.js"></script>
<script type="text/javascript" src="./resources/mapcontrol2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="./resources/main.js"></script> 
<script src="./resources/pathcontrol1.js"></script>
<script src="./resources/menumenu.js"></script>
<script src="./resources/weather.js"></script>
<script type="text/javascript" src="./resources/whole_control.js"></script>	<!-- Resource jQuery -->

<script>


		$(document).ready(function () {


			$("#logoutbtn").on('click', function () {
				alert("로그아웃 되었습니다.");
				location.href = "./logout";
				
			});

			
			$("#boardbtn").on('click', function () {
				location.href = "./boardlist";
			});
	
			});


		$("#leftside-navigation .sub-menu > a").click(function (e) {
				$("#leftside-navigation ul ul").slideUp(), $(this).next().is(":visible") || $(this).next().slideDown(),
					e.stopPropagation();

		});
		
	


		</script>


<<<<<<< HEAD
	<script type="text/javascript" src="./resources/mapcontrol1.js"></script>
	<script type="text/javascript" src="./resources/mapcontrol2.js"></script>
	<script type="text/javascript" src="./resources/whole_control.js"></script>
	<script src="./resources/main.js"></script>
	<!-- Resource jQuery -->
	<script src="./resources/pathcontrol1.js"></script>
	<script src="./resources/menumenu.js"></script>


	

=======
>>>>>>> 36662052f35df55633f7d81d79c021f2f4cd917d
</body>

</html>