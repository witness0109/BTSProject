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
</style>

<script src="./resources/searchtrain.js"></script>

</head>
<body>
	<div>
		<input type="text" id="cityname">
		<button onclick="searchTrainStationAJAX();">click</button>

	</div>
	<div id="resultDiv">
		<!--  <button onclick="window.open('https://192.168.0.17/BTS/login','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">검색</button>  -->
		<!-- 결과창 -->
	</div>

	<div id="resultDiv2">

		<!-- 결과창 -->
	</div>

	<div id="fareDiv">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv3">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv4">

		<!-- 결과창 -->
	</div>

	<div id="resultDiv5">

		<!-- 결과창 -->
	</div>

</body>
</html>