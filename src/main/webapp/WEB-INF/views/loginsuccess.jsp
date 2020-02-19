<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>BTS 대중교통 Login</title>
<link rel="stylesheet" href="./resources/login_screen.css">
   <link rel="shortcut icon" type="image/x-icon" href="https://jjalbang.today/files/jjalboxthumb/2017/12/102_6515.jpg" />
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
body input {
  font-size: 12px;
  margin:auto;
  text-align:center;
  line-height: 42px;
  display: block;
  width: 25%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  
}
body input:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body input:focus {
  outline: none;
}
</style>

</head>
<body>
	<div id="bg" alt="배경"></div>
	<section class="container22">
		<video id="gz" autoplay>
		<source src="./resources/gazua.mp4" type="video/mp4">
	</video>
	<br><br><br>
			<input type= "button" id="rapidgo" value="스킵">
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


	
	
</body>
</html>
	