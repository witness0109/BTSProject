<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script>
$(document).ready(function() {

	
});
</script>
</head>
<body>
<form action="./boardwrite" method="post">
제목<input type="text" value="제목" name="title"><br>
내용입력<textarea placeholder="내용입력" rows="5" cols="40" name="contents"></textarea><br>
작성자<input type="text" value="<%=session.getAttribute("id") %>" name="writer"><br>
암호<input type="password" value="암호" name="pw"><br>
<input type="submit" value="작성완료" >
</form>
</body>
</html>