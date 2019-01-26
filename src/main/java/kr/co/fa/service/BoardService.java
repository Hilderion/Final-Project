package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Like;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.User;


public interface BoardService {

	List<Reply> getReplyInfoByBoardNo (int boardNo);
	List<Like> getLikeInfoByBoardNo (int boardNo);
	void addMedia (BoardMedia boardMedia);
	void addBoardTag (List<Integer> tagNos, Allim allim);
	void addBoard (Board board);
	List<BoardMedia> getUserMedias (int userNo);
	List<Board> getUserMainBoards (int userNo);
	List<Board> getUserBoards (int userNo);
	void addUserBoards (Board board);
	Board getBoardByNo(int boardNo);
	List<User> getFriendOfUser (Criteria criteria);
	List<User> getFollowingOfUser (Criteria criteria);
	List<User> getFollowerOfUser (Criteria criteria);
	void updateAllUserBoardOpenRange (Criteria criteria);
	void updateSelectedUserBoardOpenRange (Criteria criteria);
	List<User> getUserInfoByKeyword (Criteria criteria);
	List<User> getPageInfoByKeyword (Criteria criteria);
	List<Board> getBoardInfoByKeyword (Criteria criteria);
	void addLike (Like like);
	void deleteLike (Like like);
	void updateBoardLike (Board board);
	BoardMedia getMediaDetailByBoardNo(int id);
	List<BoardMedia> getBoardMedia(int userNo);
	
	
	void shareBoard(int boardNo, String contents, String openRange, User loginUser);
	List<User> getLikePageOfUser (int userNo);
	
	void updateUserInfo(User user);
	List<Board> getReplyOfBoard(int boardNo);
	void addReplyOfBoard(int boardNo, String contents, User loginUser);
	void addReplyOfReply (int boardNo, String contents, User logined, int parentReplyNo);
	Reply getNewReply (int boardNo);
	List<Reply> getReplyOfReplyByReplyNo(int replyNo);
	List<User> getFriendBirthInfoByUser(int userNo);
	List<BoardMedia> getBoardMediasByBoardNo (int boardNo);
}
