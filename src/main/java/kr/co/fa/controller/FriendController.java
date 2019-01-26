package kr.co.fa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.dao.FriendDao;
import kr.co.fa.service.AllimService;
import kr.co.fa.service.FriendService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.FriendEvent;
import kr.co.fa.vo.User;


@Controller
public class FriendController {

	@Autowired
	FriendService friendService;
	@Autowired
	UserService userService;
	@Autowired
	AllimService allimService;
	
	@Autowired
	FriendDao dao;
	
	public User sessionGetUser(HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		return user;
	}
	
	@RequestMapping(value="/findFriend.do")
	public String findFriend(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("LOGIN_USER");
		List<FriendEvent> events = friendService.getFriendRequest(user.getNo());
		
		List<Map<String,Object>> friends = friendService.getAdvFriendsByUserNo(user.getNo());

		model.addAttribute("recommands", friends);
		model.addAttribute("events" , events);
		return "find-friend";
	}
	
	@RequestMapping(value="/excFriend")
	@ResponseBody
	public String exfFriend(HttpSession session, int excNo) {
		
		User user = sessionGetUser(session);
		friendService.addExcFriend(user, excNo);
		
		return "success";
	}
	
	@RequestMapping(value="/addFriend.do")
	public @ResponseBody String addFriend (@RequestParam("addFriendNum") int addFriendNum, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		User friend = userService.getUserByUserNo(addFriendNum);
		FriendEvent friendEvent = new FriendEvent();
		friendEvent.setUser(friend);
		friendEvent.setFriend(user);
		friendEvent.setEvent("add");
		friendService.cancelAddFriendEvent(friendEvent);
		
		Friend addFriend  = new Friend();
		addFriend.setUser(user);
		addFriend.setNo(addFriendNum);
		friendService.addFriend(addFriend);
		
		Follow follow = new Follow();
		follow.setUser(user);
		follow.setNo(addFriendNum);
		friendService.addFollow(follow);		
		
		return "";
	}
	
	@RequestMapping(value="/addFriendEvent.do", produces= {"text/plain"})
	public @ResponseBody String addFriendEvent (@RequestParam("friResult") String friResult,
												@RequestParam("friendNo")int friendNo, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		User friend = userService.getUserByUserNo(friendNo);
		
		FriendEvent friendEvent = new FriendEvent();
		friendEvent.setUser(user);
		friendEvent.setFriend(friend);
		friendEvent.setEvent("add");
		
		Follow follow = new Follow();
		follow.setUser(user);
		follow.setNo(friendNo);
		
		String result = "add";
		if (" 친구 추가".equals(friResult)) {
			friendService.addFriendEvent(friendEvent);
			friendService.addFollow(follow);
			
			int no = allimService.friendPkNo();
			
			Allim allim = new Allim();
			allim.setUser(user);
			allim.setEvent("친구요청");
			allim.setSubUser(friend);
			allim.setEventNo(no);
			
			allimService.agreeFriendRequest(allim);
			
		} else {
			friendService.cancelAddFriendEvent(friendEvent);
			friendService.delFollow(follow);
			
			Allim allim = new Allim();
			allim.setUser(user);
			allim.setSubUser(friend);
			
			allimService.delFriendRequest(allim);
			
			result = "del";
		}
		return result;
	}
	
	@RequestMapping(value="/delFriend.do", produces= {"text/plain"})
	public @ResponseBody String delFriend (@RequestParam("friendNo") int friendNo,
			HttpSession session) {
		
		User user = (User) session.getAttribute("LOGIN_USER");
		Friend friend = new Friend();
		friend.setUser(user);
		friend.setNo(friendNo);
		
		Follow follow = new Follow();
		follow.setNo(friendNo);
		follow.setUser(user);
		
		friendService.delFriend(friend);
		friendService.delFriendFollow(follow);
		return "";
	}
	@RequestMapping(value="chatFriendInfo.do")
	public @ResponseBody User chatFriendInfo (@RequestParam("chatFriendNo") int chatFriendNo) {
		User Friend = userService.getUserByUserNo(chatFriendNo);
		return Friend;
	}
	
	@RequestMapping(value="/friendRequest")
	public @ResponseBody List<FriendEvent> friendRequest (@RequestParam("event") String friResult,
															HttpSession session) {
		System.out.println(friResult);
		User user = (User) session.getAttribute("LOGIN_USER");
		List<FriendEvent> requests = new ArrayList<>();
		if("수신".equals(friResult)) {
			requests = friendService.getFriendRequest(user.getNo());
		} else {
			requests = friendService.getFriendApply(user.getNo());
		}
		
		return requests;
	}
}
