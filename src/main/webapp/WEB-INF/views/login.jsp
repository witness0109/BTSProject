<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>BTS 대중교통 Login</title>
<link rel="stylesheet" href="./resources/login_screen.css">
<!-- CSS reset -->

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	window.onload = function() {

		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('50ae0ab7622b2063e98c76cd2db14d2e');

		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {

						var email = res.kaccount_email;
						var name = res.properties.nickname;

						location.href = 'kakaocheck?email=' + email + "&name=" + name;

					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});


	}
</script>
</head>
<body>
	<div id="bg" alt="배경"></div>
	<section class="container">
		<article class="half">
			<h1>BTS 가즈아</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">Log in</a></span>
				<span class="tab signup"><a href="#signup">Sign up</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form action="/BTS/login" method="post">

						<input type="text" name="id" id="id1" class="inpt" required="required" placeholder="Your Id"> 
							<label for="id">Your ID</label> 
							<input type="password" name="pw" id="password" class="inpt" required="required"	placeholder="Your password">
							<label for="password">Your password</label> 
						<!-- 카카오 , 네이버 로그인-->

						<div id="naver_id_login" style="text-align: center" class="inpt" > 
							<a href="${url}"> <img width="223"
								src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>


						<div id="kakao" style="text-align: center" class="inpt">
							<a id="kakao-login-btn" style="text-align: center" class="inpt"></a>
						</div>
						<br>

						<!-- 로그인 끝  -->
						<div class="submit-wrap">
							<input type="submit" value="Log in" class="submit">
							<!-- ajax 비밀번호 찾기 -->
							<a href="/BTS/checkpw" class="more">Forgot your password?</a> <label
								 for="remember"></label>


						</div>
					</form>
				</div>
				<div class="signup-cont cont">

					<form action="/BTS/insertmember" method="post"
						onsubmit="return confirm()">
						<input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your Id"> 
							<label for="id">Your ID</label>
					<div id="email_check"></div>
						<input type="password" name="pw" id="password" class="inpt"	required="required" placeholder="Your Password"> 
							<label for="password">Your password</label> 
						<input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your Name"> 
							<label for="name">Your name</label> 
						<input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your Email"> 
							<label for="email">Your email</label> 
						<input type="text" name="phone" id="phone" class="inpt" placeholder="Your PhoneNumber">
						<!-- 					            <label for="phone">Your Phonenumber</label> -->

						<div class="submit-wrap">

							<input type="submit" value="Sign up" class="submit"
								id="submit_enroll">
							<script type="text/javascript">
								function confirm() {
									alert("회원가입성공");
								}
							</script>
		
						</div>
					</form>
				</div>
			</div>
		</article>

	</section>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}

		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});

		var submitbt = $('#submit_enroll');

		$("#id").blur(function(e) {					
			$.ajax({
					url : 'https://192.168.0.17/BTS/checkmember',
					data : {'id' : $(this).val()},
					type : 'post',
					datatype : 'json',
					success : function(data) {
						if (data == '1') {
							$('#email_check').html("<p style='color:red'>사용 불가능한 아이디 입니다</p>");
							submitbt.attr('disabled', true);
						} else {
							$('#email_check').html("<p style='color:green'>사용 가능한 아이디 입니다</p>");
							submitbt.attr('disabled', false);
						}
					},
					error : function(e) {
						console.log(e.message)
										}
									})

						});



	</script>

</body>
</html>
