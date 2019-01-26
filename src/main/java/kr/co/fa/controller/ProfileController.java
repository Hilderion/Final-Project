package kr.co.fa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.BoardService;
import kr.co.fa.service.FriendService;
import kr.co.fa.service.TagService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.User;

@Controller
public class ProfileController {


	@Autowired
	UserService userService;

	@Autowired
	BoardService boardService;

	@Autowired
	FriendService friendService;
	
	@Autowired
	TagService tagService;
	
	@RequestMapping(value="/profileInfo.do")
	public String profileInfo(Model model, HttpSession session, 
								@RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		User userinfo = userService.getUserByUserNo(userNo);
		
		model.addAttribute("event", "Info");
		model.addAttribute("loginUser", logined);
		model.addAttribute("user", userinfo);
		model.addAttribute("checkNo", logined.getNo());
		
		return "profile";
	}
	@RequestMapping(value="/profileFriend.do")
	public String profileFriend(Model model, HttpSession session,
								@RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		User userinfo = userService.getUserByUserNo(userNo);
		
		String friend = "friend";
		Criteria criteria = new Criteria();
		criteria.setUserNo(userNo);
		
		List<User> friends = boardService.getFriendOfUser(criteria);
		
		model.addAttribute("event", friend);
		model.addAttribute("friends", friends);
		model.addAttribute("loginUser", logined);
		model.addAttribute("user", userinfo);
		model.addAttribute("checkNo", logined.getNo());
		
		return "profile";
	}
	@RequestMapping(value="/profilePicture.do")
	public String profilePicture(Model model, HttpSession session, @RequestParam("userNo") int userNo) {
		User userPicture = userService.getUserByUserNo(userNo);
		User logined = (User) session.getAttribute("LOGIN_USER");
		User userinfo = userService.getUserByUserNo(userNo);
		
		String picture = "picture";
		model.addAttribute("event", picture);
		model.addAttribute("user", userPicture);
		model.addAttribute("loginUser", logined);
		model.addAttribute("user", userinfo);
		model.addAttribute("checkNo", logined.getNo());
		
		List<BoardMedia> boardInfo = boardService.getBoardMedia(userNo);
		List<BoardMedia> tags = tagService.tagPicture(userNo);
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("tags", tags);
		
		
		return "profile";
	}
	
	@RequestMapping(value="/pageProfile.do")
	public String pageProfile(Model model, HttpSession session, @RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		User userinfo = userService.getUserByUserNo(logined.getNo());
		User pageInfo = userService.getPageInfoByUserNo(logined.getNo());
		List<Board> pageBoards = boardService.getUserBoards(pageInfo.getNo());
		
		model.addAttribute("loginUser", logined);
		model.addAttribute("user", userinfo);
		model.addAttribute("page", pageInfo);
		model.addAttribute("pageBoards", pageBoards);
		model.addAttribute("checkNo", logined.getNo());
		
		return "profile-page";
	}
	
		
	
	@RequestMapping(value="/addInformation")
	public @ResponseBody BoardMedia addInformation(@RequestParam ("id") int id) {
		
		BoardMedia boardmedia = boardService.getMediaDetailByBoardNo(id);
		
		return boardmedia;
	}
	
	
	
	@RequestMapping(value="/updateAllim.do")
	public @ResponseBody Friend allim(@RequestParam("friendNo") int friendNo,
			@RequestParam("allim") String allim, HttpSession session)
			throws Exception {

		String anoCheck = "N";
		if ("N".equals(allim)) {
			anoCheck = "Y";
		}
		
		Friend friend = new Friend();
		User user = (User) session.getAttribute("LOGIN_USER");
		friend.setUser(user);
		friend.setNo(friendNo);
		friend.setAnoCheck(anoCheck);
		
		friendService.updateFriend(friend);
		return friend;
	}
	@RequestMapping(value="/updateFollow.do", produces={"text/plain"})
	public @ResponseBody String follow(@RequestParam("follow") String follow, 
			@RequestParam("friendNo") int friendNo,
			HttpSession session)
			throws Exception {
		
		Follow followd = new Follow();
		User user = (User) session.getAttribute("LOGIN_USER");
		followd.setUser(user);
		followd.setNo(friendNo);
		
		String result = "add";
		if ("팔로우".equals(follow)) {
			friendService.addFollow(followd);
		} else {
			friendService.delFollow(followd);
			result = "del";
		}
		return result;
	}
	
	// 유저 정보 저장하는기능인데 userService에 옮겨야함
	@RequestMapping(value="/profileInfoModify.do")
	public @ResponseBody User profileInfoModify(HttpSession session,
							@RequestParam("modifyInputContents") String modifyInputContents,
							@RequestParam("keyword") String keyword,
							@RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		User nowUser = userService.getUserByUserNo(userNo);
		if ("education".equals(keyword)) {
			nowUser.setEducation(modifyInputContents);
			nowUser.setAddress(nowUser.getAddress());
			nowUser.setTel(nowUser.getTel());
		} else if ("address".equals(keyword)) {
			nowUser.setEducation(nowUser.getEducation());
			nowUser.setAddress(modifyInputContents);
			nowUser.setTel(nowUser.getTel());
		} else {
			nowUser.setEducation(nowUser.getEducation());
			nowUser.setAddress(nowUser.getAddress());
			nowUser.setTel(modifyInputContents);
		} 
		nowUser.setNo(userNo);
		
		boardService.updateUserInfo(nowUser);
		
		User newUser = userService.getUserByUserNo(userNo);
		
		return newUser;
	}
	
	//프로필-> 생일눌렀을때 생일 7일이내의 친구들 있으면 조회
	@RequestMapping(value="/getFriendsBirthdayOfUser.do")
	public @ResponseBody List<User> getFriendsBirthdayOfUser(HttpSession session,
							@RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		
		List<User> birthInfoOfFriends = boardService.getFriendBirthInfoByUser(userNo);
		
		return birthInfoOfFriends;
	}
	
	
	
}
