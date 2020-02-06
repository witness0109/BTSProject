<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>ㅎㅎㅎㅎ</title>

<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  /* background-color: #f8f8f8; */  
  
 /*  
  background-image: url(./resources/background.png);
  -webkit-filter: blur(5px); 
  -moz-filter: blur(5px); 
  -o-filter: blur(5px); 
  -ms-filter: blur(5px); 
  filter: blur(5px);
   */
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
body .container .half.bg {
/*   background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat; */
  
  
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
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
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
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
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
 /*  position: absolute; */
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>

   window.onload = function() { 

    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('50ae0ab7622b2063e98c76cd2db14d2e');
    //Kakao.Auth.setAccessToken(accessTokenFromServer);
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
        	  
        
    
         alert(res.properties.nickname+'님 환영합니다.' + JSON.stringify(res.kaccount_email));
         var inf = JSON.stringify(res);   
         var loginemail = document.getElementById("kakao");
         loginemail.innerHTML = JSON.stringify(res.kaccount_email);
         
       
         
        /*   console.log(JSON.stringify(res.kaccount_email));
         console.log(JSON.stringify(res.id));
         console.log(JSON.stringify(res.properties.profile_image));
         console.log(JSON.stringify(res.properties.nickname)); */ 
         var email = res.kaccount_email;
         var name = res.properties.nickname;
         
       location.href='kakaocheck?email='+email+"&name="+name;
       		
       		
       		
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });

    
}
   

</script>
</head>
<body>

<section class="container">
		    <article class="half">
			        <h1>BTS 가즈아 </h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">Log in</a></span>
				            <span class="tab signup"><a href="#signup">Sign up</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="./login" method="post">
						                    <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your Id">
						                    <label for="email">Your ID</label>
						                    <input type="password" name="pw" id="password" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label>
						                    <!-- 카카오 , 네이버 로그인-->
						                    
						                    <div id="naver_id_login" style="text-align: center" class="inpt">
											<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				
				
		<div id="kakao" style="text-align: center"><a id="kakao-login-btn" style="text-align: center" class="inpt"></a></div>
		 <br>
		
		<!-- 로그인 끝  -->
						                    <div class="submit-wrap">
							                        <input type="submit" value="Log in" class="submit">
							                        <!-- ajax 비밀번호 찾기 -->
							                       <a href="/BTS/checkpw" class="more">Forgot your password?</a>
							                       <label onclick = "searchdetailBusLaneAJAX();"for="remember"></label>
							                       
							                      
						                    </div>
        					        </form>
    				        </div>
    				        <div class="signup-cont cont">

                <form action="/BTS/insertmember" method="post" onsubmit="return confirm()">
                <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your Id">
                			    <label for="id">Your ID</label>
								<div id="email_check"></div>
				<input type="password" name="pw" id="password" class="inpt" required="required" placeholder="Your Password">
                			    <label for="password">Your password</label>
				<input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your Name">
						        <label for="name">Your name</label>
                <input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your Email">
						        <label for="email">Your email</label>
				<input type="text" name="phone" id="phone" class="inpt" placeholder="Your PhoneNumber">
<!-- 					            <label for="phone">Your Phonenumber</label> -->
						                   
						        <div class="submit-wrap">
						                    
						    <input type="submit" value="Sign up" class="submit" >
						    <script type="text/javascript">
						    function confirm(){
						    	alert("회원가입성공");
						        }
						    </script>
			                    </div>
			                          </form>
            </div>
			        </div>
		    </article>
		   
	</section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
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
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});

var submitbt = $('input[type="submit"]');

$("#id").blur(function(e){
  	 $.ajax({
           url:'https://192.168.0.17/BTS/checkmember',
           data : {'id':$(this).val()},
           type : 'post',
           datatype : 'json',
           success:function(data){
               if(data=='1'){
              	 $('#email_check').html("<p style='color:red'>사용 불가능한 아이디 입니다</p>");
              	submitbt.attr( 'disabled', true );
               }else{
              	 $('#email_check').html("<p style='color:green'>사용 가능한 아이디 입니다</p>");
              	submitbt.attr( 'disabled', false );
               }
           },
           error : function (e) {
               console.log(e.message)
           }
       })
  	
  });
  
  function fpAJAX(){
	  
  }
</script>
</body>
</html>
