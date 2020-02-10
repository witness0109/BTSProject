<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   function checkValue(){
	 
	      if(!document.edit.pw.value){
	         alert("비밀번호를 입력해주세요.");
	         return false;
	      }
	      
	      if(!document.edit.phone.value){
		         alert("폰번호를 입력해주세요.");
		         return false;
		      }

	   }
</script>
</head>
<body>


<div class="wrap">        
      <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        </div>
        <form action="./Mypage" method="post" name=edit onsubmit="return checkValue()">
        
        <table border="1" width="400px">
                <tr>
                    <td id="title" >아이디</td>
                    <td>
                        <input type="text" name="id" id="id" maxlength="50" readonly="readonly" value='<%=session.getAttribute("loginID")%>'>
                     </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="pw" maxlength="50"   >
                    </td>
                </tr>
                
                 <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50" value='<%=session.getAttribute("name")%>'>
                    </td>
                </tr>
                
                 <tr>
                    <td id="title">핸드폰번호</td>
                    <td>
                        <input type="text" name="phone" maxlength="50" >
                    </td>
                </tr>
                
                <tr>
                	<td colspan="2" align="center">
                	<input type="submit" width="60pt" value="수정" id="updatebtn">
                	</td>
                </tr>	
        </table>
    </form>    
        
</body>
</html>