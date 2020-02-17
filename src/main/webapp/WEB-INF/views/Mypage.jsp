<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY PAGE</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   function checkValue(){
	 
	      if(!document.edit.pw.value){
	         alert("비밀번호를 입력해주세요.");
	         return false;
	      }
	      
	      if(!document.edit.phone.value){
		         alert("핸드폰번호를 입력해주세요.");
		         return false;
		      }

	   }
   
    id = '${sessionScope.id}';
   if (id.includes("kakao_") ||id.includes("naver_")) {	
	   alert("카카오회원, 네이버회원은 회원정보를 수정할 수 없습니다.");
	   location.href = "./BTSMap";
   }
   
</script>



</head>
<body>




<div class="container">
    <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>회원정보 수정</label>
    </div>
    
    <div class="col-xs-12">
        <form action="./Mypage" method="post" name=edit onsubmit="return checkValue()">
        
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="id" readonly="readonly" value='${sessionScope.id}'>
          </div>
          
          <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" >
          </div>
          
           <div class="form-group">
            <label for="id">이름</label>
            <input type="text" class="form-control" id="name" name="name" readonly="readonly" value='${sessionScope.name}'>
          </div>
       
       <div class="form-group">
            <label for="cellphone">핸드폰번호</label>
            <input type="text" class="form-control" id="phone" name="phone" >
          </div>
                
               
<button type="submit" id="updatebtn" class="btn btn-primary btn-sm" style="float:right;">수정</button>
<button type="submit" class="btn btn-primary btn-sm" style="float:right;" onclick="location.href='./BTSMap'">취소</button>
                
    	
       
    </form>    
</div>
</div>        
</body>
</html>
</layoutTag:layout>