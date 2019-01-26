package kr.co.fa.handler;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.fa.service.MessageService;
import kr.co.fa.service.UserService;

public class FriendHandler extends TextWebSocketHandler{

	private Map<Integer, WebSocketSession> sessionMap = new HashMap<>();
	
	@Autowired
	MessageService messageService;
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String data = message.getPayload();
		System.out.println("수신 메세지:" + data);
		
		String[] items = data.split(":");
		
		String command = items[0];
		//if ("CONNECT".equals(command)) {
			/*
			String receivedUserNo = items[1];
			Integer requestUserNo = this.getUserNo(session);
			
			//수신자에게 메시지 보내기
			sessionMap.get(Integer.parseInt(receivedUserNo)).sendMessage(new TextMessage("ON_CHAT:" + requestUserNo));
			//송신자에게 메시지 보내기
			session.sendMessage(new TextMessage("ON_CHAT:" + receivedUserNo));
			*/
		//} else 
		if ("MSG".equals(command)) {
			String receivedUserNo = items[1];
			String text = (String) items[2];
			Integer sendUserNo = this.getUserNo(session);
			//수신자에게 보내기 ON_MSG:보낸사람:받는사람:메시지
			WebSocketSession recvUserSession = sessionMap.get(Integer.parseInt(receivedUserNo));
			if(recvUserSession != null) {
				sessionMap.get(Integer.parseInt(receivedUserNo)).sendMessage(new TextMessage("ON_MSG:" + sendUserNo + ":" + receivedUserNo + ":" + text));
			}
			//송신자에게 보내기 ON_MSG:받는사람:보낸사람:메시지
			messageService.addMessage(sendUserNo, Integer.parseInt(receivedUserNo), text);
		} else if ("CLOSE".equals(command)) {
			String receivedUserNo = items[1];
			Integer sendUserNo = this.getUserNo(session);
			WebSocketSession recvUserSession = sessionMap.get(Integer.parseInt(receivedUserNo));
			if (recvUserSession != null) {
				sessionMap.get(Integer.parseInt(receivedUserNo)).sendMessage(new TextMessage("OFF_CHAT:" + sendUserNo));
			}
		}
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Integer userNo = this.getUserNo(session);
		if (userNo != null) {
			sessionMap.put(userNo, session);
			broadcastOnlineUsersInfo();
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Integer userNo = this.getUserNo(session);
		sessionMap.remove(userNo);
		this.broadcastOfflineUsersInfo(userNo);
	}
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		sessionMap.remove(this.getUserNo(session));
		this.broadcastOfflineUsersInfo(this.getUserNo(session));
	}
	private void broadcastOnlineUsersInfo() {
		Collection<WebSocketSession> sessions = sessionMap.values();
		for (WebSocketSession session : sessions) {
			try {
				session.sendMessage(new TextMessage("ON_USERS:" + getEstablishedUsers()));
			} catch (IOException e) {}
		}
	}
	private void broadcastOfflineUsersInfo(Integer userEmail) {
		Collection<WebSocketSession> sessions = sessionMap.values();
		for (WebSocketSession session : sessions) {
			try {
				session.sendMessage(new TextMessage("OFF_USERS:" + userEmail));
			} catch (IOException e) {}
		}
	}
	
	private Integer getUserNo(WebSocketSession session) {
		Map<String, Object> attributes = session.getAttributes();
		return (Integer) attributes.get("LOGIN_USER_NO");
	}
	
	private String getEstablishedUsers() {
		Set<Integer> keySet = sessionMap.keySet();
		String text = StringUtils.collectionToDelimitedString(keySet, ",");
		return text;
	}
}
