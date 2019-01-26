package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.Message;

public interface MessageDao {
	
	void messageCheck (Message message);
	int getMessageCount (int userNo);
	void addMessage (Message message);
	List<Message> getMessageByUserNo (Message message);
	List<Message> getReceiveMessageByUserNo (int userNo);
}
