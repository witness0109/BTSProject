<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
$('#list').on('click',function(){
	location.href="./boardlist";
});
	
});
</script>
</head>
<body>
<table>
<tr>
<td>글번호</td>
<td>${detail.seq}</td>
</tr>
<tr>
<td>글제목</td>
<td>${detail.title}</td>
</tr>
<tr>
<td>내용</td>
<td>${detail.contents}</td>
</tr>
<tr>
<td>작성자</td>
<td>${detail.writer}</td>
</tr>
<tr>
<td>날짜</td>
<td>${detail.time}</td>
</tr>


</table>
<input type="button" value="글수정" onclick="location.href='update?seq=${detail.seq}'">
<input type="button" value="글삭제" onclick="location.href='deleteboard?seq=${detail.seq}'">
<input type="button" value="글목록" id="list">
</body>
</html>