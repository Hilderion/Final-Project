package kr.co.fa.service;

import java.util.List;
import java.util.Map;

import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

public interface AllimService {

	int myAllimCount(int userNo);
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
	void replyOfreply(Allim allim);
	void addAllim2(Allim allim);
	int getReplyParentNo(int replyParentNo);
	Tag getTagUserByboardNo(int boardNo);
	
}
