package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepPhoto;
import kr.co.fa.vo.RepSub;
import kr.co.fa.vo.User;

public interface RepBoardDao {

	void addBoard (RepBoard repBoard);
	void addBoard2 (RepBoard repBoard);
	void addFile (RepPhoto repPhoto);
	int getBoardNowNo ();
	List<RepBoard> getBoards (RepBoardCriteria criteria);
	User getUserByNo (int userNo);
	RepBoard getBoardByNo (int boardNo);
	List<RepBoard> getBoardByUserNo (int userNo);
	List<RepPhoto> getFiles (int boardNo);
	List<RepSub> getSubs(int boardNo);
	void addSub (RepSub repSub);
	void repSubDel (int subNo);
	int getTotalRows (RepBoardCriteria criteria);
	
}
