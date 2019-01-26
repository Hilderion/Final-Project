package kr.co.fa.controller;

import java.io.IOException;
import java.text.ParseException;
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
import kr.co.fa.service.RepAdService;
import kr.co.fa.service.RepCaseService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.RepAd;
import kr.co.fa.vo.RepCase;
import kr.co.fa.vo.User;

@Controller
public class MainController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	UserService userService;
	@Autowired
	FriendService friendService;
	@Autowired
	RepCaseService repCaseService;
	@Autowired
	RepAdService adService;
	
	@RequestMapping(value="/")
	public String main(HttpSession session, Model model)throws ParseException {
		
		User user = (User) session.getAttribute("LOGIN_USER");
		if (user == null) {
			String fail = "fail";
			model.addAttribute("fail", fail);
			return "main";
		}
		User pageInfo = userService.getPageInfoByUserNo(user.getNo());
		List<User> birthInfoOfFriends = boardService.getFriendBirthInfoByUser(user.getNo());
		List<Board> boards = boardService.getUserMainBoards(user.getNo());
		RepAd ad = adService.getAcceptedAd();
		
		model.addAttribute("ad", ad);
		
		model.addAttribute("boards", boards);
		model.addAttribute("birthInfoOfFriends", birthInfoOfFriends);
		model.addAttribute("page", pageInfo);
		model.addAttribute("loginUser", user);
		return "main";
	}
	@RequestMapping(value="/profile.do")
	public String profile(Model model, HttpSession session,
							@RequestParam("userNo") int userNo) {
		User loginUser = (User) session.getAttribute("LOGIN_USER");
		List<Board> boards = boardService.getUserBoards(userNo);
		List<BoardMedia> medias = boardService.getUserMedias(userNo);
		User userinfo = userService.getUserByUserNo(userNo);
		RepCase repCase = new RepCase();
		if (loginUser != null && userinfo != null ) {
			repCase.setIhrNo(userinfo.getNo());
			repCase.setAcuNo(loginUser.getNo());
			RepCase prevCase = repCaseService.getPrevCase(repCase);
			
			if (prevCase != null) {
				model.addAttribute("prevCase", prevCase);
			}
		}
			
		
		Criteria criteria = new Criteria();
		
		if(userNo != loginUser.getNo()) {
			Friend friend = new Friend();
			criteria.setUserNo(loginUser.getNo());
			criteria.setFriendNo(userNo);
			friend = userService.friendCheck(criteria);
			model.addAttribute("friend", friend);
			
			Follow follow = new Follow();
			follow.setUser(loginUser);
			follow.setNo(userNo);
			Follow getF = friendService.getFollow(follow);
			model.addAttribute("followCheck", getF);
			
		}
		
		criteria.setUserNo(userNo);
		List<User> friendsOfUser = boardService.getFriendOfUser(criteria);
		String profile = "profile";
		
		model.addAttribute("event",profile);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("boards", boards);
		model.addAttribute("medias", medias);
		model.addAttribute("checkNo",userNo);
		model.addAttribute("user", userinfo);
		model.addAttribute("friendsOfUser", friendsOfUser);
		
		return "profile";
	}
	@RequestMapping(value="/getFriendInfo.do")
	public @ResponseBody User tagUserInfo (@RequestParam("tagNo") int tagNo ) {
		User tagFriend = userService.getUserByUserNo(tagNo);
		
		return tagFriend;
	}
	
	@RequestMapping(value="/getBoardReplyByBoardNo.do")
	public @ResponseBody List<Board> etBoardReplyByBoardNo (@RequestParam("boardNo") int boardNo) {
		
		List<Board> replys = boardService.getReplyOfBoard(boardNo);
		
		return replys;
	}
	
	@RequestMapping(value="/makePageForm.do")
	public String makePageForm() {
		
		return "users/page-hjs";
	}	
	
	@RequestMapping(value="/makePage.do")
	public String makePage (HttpSession session, @RequestParam("pageName") String pageName,
							@RequestParam("pageCategory") String pageCategory)throws IOException {
		User loginUser = (User) session.getAttribute("LOGIN_USER");
		
		String profile = "basic.jpg";
		String cover = "basiccover.jpg";
		
		User page = new User();
		page.setName(loginUser.getName());
		page.setEmail(loginUser.getEmail());
		page.setPassword(loginUser.getPassword());
		page.setBirth(loginUser.getBirth());
		page.setSex(loginUser.getSex());
		page.setAddress(loginUser.getAddress());
		page.setEducation(loginUser.getEducation());
		page.setProfile(profile);
		page.setCover(cover);
		page.setTel(loginUser.getTel());
		page.setPageName(pageName);
		page.setParentNo(loginUser.getNo());
		page.setCategory(pageCategory);
		
		userService.addPage(page);
		
		
		return "redirect:/";
	}
}
