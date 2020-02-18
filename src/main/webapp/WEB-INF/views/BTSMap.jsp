<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">



	

<link rel="stylesheet" href="./resources/BTSMap_Main.css">


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

	<title>BTS</title>
</head>

<body>	
	
<aside class="sidebar" >
		<div id="leftside-navigation" class="nano">
			<ul class="nano-content" id="parent">


				<li><a href="./BTSMap"><i class="fa fa-map"></i><span>길 찾기</span></a></li>							


				<li class="sub-menu"><a href="javascript:void(0);"><i class="fa fa-train"></i><span>열차 정보</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a id="train_TM">기차 시간표 조회</a></li>
						<li><a id="subw_TM">역 별 지하철 시간표 조회</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="javascript:void(0);"><i class="fa fa-bus" aria-hidden="true"></i><span>버스 정보</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a id="busTM">시내 버스 노선 조회</a></li>
						<li><a id="intercityBusTM">시외 버스 시간표 조회</a></li>
						<li><a id="expressBusTM">고속 버스 시간표 조회</a></li>
					</ul>
				</li>
				<li class="sub-menu" id="son"><a href="javascript:void(0);"><i class="fa fa-user-circle"></i><span>MyPage</span><i
							class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a href="./favorites">즐겨 찾기 목록</a></li>
						<li><a href="pages-login.html">경로 검색 목록</a></li>
						<li><a href="./Mypage">회원 정보 수정</a></li>
					</ul>
				</li>
			</ul>
			
			
		</div>
		<div id="weather"></div>
		<div id= "asidedivbtn">
		<div id="leftside-navigation" class="nano">
		<ul class="nano-content" id="parent">
		
		
		<li class="sub-menu"><a><i><input type="button" id="boardbtn"  class= "asidebtn" value="고객의소리"> </i> </a></li>
		<li class="sub-menu"><a><i><input type="button" id="logoutbtn"  class= "asidebtn" value="로그아웃"> </i> </a></li>
		</ul>
		</div>
		</div>
	</aside>

<div class="divcontainer">
		<div id="leftside" >
			<div>
			<div class="box">
					<label for="startaddr">출발지 : </label>
					<input type ="text" id="startaddr" placeholder="출발주소" readonly="readonly"><br>
					<label for="startaddr">도착지 : </label>
					<input type ="text" id="endaddr" placeholder="도착주소" readonly="readonly">

				</div>
				<button class="findbtn" id="findpath">시내 길찾기</button>
				<button class="findbtn" id="findpath2">시외 길찾기</button>
				<div id="searchOption" class="content">
				</div>
			</div>
			<div id="findbox" class="content">
				
			</div>
			<div id="findresult" class="content">
			
			</div>

		</div>
<div id="map11" ></div>
	</div>

	<!-- main content here -->
	
<script src="https://use.fontawesome.com/9d2aba8fba.js"></script><!--aside 이모티콘-->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ea5ab23c61a505da910433d441dc2dbe"></script>
<script type="text/javascript" src="./resources/mapcontrol1.js"></script>
<script type="text/javascript" src="./resources/mapcontrol2.js"></script>
<script type="text/javascript" src="./resources/mapcontrol3.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="./resources/main.js"></script> 
<script src="./resources/pathcontrol1.js"></script>
<script src="./resources/pathfunction.js"></script>
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



</body>

</html>