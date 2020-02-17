<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

<!DOCTYPE html"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {

	$('#boardcss_list_add_button_table').on('click',function(){
		location.href="./boardwrite";
	});
	
	$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingForm.submit();
		
	});
	
	
});
</script>
</head>

<style type="text/css">

#boardcss_list_add_button_table .add_button { cursor: pointer; border: 1px solid #bebebe; position: absolute; right: 10px; top: 10px; width: 85px; padding: 6px 0 6px; text-align: center; font-weight: bold; }
#boardcss_list_add_button_table .add_button a { color: #ffffff; }
 #write {text-align: right; float: right; }
 
 
/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#boardcss_list_add_button_table .boardcss_list_add_button { width: 100%; overflow: hidden; height: 10px;}

/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table { width: 100%; }

/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; }

/* 화면에 보여지는 caption */
.list_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.list_table thead th { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table tbody td { text-align: center;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; }

#pagingDiv {margin: auto; vertical-align: middle;}
</style>

<body>
<div class = "container">
	<div class"col-xs-12" style="margin:15px auto;">
<label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>공지사항</label>
<!-- <input type="button" style="float:right;" value="메인화면" class="btn btn-primary btn-sm" onclick="location.href='./BTSMap'"> -->

<c:if test="${sessionScope.id eq 'system' }">
<input type="button" style="float:right;" class="btn btn-primary btn-sm" value="글쓰기" onclick="location.href='./noticewrite'" id="notice">
</c:if>
</div>


<div class="boardcss_list_table">

<table class="list_table">
		<colgroup>
			<col width="15%" />
			<col width="45%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일자</th>
	</tr>
</thead>

<c:forEach items="${boardlist}" var="list">
<tbody>
<tr>
<td>${list.seq }</td>
<td><a href="./noticedetail?seq=${list.seq}"> ${list.title }</a></td>
<td>${list.writer }</td>
<td>${list.time }</td>
</tr>
</tbody>
</c:forEach>
</table>
</div>
</div>


<div id="pagingDiv" style="display: block; text-align: center;" >
			<c:if test="${paging.prev}">
				<a href="${paging.startPage - 1 }">이전</a>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage }">
				&nbsp;<a href="${num }">${num }</a>&nbsp;
			</c:forEach>
			<c:if test="${paging.next}">
				<a id="next" href="${paging.endPage + 1 }">다음</a>
			</c:if>
	</div>
	
	<form id="pagingFrm" name="pagingForm" action="boardlist" method="get">
		<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
		<input type="hidden" id="amount" name="amount" value="${paging.cri.amount }">
	</form>
</body>
</html>

</layoutTag:layout>