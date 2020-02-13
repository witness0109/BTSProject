<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>BTS 대중교통 Login</title>
<link rel="stylesheet" href="./resources/login_screen.css">
<!-- CSS reset -->

<style>
.container22{
position: relative;
    overflow: hidden;
    width: 800px;
    height: 600px;
    top: 15vh;
    margin: auto;
    background-color: #ffffff;
    -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
    box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
</style>

</head>
<body>
	<div id="bg" alt="배경"></div>
	<section class="container22">
		<video id="gz" autoplay>
		<source src="./resources/gazua.mp4" type="video/mp4">
	</video>
	<button id="rapidgo">SKIP</button>
	</section>
	<script>
		document.getElementById('gz').play()
		var i = 5;
		setInterval(function() {
			if (i == 0) {
				location.href = "./BTSMap"
			} else {
				i--;
			}
		}, 1000);
		
		var skip = document.getElementById('rapidgo');
		
		skip.onclick = function(){
			location.href = "./BTSMap";
		}
	</script>
		<input type= "button" id="rapidgo" value="스킵">

	
	
</body>
</html>
	