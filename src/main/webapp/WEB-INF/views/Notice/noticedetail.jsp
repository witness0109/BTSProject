<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>      <!-- 추가 -->
<layoutTag:layout> 


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
<h2>게시글 상세</h2>
<br>
<br>


<div class="container">

	<div class="form-group">
		<label>글번호</label>
		<p>${detail.seq}</p>
	</div>	
	
	<div class="form-group">
		<label>글제목</label>
		<p>${detail.title}</p>
	</div>
	
	<div class="form-group">
		<label>내용</label>
		<p>${detail.contents}</p>
	</div>	
	
	<div class="form-group">
		<label>작성자</label>
		<p>${detail.writer}</p>
	</div>		
	
	<div class="form-group">
		<label>날짜</label>
		<p>${detail.time}</p>
	</div>	
</div>

<div class="btn-group btn-group-sm" role="group" style="float:right;">
<c:if test="${sessionScope.id == 'system'}">
<input type="button" class="btn btn-default" value="글수정" onclick="location.href='noticeupdate?seq=${detail.seq}'">
<input type="button" class="btn btn-default" value="글삭제" onclick="location.href='noticedelete?seq=${detail.seq}'">
</c:if>
<input type="button" class="btn btn-default" value="글목록" id="list">

</div>




</body>
</html>
</layoutTag:layout> 