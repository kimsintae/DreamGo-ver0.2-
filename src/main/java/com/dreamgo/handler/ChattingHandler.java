package com.dreamgo.handler;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChattingHandler extends TextWebSocketHandler {

	private List<WebSocketSession> connectedUsers;//접속한 유저들 목록
	private Map<String, String> connectedUserList;//보여질 유저들 목록
	
	private Map<String, String> msgObj = null;//json객체
	private String type = null; //클라이언트에서 받아온 메세지의 타입(입장,퇴장,메세지)
	private String id = null; //유저 아이디
	private String text = null; //유저가 보낸 메세지
	
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
	public ChattingHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		connectedUserList = new HashMap<>();
	}
	
	//접속 관련 메서드
	//@param WebSocketSession 접속한 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId()+" 님이 참여 하셨습니다.");
		logger.info("연결된 ip : "+session.getRemoteAddress().getHostName());
		//유저가 접속했을때 유저정보를 담을 connectedUsers에 추가
		connectedUsers.add(session);
		
	}

	//1. Send : 클라이언트가 서버로 메세지를 보냄
	//2. Emit : 서버에 연결되어 있는 클라이언트들에게 메세지를 보냄
	
	//@param WebSocketSession 메세지를 보낸 클라이언트
	//@param TextMessage 메세지의 내용
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("message getPayload :"+message.getPayload());
		
			//넘어온  json String객체 받기
			String json = message.getPayload();
			msgObj =  MessageVO.convertObj(json);
			this.type=msgObj.get("type");
			this.id =msgObj.get("id");
			this.text =msgObj.get("text");
			
			this.connectedUserList.put(session.getId(),id);
			
			//list객체 json String 으로 변환
			ObjectMapper om = new ObjectMapper();
			String userList = om.writeValueAsString(connectedUserList);
		
		//접속해 있는 사람들한테 메시지 보내기
		for(WebSocketSession connetUser : connectedUsers){
			
			logger.info("현재 접속자 수 : "+connectedUsers.size());
			int totalUser = connectedUsers.size();
			logger.info(connectedUsers.toString());
			logger.info(connectedUserList.toString());
			
			/* 접속할 때마다 모든 사람들에게 현재접속자수와 접속자 아이디를 보냄 */
			connetUser.sendMessage(new TextMessage("{\"totalUser\":\""+totalUser+"\",\"userList\":"+userList+"}"));
			
			//메세지를 보낸 사용자는 자신의 메세지를 보지 못하도록 설정
			if(!session.getId().equals(connetUser.getId())){
				String sendText = null;
		
				if(type.equals("enter")||type.equals("exit")){
					logger.info("입장 or 퇴장");
					//입장하거나 퇴장할때 메세지
					sendText = text;
				}else{
					//메세지 보낼때(json)
					sendText = id+" : "+text;
				}
				
				//클라이언트로 데이터 보내기
				connetUser.sendMessage(new TextMessage("{\"type\":\""+this.type+"\",\"message\":\""+sendText+"\",\"userList\":"+userList+"}"));
			}//if
		}//for
		
		
	}//handleTextMessage
	
	//클라이언트가 서버와 연결 종료
	//@param WebSocketSeesion 연결을 끊은 클라이언트
	//@param CloseStatus 연결상태 (확인필요)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			logger.info(connectedUserList.get(session.getId())+" 님이 나가셨습니다.");
			logger.info("상태 : "+status);
			
			connectedUsers.remove(session);
			if(connectedUserList.remove(session.getId()) != null){
				System.out.println("접속목록에서 삭제됩니다.");
			}else{
				System.out.println("접속 유저에서 제거 안됨");
			};
			
			
	}
	
	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        logger.info("전송오류 : "+exception);
    }

}
