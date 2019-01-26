package kr.co.fa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.AllimService;
import kr.co.fa.service.MessageService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Message;
import kr.co.fa.vo.User;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@Autowired
	AllimService allimService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/messageCheck")
	public String messageCheck(@RequestParam("receiveUserNo")int receiveUserNo,HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		messageService.messageCheck(receiveUserNo,user.getNo());
		return "";
	}
	@RequestMapping(value="/getMessage")
	public @ResponseBody List<Message> getMessage(@RequestParam("sendUser") int sendUserNo,
												@RequestParam("receiveUser") int receiveUserNo){
		List<Message> messages = messageService.getMessageByUserNo(sendUserNo,receiveUserNo);
		return messages;
	}
	
	@RequestMapping(value="/receivemessage.do")
	public String receivemessage(HttpSession session, Model model){
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		List<Message> receiveMessages = messageService.getReceiveMessageByUserNo(logined.getNo());
		model.addAttribute("receiveMessages", receiveMessages);
		model.addAttribute("logined", logined);
		
		return "receivemessage";
	}
}
