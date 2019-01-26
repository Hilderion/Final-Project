package kr.co.fa.service;

import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.User;

public interface UserService {

	Friend friendCheck(Criteria criteria);
	void addUser(User user);
	User getUserByEmail(String usermail);
	void updateUser(User user);
	User getUserByUserNo(int userNo);
	User getPageInfoByUserNo(int userNo);
	void addPage(User page);
}
