package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.Board;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepCase;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.User;

public interface RepCaseDao {

	void addRepCase (RepCase repCase);
	List<RepCase> getRepCases (RepBoardCriteria criteria);
	int getTotalRows (RepBoardCriteria criteria);
	User getUserByNo (int userNo);
	Board getBoardbyNo (int no);
	Reply getReplyByNo (int no);
	void updateUserStatus (RepCase repCase);
	void updateBoardStatus (RepCase repCase);
	void updateReplyStatus (RepCase repCase);
	void updateRepCase (RepCase repCase);
	void updateRepCase2 (RepCase repCase);
	int getRepCaseCount();
	RepCase getPrevCase (RepCase repCase);
	RepCase getRepCaseByNo (int no);
	List<RepCase> getRepCasesByIhrNo (int ihrNo);
}
