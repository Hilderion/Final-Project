package kr.co.fa.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.dao.BoardDao;
import kr.co.fa.service.AllimService;
import kr.co.fa.service.BoardService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Like;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

@Controller
public class BoardController {
	
	public static final int ME_AND_FRIEND_AND_OTHER = 1;
	public static final int ONLY_ME = 2;
	public static final int ONLY_FRIEND = 3;

	@Value("${directory.image}")
	private String photoDirectory;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	AllimService allimService;
	
	@RequestMapping(value="/getLikeInfoByBoardNo")
	public @ResponseBody List<Like> getLikeInfoByBoardNo(@RequestParam("boardNo") int boardNo, HttpSession session) {
		List<Like> likeInfo = boardService.getLikeInfoByBoardNo(boardNo);
		return likeInfo;
	}
	@RequestMapping(value="/getReplyInfoByBoardNo")
	public @ResponseBody List<Reply> getReplyInfoByBoardNo(@RequestParam("boardNo") int boardNo, HttpSession session) {
		List<Reply> replyInfo = boardService.getReplyInfoByBoardNo(boardNo);
		return replyInfo;
	}
	@RequestMapping(value="/profileOpen.do")
	public String profileOpen(Model model, HttpSession session) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		List<Board> boards = boardService.getUserBoards(logined.getNo());
		User userinfo = userService.getUserByUserNo(logined.getNo());
		
		String Openrange = "openrange";
		
		model.addAttribute("event", Openrange);
		model.addAttribute("loginUser", logined);
		model.addAttribute("user", userinfo);
		model.addAttribute("checkNo", logined.getNo());
		model.addAttribute("boards", boards);
		
		return "profile";
	}
	

	@RequestMapping(value="/addBoard.do")
	public String addBoard(@RequestParam("openRange") String openRange,
							@RequestParam("textArea") String textArea,
							@RequestParam(value="tag-friend-info",required=false) List<Integer> tagFriendInfo,
							HttpSession session, MultipartFile boardimgfile)throws IOException {
		User logined = (User) session.getAttribute("LOGIN_USER");
		Board board = new Board();
		BoardMedia boardMedia = new BoardMedia();
		if ("onlyme".equals(openRange)) {
			board.setOpenRange("S");
		} else if ("all".equals(openRange)) {
			board.setOpenRange("A");
		} else if ("onlyfriend".equals(openRange)) {
			board.setOpenRange("F");
		}
		board.setMediaCheck("N");
		board.setUser(logined);
		board.setContents(textArea);
		
		//미디어 파일이 있을경우
		if(!boardimgfile.isEmpty()) {
			String filename = boardimgfile.getOriginalFilename();
			FileCopyUtils.copy(boardimgfile.getBytes(), new File(photoDirectory, filename));
			board.setMediaCheck("Y");
			boardMedia.setName(filename);
			boardMedia.setEvent("photo");
			boardMedia.setUser(logined);
		}
		
		boardService.addBoard(board);
		
		Allim allim = new Allim();
		
		int boardPk = allimService.boardPkNo();
		
		allim.setUser(logined);
		allim.setEvent("게시글작성");
		allim.setEventNo(boardPk);
		
		allimService.createAllim(allim);
		
		//친구 태그가 있을 경우
		if(null != tagFriendInfo) {
			/*
			Tag tag = allimService.getTagUserByboardNo(boardPk);
			User subUser = userService.getUserByUserNo(tag.getUser().getNo());
			*/
			//allim.setSubUser(subUser);
			boardService.addBoardTag(tagFriendInfo, allim);
			
		}
		//미디어 파일 있을 경우		
		if("Y".equals(board.getMediaCheck())) {
			boardService.addMedia(boardMedia);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/addProfileBoard.do")
	public String addProfileBoard(@RequestParam("openRange") String openRange,
							@RequestParam("textArea") String textArea,
							@RequestParam(value="tag-friend-info",required=false) List<Integer> tagFriendInfo,
							HttpSession session, MultipartFile boardimgfile)throws IOException {
		
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		User page = userService.getPageInfoByUserNo(logined.getNo());
		Board board = new Board();
		BoardMedia boardMedia = new BoardMedia();
		if ("onlyme".equals(openRange)) {
			board.setOpenRange("S");
		} else if ("all".equals(openRange)) {
			board.setOpenRange("A");
		} else if ("onlyfriend".equals(openRange)) {
			board.setOpenRange("F");
		}
		board.setMediaCheck("N");
		board.setUser(page);
		board.setContents(textArea);
		
		//미디어 파일이 있을경우
		if(!boardimgfile.isEmpty()) {
			String filename = boardimgfile.getOriginalFilename();
			FileCopyUtils.copy(boardimgfile.getBytes(), new File(photoDirectory, filename));
			board.setMediaCheck("Y");
			boardMedia.setName(filename);
			boardMedia.setEvent("photo");
			boardMedia.setUser(logined);
		}
		
		boardService.addBoard(board);
		
		Allim allim = new Allim();
		
		int boardPk = allimService.boardPkNo();
		
		Tag tag = allimService.getTagUserByboardNo(boardPk);
		
		allim.setUser(logined);
		allim.setEvent("게시글작성");
		allim.setEventNo(boardPk);
		allimService.createAllim(allim);
		
		
		
		
		//친구 태그가 있을 경우
		if(null != tagFriendInfo) {
			User subUser = userService.getUserByUserNo(tag.getUser().getNo());
			allim.setSubUser(subUser);

			boardService.addBoardTag(tagFriendInfo, allim);
			
			
		}
		//미디어 파일 있을 경우		
		if("Y".equals(board.getMediaCheck())) {
			boardService.addMedia(boardMedia);
		}
		
		return "redirect:pageProfile.do?userNo="+logined.getNo();
	}
	
	@RequestMapping(value="/searchFriendAndPageAndBoard.do")
	public String searchFriendAndPageAndBoard(HttpSession session, Model model, 
												@RequestParam("searchKeyword") String searchKeyword) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Criteria criteria = new Criteria();
		criteria.setUserNo(user.getNo());
		criteria.setKeyword(searchKeyword);

		List<User> searchUser = boardService.getUserInfoByKeyword(criteria);
		List<User> searchPage = boardService.getPageInfoByKeyword(criteria);
		List<Board> searchBoard = boardService.getBoardInfoByKeyword(criteria);
		
		model.addAttribute("loginUser", user);
		model.addAttribute("searchUser", searchUser);
		model.addAttribute("searchPage", searchPage);
		model.addAttribute("searchBoard", searchBoard);
		return "main-search";
	}
	

	@RequestMapping(value="/addShareBoard.do", produces={"text/plain"})
	public @ResponseBody String addShareBoard(HttpSession session ,@RequestParam("boardNo") int boardNo,
												@RequestParam("userContents") String userContents,
												@RequestParam("openRange") String openRange) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		
		boardService.shareBoard(boardNo, userContents, openRange, logined);
		
		/*Board board = new Board();
		
		if (openRange.equals("onlyme")) {
			board.setOpenRange("나만");
		} else if (openRange.equals("all")) {
			board.setOpenRange("모두");
		} else if (openRange.equals("onlyfriend")) {
			board.setOpenRange("친구만");
		}
		
		Board shareBoard = boardService.getBoardByNo(boardNo);
		
		// 게시글 유저번호만 가져오는 코드
		Board userNoByBoardNo = boardService.getBoardByNo(boardNo);
		userNoByBoardNo.getUser().getNo();
		
		User user = new User();
		user.setNo(logined.getNo());
		
		board.setUser(user);
		board.setContents(userContents);
		board.setMediaCheck("Y");
		board.setShare(shareBoard);
		
		boardService.addUserBoards(board);
		
		// 여기서부터 하재성님의 코드를 작성하시면 됩니다.
		int userNo = logined.getNo();
		Board subBoard = new Board();
		
		subBoard.setNo(boardNo);
		subBoard.setUser(logined);
		
		
		//User friend = allimService.getFriendnameByNo(subBoard.getUser().getNo());
		Board sub = allimService.getSubUserByUserNo(subBoard); // 이벤트에 해당되는 유저
		Board subNo = allimService.getBoardNumber(sub); 
		
		
		
		User subUser = userService.getUserByUserNo(subNo.getUser().getNo());
		
		Allim allim = new Allim();
		allim.setUser(logined);
		allim.setEvent("공유");
		allim.setSubUser(subUser);
		allim.setEventNo(boardNo);
		
		allimService.createAllim(allim);
		*/
		
		return "success";
	}
	
	// 프로필->친구에서 친구검색기능
	@RequestMapping(value="/searchFriend.do")
	public @ResponseBody List<User> searchFriend(HttpSession session, 
												@RequestParam("keyword") String keyword,
												@RequestParam("event") String event,
												@RequestParam("userNo") int userNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		Criteria criteria = new Criteria();
		criteria.setEvent(event);
		if ("".equals(keyword)) {
			criteria.setUserNo(userNo);
		} else {
			criteria.setUserNo(userNo);
			criteria.setKeyword(keyword);
		}
		List<User> friends = boardService.getFriendOfUser(criteria);
		return friends;
	}
	
	// 프로필에서 팔로워눌렀을때 조회
	@RequestMapping(value="/profileFollower.do")
	public @ResponseBody List<User> profileollower(HttpSession session,
													@RequestParam("userNo") int userNo
													) {
		

		Criteria criteria = new Criteria();
		criteria.setUserNo(userNo);
		
		List<User> followerOfUser = boardService.getFollowerOfUser(criteria);
		
		return followerOfUser;
	}
	
	// 프로필에서 팔로잉 목록 눌렀을때 조회
	@RequestMapping(value="/profileFollowing.do")
	public @ResponseBody List<User> profileFollowing(HttpSession session,
												@RequestParam("userNo") int userNo) {
		

		Criteria criteria = new Criteria();
		criteria.setUserNo(userNo);
		
		List<User> followingOfUser = boardService.getFollowingOfUser(criteria);
		
		return followingOfUser;
	}
	
	// 공개범위 일괄설정
	@RequestMapping(value="/updateAllOpenRange.do", produces={"text/plain"})
	public @ResponseBody String updateAllOpenRange(HttpSession session,
													@RequestParam("openRangeNumber") int openRangeNumber ) {
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		Criteria criteria = new Criteria();
		criteria.setUserNo(logined.getNo());
		
		if (openRangeNumber == ME_AND_FRIEND_AND_OTHER) {
			criteria.setOpenRange("A");
		} else if (openRangeNumber == ONLY_ME) {
			criteria.setOpenRange("S");
		} else {
			criteria.setOpenRange("F");
		}
		
		boardService.updateAllUserBoardOpenRange(criteria);
		
		return "success";
	}
	
	// 각각의 게시글마다 공개범위 설정
	@RequestMapping(value="/updateSelectedBoardOpenRange.do")
	public @ResponseBody String updateSelectedBoardOpenRange(HttpSession session,
															@RequestParam("openRangeNumber") int openRangeNumber,
															@RequestParam("boardNo") int boardNo) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		Criteria criteria = new Criteria();
		criteria.setUserNo(logined.getNo());
		criteria.setBoardNo(boardNo);
		
		if (openRangeNumber == ME_AND_FRIEND_AND_OTHER) {
			criteria.setOpenRange("A");
		} else if (openRangeNumber == ONLY_ME) {
			criteria.setOpenRange("S");
		} else {
			criteria.setOpenRange("F");
		}		
		
		boardService.updateSelectedUserBoardOpenRange(criteria);
		
		return "success";
	}
	
	// 좋아요 기능
	@RequestMapping(value="/clickLike.do")
	public @ResponseBody Board clickLike(HttpSession session,
										@RequestParam("boardNo") int boardNo,
										@RequestParam("methodName") String methodName) {
		User logined = (User) session.getAttribute("LOGIN_USER");
		Like like = new Like();
		Board board = boardService.getBoardByNo(boardNo);
		int userNo = allimService.getUserNoByBoardNo(boardNo);
		User subUser = userService.getUserByUserNo(userNo);
		
		if ("delete".equals(methodName)) {
			like.setUser(logined);
			like.setEventNo(boardNo);
			boardService.deleteLike(like);
			
			Allim allim = new Allim();
			allim.setUser(logined);
			allim.setSubUser(subUser);
			
			allimService.delclickBoardLike(allim);
			
			board.setLike(board.getLike()-1);
			boardService.updateBoardLike(board);
		}else {
			like.setUser(logined);
			like.setEvent("board");
			like.setEventNo(boardNo);
			boardService.addLike(like);
			
			Allim allim = new Allim();
			allim.setUser(logined);
			allim.setEvent("게시글좋아요");
			allim.setSubUser(subUser);
			allim.setEventNo(boardNo);
			
			if (logined.getNo() == subUser.getNo()) {
				
			} else {
				allimService.createAllim(allim);
			}
			
			
			board.setLike(board.getLike()+1);
			boardService.updateBoardLike(board);
		}
		
		board = boardService.getBoardByNo(boardNo);
		
		
		return board;
	}
	
	// 좋아요한 페이지 조회 기능
	@RequestMapping(value="/likePageOfUser.do")
	public @ResponseBody List<User> likePageOfUser(HttpSession session,
												@RequestParam("userNo") int userNo) {
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		List<User> likePages = boardService.getLikePageOfUser(userNo);
		
		return likePages;
	}
	
	@RequestMapping(value="/addReply.do")
	public @ResponseBody Reply addReply(HttpSession session,
												@RequestParam("boardNo") int boardNo,
												@RequestParam("contents") String contents) {
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		
		boardService.addReplyOfBoard(boardNo, contents, logined);
		
		Board board = boardService.getBoardByNo(boardNo);
		board.setRepCount(board.getRepCount()+1);
		boardService.updateBoardLike(board);
		
		Reply reply = boardService.getNewReply(boardNo);
		
		int boardPk = allimService.boardPkNo();
		
		Allim allim = new Allim();
		
		int no = allimService.getUserNoByBoardNo(boardNo);
		User subUser = userService.getUserByUserNo(no);
		
		
		allim.setUser(logined);
		allim.setEvent("댓글");
		allim.setSubUser(subUser);			
		allim.setEventNo(boardPk);
		
		allimService.createAllim(allim);
		
		return reply;
	}
	
	@RequestMapping(value="/getReplyOfReplyByReplyNo.do")
	public @ResponseBody List<Reply> getReplyOfReplyByReplyNo (@RequestParam("replyNo") int replyNo) {
		
		List<Reply> replys = boardService.getReplyOfReplyByReplyNo(replyNo);
		
		return replys;
	}
	
	@RequestMapping(value="/addReplyOfReply.do")
	public @ResponseBody Reply addReplyOfReply(HttpSession session,
												@RequestParam("boardNo") int boardNo,
												@RequestParam("contents") String contents,
												@RequestParam("parentReplyNo") int parentReplyNo) {
		
		User logined = (User) session.getAttribute("LOGIN_USER");
		boardService.addReplyOfReply(boardNo, contents, logined, parentReplyNo);
		
		Board board = boardService.getBoardByNo(boardNo);
		board.setRepCount(board.getRepCount()+1);
		boardService.updateBoardLike(board);
		
		Reply reply = boardService.getNewReply(boardNo);
		
		int no = allimService.getReplyParentNo(boardNo);
		User subUser = userService.getUserByUserNo(no);
		
		int pkNo = allimService.boardPkNo();
		
		Allim allim = new Allim();
		allim.setUser(logined);
		allim.setEvent("대댓글");
		allim.setSubUser(subUser);
		allim.setFriend(subUser);
		allim.setEventNo(pkNo);
		
		allimService.replyOfreply(allim);
		
		return reply;
	}
	
	@RequestMapping(value="/updateRepCount.do")
	public @ResponseBody Board updateRepCount(HttpSession session,
											@RequestParam("boardNo") int boardNo) {
		
		Board board = boardService.getBoardByNo(boardNo);
		
		return board;
	}	
}
