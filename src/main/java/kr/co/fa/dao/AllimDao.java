package kr.co.fa.dao;

import java.util.List;
import java.util.Map;

import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

public interface AllimDao {
	
	int myAllimCount(int userNo);
	int getSeq();
	int friendPkNo();
	int boardPkNo();
	List<Allim> myAllimView(int userNo);
	void createAllim(Allim allim);
	void agreeFriendRequest(Allim allim);
	void delFriendRequest(Allim allim);
	void delclickBoardLike(Allim allim);
	void updateAllim(Allim allim);
	Allim getAllimByAllimNo(int allimNo);
	User getFriendnameByNo(int userNo);
	Board getSubUserByUserNo(Board board);
	Board getBoardNumber(Board board);
	int getUserNoByBoardNo(int boardNo);
	List<Allim> getReplyByUserNo(int userNo);
	List<User> getFriendRequestByUserNo(int userNo);
	void addAllim(Allim allim);
	void addAllim2(Allim allim);
	int getReplyParentNo(int replyParentNo);
	Tag getTagUserByboardNo(int boardNo);

}
