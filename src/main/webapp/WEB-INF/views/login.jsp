<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>API Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<script type='text/javascript'>
  //<![CDATA[
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
        	  
        	var inf = JSON.stringify(res);    
        alert(JSON.stringify(res));
         alert(res.properties.nickname+'님 환영합니다.' + JSON.stringify(res.kaccount_email));
         console.log(JSON.stringify(res.kaccount_email));
         console.log(JSON.stringify(res.id));
         console.log(JSON.stringify(res.properties.profile_image));
         console.log(JSON.stringify(res.properties.nickname));
       		//location.href="openapi";
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
  //]]>
</script>
<div id="kakao"></div>
</body>
</html>