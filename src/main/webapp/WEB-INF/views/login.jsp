
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인 화면</title>

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
         
         /* console.log(JSON.stringify(res.kaccount_email));
         console.log(JSON.stringify(res.id));
         console.log(JSON.stringify(res.properties.profile_image));
         console.log(JSON.stringify(res.properties.nickname)); 
       		location.href="openapi";*/
       		
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
<h1>Login Form</h1>
	<hr>
	<br>
	<center>
	<c:choose>
			<c:when test="${sessionId != null}">
	
				<h3>'${sessionId}' 님 환영합니다!</h3>
				<h3>
					<a href="logout">로그아웃</a>
				</h3>
			</c:when>
			<c:otherwise>
				<form action="login.userdo" method="post" name="frm"
					style="width: 470px;">
					<h2>로그인</h2>
					<input type="text" name="id" id="id" class="w3-input w3-border"
						placeholder="아이디" value="${id}"> <br> 
						<input 	type="password" id="pwd" name="pwd" class="w3-input w3-border"
						placeholder="비밀번호"> <br> <input type="submit"
						value="로그인" onclick="#"> <br>
				</form>
				<br>
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				<br>
			</c:otherwise>
		</c:choose>
		<a id="kakao-login-btn"></a>
		<div id="kakao"></div>
	</center>


  


</body>
</html>