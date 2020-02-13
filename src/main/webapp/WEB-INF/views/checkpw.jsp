<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>check pw</title>
    <link rel="stylesheet" href="./resources/login_screen.css">

</head>
<script type="text/javascript">
window.onload= function(){
    
    var back = document.getElementById("backbtn");
    var id  = document.getElementById("id1");
    var name = document.getElementById("name");
    
    
    
    //back
    back.onclick = function(){
    	
    	location.href="./login";
    }
    
    
    console.log(id + name);
    
}
</script>

<body>

    <div id="bg" alt="배경"></div>
    <article class="container">
        <div class="content">
            <article class="half">
                <h1>비밀번호 찾기</h1>
                <br>
                <div class="check_pw">
                    <form action="./checkpw" method="post">
                        <input type="text" name="id" id="id1" placeholder="Your Id" class="inpt"><br>
                       
                        <input type="text" name="name" id="name" placeholder="Your Name" class="inpt"><br>
                        <p id="wrong_name">${result}</p> 
                        <div class="submit-wrap">
                            <input type="submit" value="check pw" class="submit">
                            <Br>
                            <input type="button" value="cancel" class="submit" id="backbtn">
                        </div>
                        <input type="hidden" name="password" value="${password}">
                    </form>
                </div>

            </article>
        </div>
    </article>
</body>

</html>