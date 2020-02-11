<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가자ㅏㅏ</title>
</head>
<body>
<video autoplay>
  <source src="./resources/gazua.mp4" type="video/mp4" >
</video>
<script>
var i = 5;
setInterval(function() {
if(i==0){
	location.href = "./BTSMap"
}else{
	i--;
}
}, 1000);

</script>
</body>
</html>