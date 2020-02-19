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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {

	
});
</script>
</head>
<body>
<div class="container">
    <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>게시글 수정</label>
    </div>

<div class="col-xs-12">
<form action="./update" method="post" >


		  <input type="hidden" name="seq" value=${vo.seq }>


		  <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
          </div>
          
          <div class="form-group">
            <label for="contents">내용</label>
            <input type="text" class="form-control" id="contents" name="contents" value="${vo.contents}">
          </div>
          
          <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" value="${vo.pw}">
          </div>



			<input type="hidden" name="writer" value=${vo.writer }>


<button type="submit" id="updatebtn" class="btn btn-primary btn-sm" style="float:right;">수정</button>
<button type="submit" class="btn btn-primary btn-sm" style="float:right;" onclick="location.href='./boardlist'">취소</button>
</form>
</div>
</div>
</body>
</html>
</layoutTag:layout>