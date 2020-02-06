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
<form action="./update" method="post" >
<input type="hidden" name="seq" value=${vo.seq }>
<table>

<tr>
<td>글제목</td>
<td><input type="text" name="title" value= ${vo.title }></td>
</tr>

<tr>
<td>내용</td>
<td><input type="text" name="contents" value=${vo.contents }></td>
</tr>

<input type="hidden" name="writer" value=${vo.writer }>

<tr>
<td>비밀번호</td>
<td><input type="password" name="pw" value=${vo.pw }></td>
</tr>

</table>

<input type="submit" id="updatebtn" value="수정완료">
</form>
</body>
</html>