package kr.co.fa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.AllimDao;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

@Service
public class AllimServiceImpl implements AllimService {

	@Autowired
	AllimDao allimDao;

	@Override
	public int myAllimCount(int userNo) {
		return allimDao.myAllimCount(userNo);
	}
	@Override
	public List<Allim> myAllimView(int userNo) {
		
		return allimDao.myAllimView(userNo);
	}

	@Override
	public void createAllim(Allim allim) {
		
		allimDao.createAllim(allim);
	}

	@Override
	public User getFriendnameByNo(int userNo) {
		
		return allimDao.getFriendnameByNo(userNo);
	}

	@Override
	public Board getSubUserByUserNo(Board board) {
		
		return allimDao.getSubUserByUserNo(board);
	}

	@Override
	public Board getBoardNumber(Board board) {
		
		return allimDao.getBoardNumber(board);
	}

	@Override
	public List<Allim> getReplyByUserNo(int userNo) {
		
		return allimDao.getReplyByUserNo(userNo);
	}

	@Override
	public List<User> getFriendRequestByUserNo(int userNo) {
		
		return allimDao.getFriendRequestByUserNo(userNo);
	}
	
	@Override
	public void agreeFriendRequest(Allim allim) {
		
		allimDao.agreeFriendRequest(allim);
		
	}
	
	@Override
	public void delFriendRequest(Allim allim) {
		
		allimDao.delFriendRequest(allim);
		
	}
	
	@Override
	public int getUserNoByBoardNo(int boardNo) {
		
		return allimDao.getUserNoByBoardNo(boardNo);
	}
	
	

	@Override
	public void delclickBoardLike(Allim allim) {
		
		allimDao.delclickBoardLike(allim);
		
	}
	
	@Override
	public Allim getAllimByAllimNo(int allimNo) {
		
		return allimDao.getAllimByAllimNo(allimNo);
	}
	
	

	@Override
	public void updateAllim(Allim allim) {
		
		allimDao.updateAllim(allim);
	}

	@Override
	public int friendPkNo() {
		
		return allimDao.friendPkNo();
	}

	@Override
	public int boardPkNo() {
		
		return allimDao.boardPkNo();
	}
	
	@Override
	public void replyOfreply(Allim allim) {
		
		allimDao.addAllim(allim);
		
	}
	@Override
	public int getReplyParentNo(int replyParentNo) {
		
		return allimDao.getReplyParentNo(replyParentNo);
	}
	@Override
	public Tag getTagUserByboardNo(int boardNo) {
		
		return allimDao.getTagUserByboardNo(boardNo);
	}
	@Override
	public void addAllim2(Allim allim) {
		
		allimDao.addAllim2(allim);
		
	}
	
	
}
