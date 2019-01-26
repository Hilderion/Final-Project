package kr.co.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.MessageDao;
import kr.co.fa.vo.Message;
import kr.co.fa.vo.User;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	UserService userService;
	
	@Autowired
	MessageDao messageDao;
	
	@Override
	public void messageCheck(int sendUserNo, int receiveUserNo) {
		Message message = new Message();
		User sendUser = userService.getUserByUserNo(sendUserNo);
		User receivedUser = userService.getUserByUserNo(receiveUserNo);
		
		message.setSendUser(sendUser);
		message.setReceiveUser(receivedUser);
		messageDao.messageCheck(message);
	}
	@Override
	public int getMessageCount(int userNo) {
		return messageDao.getMessageCount(userNo);
	}
	@Override
	public List<Message> getMessageByUserNo(int sendUserNo, int receivedUserNo) {
		Message message = new Message();
		User sendUser = userService.getUserByUserNo(sendUserNo);
		User receivedUser = userService.getUserByUserNo(receivedUserNo);
		
		message.setSendUser(sendUser);
		message.setReceiveUser(receivedUser);
		return messageDao.getMessageByUserNo(message);
	}
	@Override
	public void addMessage(int sendUserNo, int receivedUserNo, String text) {
		
		Message message = new Message();
		User sendUser = userService.getUserByUserNo(sendUserNo);
		User receivedUser = userService.getUserByUserNo(receivedUserNo);
		
		message.setSendUser(sendUser);
		message.setReceiveUser(receivedUser);
		message.setContents(text);
		messageDao.addMessage(message);
	}
	
	@Override
	public List<Message> getReceiveMessageByUserNo(int receivedUserNo) {
		
		List<Message> receiveMessages = messageDao.getReceiveMessageByUserNo(receivedUserNo);
		
		return receiveMessages;
	}
}
