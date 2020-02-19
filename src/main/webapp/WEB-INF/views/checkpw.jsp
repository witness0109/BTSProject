<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
   <link rel="shortcut icon" type="image/x-icon" href="https://jjalbang.today/files/jjalboxthumb/2017/12/102_6515.jpg" />
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="./resources/login_screen.css">

</head>
<script type="text/javascript">
	window.onload = function() {

		var back = document.getElementById("backbtn");
		var id = document.getElementById("id1");
		var name = document.getElementById("name");
		var on = document.getElementById("onbtn");

		//back
		back.onclick = function() {

			location.href = "./login";
		}

		console.log(id + name);

	}

		//on
		on.onclick = function(){
			
			location.href = "./checkpw";
		}
		
</script>

<body>

	<div id="bg" alt="배경"></div>
	<article class="container">
		<div class="content">
			<article class="half">
				<h1>비밀번호 찾기</h1>
				<br>
				<div class="check_pw">
					<form action="./checkpw" method="post" >

						<input type="text" name="id" id="id1" placeholder="Your Id"
							class="inpt"><br> <input type="text" name="name"
							id="name" placeholder="Your Name" class="inpt"><br>
						<p id="wrong_name">${result}</p>
						<div class="submit-wrap">
							<input type="submit" value="비밀번호 확인" class="submit" id="onbtn"> <Br>
							<input type="button" value="취소" class="submit" id="backbtn">
						</div>
						<input type="hidden" name="password" value="${password}">
					</form>
				</div>

			</article>
		</div>
	</article>
</body>

</html>