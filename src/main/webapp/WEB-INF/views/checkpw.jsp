<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Lato', sans-serif;
}

body .container {
	position: relative;
	overflow: hidden;
	width: 350px;
	height: 700px;
	margin: 80px auto 0;
	background-color: #ffffff;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}

body .container .half {
	float: left;
	width: 100%;
	height: 100%;
	padding: 58px 40px 0;
}

body .container .content input.inpt {
	font-size: 14px;
	display: block;
	width: 100%;
	height: 42px;
	margin-bottom: 12px;
	padding: 16px 13px;
	color: #999999;
	border: 1px solid #d9d9d9;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

body .container .inpt::-webkit-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .inpt:-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .inpt::-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .inpt:-ms-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .inpt:focus {
	border-color: #999999;
}
</style>
</head>
<script type="text/javascript">
	var pp = '${check}'
	if (pp != '') {
		if (confirm("비밀번호는" + '${password }' + "입니다.")) {
			location.href = '/BTS/login';
		}
	}
</script>
<body>
	<article class="container">
		<article class="half">
			<h1>비밀번호 찾기</h1>
			<div class="check_pw">
			<form action="./checkpw" method="post">
				<input type="text" name="id" placeholder="Your Id" class="inpt"><br>
				<br>
				<input type="text" name="name" placeholder="Your Name" class="inpt"><br>
				<br>
				<button>비밀번호 조회</button>
			</form>
			</div>
		</article>
	</article>
</body>
</html>