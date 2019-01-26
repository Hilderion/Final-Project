package kr.co.fa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.UserDao;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public Friend friendCheck(Criteria criteria) {
		
		Friend friend = userDao.friendCheck(criteria);
		
		return friend;
	}
	@Override
	public void addUser(User user) {
		
		userDao.addUser(user);
	}

	@Override
	public User getUserByEmail(String usermail) {
		
		return userDao.getUserByEmail(usermail);
	}

	@Override
	public void updateUser(User user) {
		
		userDao.updateUser(user);
	}

	@Override
	public User getUserByUserNo(int userNo) {
		
		return userDao.getUserByUserNo(userNo);
	}
	@Override
	public User getPageInfoByUserNo(int userNo) {
		User pageInfo = userDao.getPageInfoByUserNo(userNo);
		return pageInfo;
	}
	@Override
	public void addPage(User page) {
		userDao.addPage(page);
	}
}
