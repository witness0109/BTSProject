<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var pp = '${check}'
if(pp !=''){
if(confirm("비밀번호는"+'${password }'+"입니다.")){
	location.href='/BTS/login';
}
}
</script>
<body>

<form action="/BTS/checkpw" method="post">
<input type="text" name="id"><br>
<button>버튼</button>


</form>

</body>
</html>