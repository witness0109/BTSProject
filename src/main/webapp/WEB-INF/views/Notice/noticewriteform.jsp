<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="shortcut icon" type="image/x-icon" href="https://jjalbang.today/files/jjalboxthumb/2017/12/102_6515.jpg" />
<title>공지사항 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script>
$(document).ready(function() {

	
});
</script>
</head>
<body>

<div class="container">
    <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>공지사항 작성</label>
    </div>

<div class="col-xs-12">
	<form action="./noticewrite" method="post" >
		<div class="form-group">
		<label for="title">제목</label>
		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
		</div>
		
		<div class="form-group">
		<label for="contents">내용</label>
		<textarea class="form-control" id="contents" name="contents" rows="3"></textarea>
		</div>
		
		<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" class="form-control" id="writer" name="writer" placeholder="내용을 입력하세요." value="${sessionScope.id }">
		</div>
		
		<div class="form-group">
		<label for="pw">암호</label>
		<input type="password" class="form-control" id="pw" name="pw" placeholder="암호를 입력하세요.">
		</div>
		
<input type="submit" value="작성완료" class="btn btn-primary btn-sm" style="float:right;">
<input type="button" value="취소" class="btn btn-primary btn-sm"  style="float:right;" onclick="location.href='./noticelist'">
</form>
</div>
</div>
</body>
</html>
</layoutTag:layout>