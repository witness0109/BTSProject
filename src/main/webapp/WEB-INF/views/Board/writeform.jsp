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

function checkValue(){
    
	 if(!document.write.contents.value){
	       alert("내용을 입력해주세요.");
	       return false;
	    }
	
     if(!document.write.pw.value){
      	 alert("비밀번호를 입력해주세요.");
      	 return false;
    }
    

 }
 
$(document).ready(function() {

	
});
</script>
</head>
<style>
.write { width: 100%; margin-left: auto;
   margin-right: auto;
   text-align: center; }

/* 화면에 보여지는 글 목록 테이블 */
.write_table { width: 100%; }

/* 화면에 보여지는 caption */
.write_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.write_table #titles { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.write_table #td { text-align: left;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; width : 100%; }

</style>
<body>
<div class="write">
<form action="./boardwrite" method="post" name="write" onsubmit="return checkValue()">
<table class="write_table">
		<colgroup>
			<col width="15%" />
			<col width="45%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>

	<tr>
		<td id="titles">제목</td>
		<td>
		<input type="text" name="title" id="td" maxlength="80"  >
		</td>
	</tr>
	
	<tr>
		<td id="titles">내용입력</td>
		<td>
		<textarea rows="20" cols="40" name="contents" id="td"></textarea>
		</td>
		<td>
	</tr>
	
	<tr>
		<td id="titles">작성자</td>
		<td>
		<input type="text" name="id" id="td" maxlength="90" value='<%=session.getAttribute("loginID") %>' >
		</td>
		<td>
	</tr>

	
	<tr>
		<td id="titles">암호</td>
		<td>
		<input type="password" name="pw" id="td" maxlength="70" >
		</td>
	</tr>	

</table>
	
	<br>
	<div class="write">
	<input type="submit" id="edit" value="글작성">
	<input type="button" id="cancel" value="취소" onclick="location.href='./BTSMap'">
	</div>


</form>
</div>


</body>
</html>