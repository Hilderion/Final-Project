package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.Message;

public interface MessageService {

	void messageCheck (int sendUserNo,int receiveUserNo);
	int getMessageCount (int userNo);
	void addMessage (int sendUserNo, int receivedUserNo, String text);
	List<Message> getMessageByUserNo (int sendUserNo, int receivedUserNo);
	List<Message> getReceiveMessageByUserNo (int receivedUserNo);
}
