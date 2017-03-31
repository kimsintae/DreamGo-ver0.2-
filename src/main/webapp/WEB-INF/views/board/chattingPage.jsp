<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- 웹폰트 -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?v=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/list.js?v=1"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.min.js" ></script>
	
	<style type="text/css">
		#messageBody{
			height: 500px; 
			background:rgba(222,234,238,.3); 
			overflow:auto; 
			border:1px solid #424242; 
			margin-bottom:10px;
			font-family: 'Nanum Pen Script', serif;
			
		}
		
		.msg{
			font-size:27px;
		} 
		
		.me{
			text-align: right;
		}

	
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
		
			var nickname = '${loginUser.nickname}';
			/*
				send() : 서버로 데이터를 전송하는 역할
			
				서버로 데이터를 보낼때는 
				json의 형태로 보내면된다.
			*/
			
			
		cws = new SockJS('${pageContext.request.contextPath}/echo-ws');
		
		//메세지받기
		//서버로부터 넘어온데이터를 받는 역할
		cws.onmessage = function(evt) {
			//보낸 메세지들을 채팅창에 나타내주는 함수로직
			$("#messageBody").append("<div class='msg col-sm-12'>"+evt.data+"</div>");
			
			//스크롤생기면 하단으로
			$("#messageBody").scrollTop(99999);
		}
		
		//입장했을때
		cws.onopen = function() {
			
			//비회원 일경우
			if(nickname==''){
				cws.send("님이 입장했습니다.");
			}else{
				cws.send(nickname+" 님이 입장했습니다.");
			}
			
			
		}
		
		//퇴장했을때
		cws.onclose = function(){
			cws.send("유저가 퇴장하셨습니다.");
		}
		
		
		//전송버튼 클릭해서 전송
		$("#send").click(function(e){
			var message = $("#message").val();
			if(message!=''){
				
				var msg = {
				    type: "message",
				    text: message,
				    id:'${loginUser.nickname}'
				  };
				
				//json을 문자열로 변환해서 보냄
				cws.send(JSON.stringify(msg));
				$("#messageBody").append("<div class='msg me col-sm-12'><span style='color:blue;font-weight:bold;'>"+message+"</span></div>");
				
				//내용창 초기화
				$("#message").val("");
				$("#message").focus();
				$("#messageBody").scrollTop(99999);
			}
			
		})
		
		//엔터를 이용해서 전송
		$('#message').on('keydown', function(evt){
            if(evt.keyCode==13){
                var message = $(this).val();
                var msg = {
    				    type: "message",
    				    text: message,
    				    id:'${loginUser.nickname}'
    				  };
    				
    				//json을 문자열로 변환해서 보냄
    			cws.send(JSON.stringify(msg));
				$("#messageBody").append("<div class='msg me col-sm-12'><span style='color:blue;font-weight:bold;'>"+message+"</span></div>");
				
				//내용창 초기화
				$("#message").val("");
				$("#message").focus();
				$("#messageBody").scrollTop(99999);
            }
        });
		
		
		
		})//ready
		
		
	</script>

</head>

<body>
<!-- header -->
<%@include file="../include/header.jsp" %>

    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-4 sidenav">
            </div>
            <div class="col-sm-4 text-left">
				<h1>수다방</h1>
				<div id="messageBody">
					
				
				</div>
				<div>
					<input id="message" name="message" class="col-sm-9" type="text" style="height:40px;"/> 
					<button id="send" class="btn btn-info col-sm-3" type="button" style="height:40px;">전송</button>
				</div>
                <!-- 게시판 -->
            </div>
            <div class="col-sm-4 sidenav">
            </div>
        </div>
    </div>
<%@include file="../include/footer.jsp" %>
</body>

</html>