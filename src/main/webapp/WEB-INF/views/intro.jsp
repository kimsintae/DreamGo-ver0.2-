<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DreamGo</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<style>
	/* Full-width input fields */
	input[type=email], input[type=password] {
	    width: 100%;
	    padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	/* Set a style for all buttons */
	button {
	    background-color: #4CAF50;
	    color: white;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    cursor: pointer;
	    width: 100%;
	}
	
	button:hover {
	    opacity: 0.8;
	}
	
	/* Center the image and position the close button */
	.imgcontainer {
	    text-align: center;
	    margin: 24px 0 12px 0;
	    position: relative;
	}
	
	img.avatar {
	    width: 40%;
	    border-radius: 10%;
	}
	
	.container {
	    padding: 16px;
	}
	
	span.psw {
	    float: right;
	    padding-top: 16px;
	}
	
	/* The intro (background) */
	.intro {
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background: none;
	   

	}
	
	/* intro Content/Box */
	.intro_content {
	    background-color: #fefefe;
	    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
	    border: 1px solid #888;
	    width: 40%; /* Could be more or less, depending on screen size */
	    box-shadow: 10px 10px 5px #888888;
	}
	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	    span.psw {
	       display: block;
	       float: none;
	    }
	    .cancelbtn {
	       width: 100%;
	    }
	}
	.enter{
		font-size: 20px;
		color: black;
		font-weight: bold;
		text-decoration: none;
	}
	.enter:hover{
		color:blue;
	}
	#welcome{
		text-align: center;
	}
	#welcome span{
		font-size: 25px;
		color: #b1cbbb;
		font-weight: bold;
	}
	</style>
</head>

<body>
<div id="id01" class="intro">
  <form class="intro_content animate" action="${pageContext.request.contextPath}/login">
    <div class="imgcontainer">
      <img src="${pageContext.request.contextPath}/resources/img/lion.gif" style="width:40%;height:45%;" alt="" class="avatar">
    </div>

    <div class="container">
   
   <c:choose>
   		<c:when test="${loginUser==null}">
   		
	      <label><b>이메일</b></label>
	      <input type="email" placeholder="이메일을 입력해주세요" name="email" required>
	
	      <label><b>비밀번호</b></label>
	      <input type="password" placeholder="비밀번호를 입력해주세요" name="password" required>
	        
	      <button type="submit">Login</button>
	      <input type="checkbox" checked="checked"> Remember me
	      
   		</c:when>
   		<c:otherwise>
   		
  		  <div id="welcome"><span>${loginUser.nickname}</span> 님 반갑습니다.</div>
	        
   		</c:otherwise>
   </c:choose>

   	
   	
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <a href="${pageContext.request.contextPath}/info/job_info" class="enter"></a>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
  
</div>
<script type="text/javascript">
	var user = '${loginUser}';
	var profile = '${loginUser.profile}';
	if(user==''){
		$(".enter").text("비회원으로 입장");
	}else{
		$(".enter").text("입장");
		$("img").attr("src",'${pageContext.request.contextPath}/resources/upload/'+profile)
		$("img").attr("alt",profile)
		
	}
</script>
</body>

</html>