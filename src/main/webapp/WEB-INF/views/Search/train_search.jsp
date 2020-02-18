<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.trainresult {
	width: 400px;
	height: 200px;
	border: 1px solid green;
	border-radius: 5px;
	padding: 15px;
	margin: 15px;
	overflow-y: scroll;
}
	
</style>

<script src="./resources/searchtrain.js"></script>

</head>
<body>

	<div id="busD">
		<h3> 기차 시간표 <br>
		<input type="text" id="cityname">
		<button onclick="searchTrainStationAJAX();">click</button>
		</h3>
	</div>
	<div id="resultDiv" class="trainresult">
		<!--  <button onclick="window.open('https://192.168.0.17/BTS/login','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">검색</button>  -->
		<!-- 결과창 -->
	</div>

	<div id="resultDiv2" class="trainresult">

		<!-- 결과창 -->
	</div>

	<div id="fareDiv" class="trainresult">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv3" class="trainresult">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv4" class="trainresult">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv5" class="trainresult">

		<!-- 결과창 -->
	</div>
<script src="./resources/searchtrain.js"></script>
</body>
</html>