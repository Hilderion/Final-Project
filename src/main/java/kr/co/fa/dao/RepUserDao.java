package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.User;

public interface RepUserDao {

	int getTotalRows (RepBoardCriteria criteria);
	List<User> getUserList (RepBoardCriteria criteria);
	User getUserByNo (int no);
}
