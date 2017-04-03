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
    <link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?v=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/list.js?v=1"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.min.js" ></script>
	
	<style type="text/css">
		#messageBody{
			height:500px;
			background:rgba(222,234,238,.3); 
			overflow:auto; 
			border:1px solid #424242; 
			margin-bottom:10px;
			font-family: ‘Jeju Hallasan’;
			padding: 10px;
		}
		
		.msgBox,.meBox{
			margin: 5px 0 5px 0;
			font-size:22px;
		}
		
		.msg,.me{
			background: #deeaee;
			display: inline-block;
			border-radius: 5px;
			padding: 9px;
		} 
		
		#totalUNT{
			text-align: right;
		}
		
		* {
		    box-sizing: border-box;
		}
		
		.col-container {
		    display: table;
		    width: 100%;
		}
		.col {
		    display: table-cell;
		    padding: 16px;
		}
		
		@media only screen and (max-width: 600px) {
		    .col { 
		        display: block;
		        width: 100%;
		    }
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
			
			//넘어온 json을 객체로 변환(분리해서 가져오기 위함)
			var data = JSON.parse(evt.data);
			
			//현재 접속자 수
			var currentUserCnt = data.totalUser;
			var message = data.message;
			
			
			$(".cnt").text(currentUserCnt);
			$("#messageBody").append("<div class='col-sm-12 msgBox'>\
									<div class='msg'>\
									"+message+"\
									</div>\
									</div>");
			
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
		
		//json 객체 생성
		var msg ={
				type:"",
				text:"",
				id:""
				};
		
		 var message;
		
		//전송버튼 클릭해서 전송
		$("#send").click(function(e){
			message = $("#message").val();
			if(message!=''){
				
				msg['type']="message";
				msg['text']=message;
				msg['id']='${loginUser.nickname}';

				//json을 문자열로 변환해서 보냄
				sendMessage(message,msg);
			}
			
		});
		
		//엔터를 이용해서 전송
		$('#message').on('keydown', function(evt){
            message = $(this).val();
            if(evt.keyCode==13){
                
                msg['type']="message";
				msg['text']=message;
				msg['id']='${loginUser.nickname}';
    				
    			//json을 문자열로 변환해서 보냄

    			sendMessage(message,msg);
            }
        });
		
		//주요메서드
		function sendMessage(message,msg){
			
			//json을 String 문자열로 서버로 보냄
			cws.send(JSON.stringify(msg));
			//내가보낸 메세지
			$("#messageBody").append("\
					<div class='col-sm-12 msgBox meBox row' style='text-align: right;'>\
						<span class='me' style='background:#96ceb4;'>\
						"+message+"\
						</span>\
					</div>");
			//내용창 초기화
			$("#message").val("");
			$("#message").focus();
			$("#messageBody").scrollTop(99999);
		}
		
		})//ready
		
		
	</script>

</head>

<body>
<!-- header -->
<%@include file="../include/header.jsp" %>

    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-3 sidenav">
            </div>
            <div class="col-sm-6 text-left">
            	<div class="row">
					<h1 class="col">수다방</h1>
					<diV class="col" id="totalUNT">
						현재 접속자 수 : <span class="cnt"></span>
					</div>
				</div>
				<div id="messageBody">
				</div>
				<div>
					<input type="text" id="message" class="col-sm-9" style="height:40px;"/> 
					<button id="send" class="btn btn-info col-sm-3" type="button" style="height:40px;">전송</button>
				</div>
                <!-- 게시판 -->
            </div>
            <div class="col-sm-3 sidenav">
            </div>
        </div>
    </div>
<%@include file="../include/footer.jsp" %>
</body>

</html>