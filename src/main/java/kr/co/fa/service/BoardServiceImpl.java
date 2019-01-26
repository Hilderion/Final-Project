package kr.co.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.AllimDao;
import kr.co.fa.dao.BoardDao;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Like;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	AllimService allimService;
	
	@Autowired
	AllimDao allimDao;

	@Autowired
	UserService userService;
	
	@Override
	public List<Reply> getReplyInfoByBoardNo(int boardNo) {
		return boardDao.getReplyInfoByBoardNo(boardNo);
	}
	@Override
	public List<Like> getLikeInfoByBoardNo(int boardNo) {
		return boardDao.getLikeInfoByBoardNo(boardNo);
	}
	@Override
	public void addMedia(BoardMedia boardMedia) {
		boardDao.addMedia(boardMedia);
		
		
	}
	
	@Override
	public void addBoardTag(List<Integer> tagNos, Allim allim) {
		
		Tag tag = new Tag();
		for(Integer tagNo : tagNos) {
			User user = new User();

			user = userService.getUserByUserNo(tagNo);
			tag.setUser(user);
			tag.setEvent("user");
			tag.setContents(user.getName());
			boardDao.addTag(tag);
			
			allim.setEvent("태그");
			allim.setFriend(user);

			allimDao.addAllim2(allim);
		}
	}
	@Override
	public void addBoard(Board board) {
		boardDao.addBoard(board);
	}
	@Override
	public List<BoardMedia> getUserMedias(int userNo) {
		
		List<BoardMedia> medias = boardDao.getUserMedias(userNo);
		
		return medias;
	}
	@Override
	public List<Board> getUserMainBoards(int userNo) {
		
		List<Board> boards = boardDao.getUserMainBoards(userNo);
		
		return boards;
	}
	@Override
	public List<Board> getUserBoards(int userNo) {
		
		List<Board> boards = boardDao.getUserBoards(userNo);
		
		return boards;
	}
	
	@Override
	public void addUserBoards(Board board) {
		
		boardDao.addUserBoards(board);
	}
	
	@Override
	public Board getBoardByNo(int boardNo) {
		
		Board board = boardDao.getBoardByNo(boardNo);
		
		return board;
	}
	
	@Override
	public List<User> getFriendOfUser(Criteria criteria) {
		
		List<User> friends = boardDao.getFriendOfUser(criteria);
		
		return friends;
	}
	
	@Override
	public List<User> getFollowingOfUser(Criteria criteria) {

		List<User> followingUsers = boardDao.getFollowingOfUser(criteria);
		
		return followingUsers;
	}
	
	@Override
	public List<User> getFollowerOfUser(Criteria criteria) {

		List<User> followerUsers = boardDao.getFollowerOfUser(criteria);
		
		return followerUsers;
	}
	
	@Override
	public void updateAllUserBoardOpenRange(Criteria criteria) {
		
		boardDao.updateAllUserBoardOpenRange(criteria);
	}
	
	@Override
	public void updateSelectedUserBoardOpenRange(Criteria criteria) {
		
		boardDao.updateSelectedUserBoardOpenRange(criteria);
	}

	@Override
	public List<User> getUserInfoByKeyword(Criteria criteria) {
		
		List<User> users = boardDao.getUserInfoByKeyword(criteria);
		
		return users;
	}
	
	@Override
	public List<User> getPageInfoByKeyword(Criteria criteria) {
		
		List<User> users = boardDao.getPageInfoByKeyword(criteria);
		
		return users;
	}
	
	@Override
	public List<Board> getBoardInfoByKeyword(Criteria criteria) {
		
		List<Board> boards = boardDao.getBoardInfoByKeyword(criteria);
		
		return boards;
	}
	
	@Override
	public void shareBoard(int boardNo, String contents, String openRange, User loginUser) {
		
		Board shareBoard = boardDao.getBoardByNo(boardNo);
		User user = new User();
		user.setNo(loginUser.getNo());
		
		Board board = new Board();
		if (openRange.equals("onlyme")) {
			board.setOpenRange("나만");
		} else if (openRange.equals("all")) {
			board.setOpenRange("모두");
		} else if (openRange.equals("onlyfriend")) {
			board.setOpenRange("친구만");
		}
		board.setUser(user);
		board.setContents(contents);
		board.setMediaCheck("Y");
		board.setShare(shareBoard);
		boardDao.addUserBoards(board);	// 새글 추가

		
		Board subBoard = new Board();
		subBoard.setNo(boardNo);
		subBoard.setUser(loginUser);
		
		Board sub = allimService.getSubUserByUserNo(subBoard); // 이벤트에 해당되는 유저
		Board subNo = allimService.getBoardNumber(sub); 
		
		User subUser = userService.getUserByUserNo(subNo.getUser().getNo());
		
		Allim allim = new Allim();
		allim.setUser(loginUser);
		allim.setEvent("공유");
		allim.setSubUser(subUser);
		allim.setEventNo(board.getNo());	// 이벤트 번호는 153번에 새로 추가된 글의 글번호다.
		
		allimService.createAllim(allim);
	}
	
	@Override
	public void addLike(Like like) {
		boardDao.addLike(like);
	}
	
	@Override
	public void deleteLike(Like like) {
		boardDao.deleteLike(like);
	}
	
	@Override
	public void updateBoardLike(Board board) {
		boardDao.updateBoardLike(board);
	}
	
	@Override
	public List<User> getLikePageOfUser(int userNo) {
		List<User> likePages = boardDao.getLikePageOfUser(userNo);
		
		return likePages;
	}
	
	@Override
	public void updateUserInfo(User user) {
		boardDao.updateUserInfo(user);
	}
	
	@Override
	public List<Board> getReplyOfBoard(int boardNo) {

		List<Board> replyOfBoard = boardDao.getReplyOfBoard(boardNo);
		
		return replyOfBoard;
	}
	
	@Override
	public void addReplyOfBoard(int boardNo, String contents, User logined) {
		Reply reply = new Reply();
		Board board = new Board();
		board.setNo(boardNo);
		
		reply.setBoard(board);
		reply.setContents(contents);
		reply.setUser(logined);
		boardDao.addReplyOfBoard(reply);
	}
	
	@Override
	public void addReplyOfReply(int boardNo, String contents, User logined,  int parentReplyNo) {
		Reply reply = new Reply();
		Reply parent = new Reply();
		Board board = new Board();
		int maxSequence = boardDao.maxSequenceOfReply(parentReplyNo);
		
		board.setNo(boardNo);
		
		parent.setNo(parentReplyNo);
		
		reply.setBoard(board);
		reply.setUser(logined);
		reply.setContents(contents);
		reply.setParent(parent);
		reply.setSequence(maxSequence+1);
		
		boardDao.addReplyOfReply(reply);
	}
	
	@Override
	public Reply getNewReply(int boardNo) {

		Reply reply = boardDao.getNewReply(boardNo);
		
		return reply;
	}

	@Override
	public BoardMedia getMediaDetailByBoardNo(int id) {
		
		return boardDao.getMediaDetailByBoardNo(id);
	}

	@Override
	public List<Reply> getReplyOfReplyByReplyNo(int replyNo) {
		
		Reply parent = new Reply();
		parent.setNo(replyNo);
		
		Reply reply = new Reply();
		reply.setParent(parent);
		
		List<Reply> replys = boardDao.getReplyOfReplyByReplyNo(reply);
		
		return replys;
	}

	@Override
	public List<BoardMedia> getBoardMedia(int userNo) {
		
		return boardDao.getBoardMedia(userNo);
	}

	@Override
	public List<User> getFriendBirthInfoByUser(int userNo) {
		
		List<User> birthInfoOfFriends = boardDao.getFriendBirthInfoByUser(userNo);
		
		return birthInfoOfFriends;
	}
	
	@Override
	public List<BoardMedia> getBoardMediasByBoardNo(int boardNo) {

		List<BoardMedia> boardMedias = boardDao.getBoardMediasByBoardNo(boardNo);
		
		return boardMedias;
	}
	
}
