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

 <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm" id="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="seq" value="${detail.seq}"/>
               <input type="text" class="form-control" id="contents" name="contents" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="commentInsertBtn" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
    
    <input type="hidden" id="lid" value="${sessionScope.id }">

<!--                     추가                         -->
<%@ include file="commentS.jsp" %>

</body>
</html>