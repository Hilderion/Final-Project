package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.User;

public interface RepUserService {
	
	int getTotalRows (RepBoardCriteria criteria);
	List<User> getUserList (RepBoardCriteria criteria, int cp);
	User getUserByNo (int no);
	String updateUser (int no, String access);
	
}
