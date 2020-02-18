<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 탭</title>
<style>
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}

table a:visited {
	color: #999999;
	font-weight: bold;
	text-decoration: none;
}

table a:active, table a:hover {
	color: #bd5a35;
	text-decoration: underline;
}

table {
	width: 1000px;
	font-family: Arial, Helvetica, sans-serif;
	color: #666;
	font-size: 12px;
	text-shadow: 1px 1px 0px #fff;
	background: #eaebec;
	margin: 20px;
	border: #ccc 1px solid;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}

table th {
	padding: 10px 10px 10px 10px;
	border-top: 1px solid #fafafa;
	border-bottom: 1px solid #e0e0e0;
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed),
		to(#ebebeb));
	background: -moz-linear-gradient(top, #ededed, #ebebeb);
}

table th:first-child {
	text-align: left;
	padding-left: 20px;
}

table tr:first-child th:first-child {
	-moz-border-radius-topleft: 3px;
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
}

table tr:first-child th:last-child {
	-moz-border-radius-topright: 3px;
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
}

table tr {
	text-align: center;
	padding-left: 15px;
}

table td:first-child {
	text-align: left;
	padding-left: 15px;
	border-left: 0;
}

table td {
	padding: 10px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),
		to(#fafafa));
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}

table td.second {
	text-align: right;
	padding: 18px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),
		to(#fafafa));
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}

table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8),
		to(#f6f6f6));
	background: -moz-linear-gradient(top, #f8f8f8, #f6f6f6);
}

table tr:last-child td {
	border-bottom: 0;
}

table tr:last-child td:first-child {
	-moz-border-radius-bottomleft: 3px;
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

table tr:last-child td:last-child {
	-moz-border-radius-bottomright: 3px;
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

table tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2),
		to(#f0f0f0));
	background: -moz-linear-gradient(top, #f2f2f2, #f0f0f0);
}

.member_log{

	width:400px;
	padding: 18px;
	height: 150px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function () {

	$("#backbtn").click(function(){
	
		location.href = "./BTSMap";
	});
	
	
	$(".checkBtn").click(function(){

	var str = ""
	var tdArr = new Array(); // 배열 선언
	var btn = "";
	var checkBtn = $(this);
	
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			console.log("클릭한 Row의 모든 데이터 : "+tr.text());

			var id = td.eq(0).text();
			var pw = td.eq(1).text();
			var name = td.eq(2).text();
			var email = td.eq(3).text();
			var phone = td.eq(4).text();
			var indate = td.eq(5).text();

			// 반복문을 이용해서 배열에 값을 담아 사용
			td.each(function(i){
			tdArr.push(td.eq(i).text());
			});

			console.log("배열에 담긴 값 : "+tdArr);

			str += " * 회원정보 * <br> "+
			" 아이디 : <font color='red' name='id'>" + id + "</font><br>" +
			" 비밀번호 : <font color='red'>" + pw + "</font><br>" +
			" 이름 : <font color='red'>" + name + "</font><br>" +
			" 이메일 : <font color='red'>" + email + "</font><br>"+ 
			" 가입일 : <font color='red'>" + indate + "</font><br>";

			btn += "<input type = 'button' value = '메인화면' id='backbtn'>"+ "&nbsp;" +
			"<input type='button' value='회원강퇴' class='kick'>";


			$("#result").html(str + "<br>" + btn);

			$('.kick').click(function(){

			var con = confirm('강퇴하시겠습니까?');

			if(con){
			location.href = "./kickMember?id="+id;
			} else {
			location.href = "./manageMember";
			}



			});
			
			$("#backbtn").click(function(){
				
				location.href = "./BTSMap";
			});
		
			
			});
	
			});
	
</script>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<th>ID</th>
				<th hidden="hidden">Password</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>가입일</th>
				<th>회원조회</th>
				
			</tr>
			<c:forEach items="${list}" var="mem">
				<tr>
					<td >${mem.id}</td>
					<td hidden="hidden">${mem.pw}</td>
					<td>${mem.name}</td>
					<td>${mem.email}</td>
					<td>${mem.phone}</td>
					<td>${mem.indate}</td>
				
					<td><input type=button  class="checkBtn" value='조회'></td>
				</tr>

			</c:forEach>
		</table>
	
	<div class="member_log" id="result" > &nbsp; <input type = "button" value = "메인화면" id="backbtn"></div> 	
	
	</div>
</body>
</html>