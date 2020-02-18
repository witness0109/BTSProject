<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.box {
	width: 400px;
	height: 200px;
	border: 1px solid green;
	border-radius: 5px;
	padding: 15px;
	margin: 15px;
	overflow-y: scroll;
}
		.box table{
			width: 100%;
			height: AUTO;
			margin: auto;
		}
		.box table td,tr{
			width: 50%;
			text-align : center;
			border : 1px solid gray;
		}
		.box table h3{
			width: 100%;
			text-align : center;
			margin: auto;	
		}
</style>
</head>


<body>
<div id="busD">
		<h3> 지하철 시간표 <br>
		<input type="text" id="stationName"> 
		<select id="subCode">

			<option value="1">서울1호선</option>
			<option value="2">서울2호선</option>
			<option value="3">서울3호선</option>
			<option value="4">서울4호선</option>
			<option value="5">서울5호선</option>
			<option value="6">서울6호선</option>
			<option value="7">서울7호선</option>
			<option value="8">서울8호선</option>
			<option value="9">서울9호선</option>
			<option value="10">분당선</option>
			<option value="11">공항철도</option>
			<option value="12">경의중앙선</option>
			<option value="13">에버라인</option>
			<option value="14">경춘선</option>
			<option value="15">신분당선</option>
			<option value="16">의정부경전철</option>
			<option value="17">수인선</option>
			<option value="18">경강선</option>
			<option value="19">우이신설선</option>
			<option value="20">인천1호선</option>
			<option value="21">인천2호선</option>
			<option value="22">대전1호선</option>
			<option value="23">대구1호선</option>
			<option value="24">대구2호선</option>
			<option value="25">대구3호선</option>
			<option value="26">광주1호선</option>
			<option value="27">부산1호선</option>
			<option value="28">부산2호선</option>
			<option value="29">부산3호선</option>
			<option value="30">부산4호선</option>
			<option value="31">동해선</option>
			<option value="32">부산김해경전철</option>
		</select>
		<button onclick="searchSubwayStationAJAX();">click</button>
		</h3>
	</div>
	<div>
		

	</div>
	<div id="resultDiv">
		<!--  <button onclick="window.open('https://192.168.0.17/BTS/login','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">검색</button>  -->
		<!-- 결과창 -->
	</div>
<script src="./resources/searchsubway.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</html>