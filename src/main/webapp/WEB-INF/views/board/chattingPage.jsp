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
			font-size:15px;
		}
		
		.msg,.me{
			background: #deeaee;
			display: inline-block;
			border-radius: 5px;
			padding: 9px;
		} 
		
		#totalUNT{
			text-align: right;
			font-size:15px;
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
		
		.currentUserList{
			list-style: none;
			text-align: center;
			
			
		}
		.currentUserList li{
			font-size: 20px;
		}
	
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			 
			/*
				send() : 서버로 데이터를 전송하는 역할
			
				서버로 데이터를 보낼때는 
				json의 형태로 보내면된다.
			*/
			
			var nickname = '${loginUser.nickname}';
			
			//서버로 보낼 데이터를 가지고 있는 json 객체 생성
			var msg ={
					type:"",
					text:"",
					id:""
					};
			
			 var message;

			
			
		cws = new SockJS('${pageContext.request.contextPath}/echo-ws');
		
		//메세지받기
		//서버로부터 넘어온데이터를 받는 역할
		cws.onmessage = function(evt) {
			
			$(".currentUserList").empty();
			//넘어온 json을 객체로 변환(분리해서 가져오기 위함)
			var data = JSON.parse(evt.data);
			
			//현재 접속자 수
			var currentUserCnt = data.totalUser;
			
			//메세지 타입
			var type = data.type;
			
			var userList = data.userList;
			
			//유저들이 보내는 메세지
			var message = data.message;
			
			//접속자 수
			$(".cnt").text(currentUserCnt);
			
			//접속중인 유저 목록 뿌리기
			for(user in userList){
				$(".currentUserList").append("<li>"+userList[user]+"</li>");
			}	
			
			switch (type) {
			case "message":
				//받은 메세지 뿌리기
				$("#messageBody").append("<div class='col-sm-12 msgBox'>\
										<div class='msg'>\
										"+message+"\
										</div>\
										</div>");
				break;
			
			case "enter":
				//받은 메세지 뿌리기
				$("#messageBody").append("<div class='col-sm-12 msgBox'>\
										<div class='msg col-sm-12 text-center'>\
										"+message+"\
										</div>\
										</div>");
				break;
				
			case "exit":
				//받은 메세지 뿌리기
				$("#messageBody").append("<div class='col-sm-12 msgBox'>\
										<div class='msg col-sm-12 text-center'>\
										"+message+"\
										</div>\
										</div>");
				break;
			}

			
			//스크롤생기면 하단으로
			$("#messageBody").scrollTop(99999);
			
		}//onmessage
		

		
		// **************** 입장 / 퇴장  관련 *****************//
		
		//입장했을때
		cws.onopen = function() {
			msg['type']="enter";
			msg['text']="<span style='color:blue;font-weight:bold;'>"+nickname+" 님이 입장했습니다.</span>";
			msg['id']='${loginUser.nickname}';

			//json을 문자열로 변환해서 보냄
			sendMessage(message,msg);
		}
		
		//퇴장했을때
	 	cws.onclose = function() {
			alert("접속종료");
			msg['type']="exit";
			msg['text']="<span style='color:blue;font-weight:bold;'>"+nickname+" 님이 퇴장하셨습니다.</span>";
			
			//json을 문자열로 변환해서 보냄
			sendMessage(message,msg);
		} 
		
		
		// **************** 메세지 전송 관련 *****************//

		
		//전송버튼 클릭해서 전송
		$("#send").click(function(e){
			message = $("#message").val();
			if(message!=''){
				
				msg['type']="message";
				msg['text']=message;

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
    				
    			//json을 문자열로 변환해서 보냄
    			sendMessage(message,msg);
            }
        });
		
		//주요메서드
		function sendMessage(message,msg){
			
			//json을 String 문자열로 서버로 보냄
			cws.send(JSON.stringify(msg));
			
			if(msg['type']=='message'){
			//내가보낸 메세지
		 	$("#messageBody").append("\
					<div class='col-sm-12 msgBox meBox row' style='text-align: right;'>\
						<span class='me' style='background:#96ceb4;'>\
						"+message+"\
						</span>\
					</div>");
			}
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
					<h1 class="col">채팅방</h1>
					<diV class="col" id="totalUNT">
						현재 접속자 수 : <span class="cnt" style="color:blue;font-weight:bold;"></span> 명
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
            <h3 class="col-sm-12">대화 하고 계신 분들</h3>
            	<ul class="currentUserList">
            	</ul>
            </div>
        </div>
    </div>
<%@include file="../include/footer.jsp" %>
</body>

</html>