package kr.co.fa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.FriendDao;
import kr.co.fa.vo.ExcFriends;
import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.FriendEvent;
import kr.co.fa.vo.User;

@Service
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	FriendDao friendDao;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AllimService allimService;
	
	@Override
	public int getFriendRequestCount(int userNo) {
		return friendDao.getFriendRequestCount(userNo);
	}
	@Override
	public List<User> getFriendsByUserNo(int no) {
		List<User> users = friendDao.getFriendsByUserNo(no);
		return users;
	}
	@Override
	public List<FriendEvent> getFriendApply(int no) {
		List<FriendEvent> events = friendDao.getFriendApply(no);
		return events;
	}
	@Override
	public List<FriendEvent> getFriendRequest(int no) {
		List<FriendEvent> events = friendDao.getFriendRequest(no);
		return events;
	}
	@Override
	public void cancelAddFriendEvent (FriendEvent friendEvent) {
		friendDao.cancelAddFriendEvent(friendEvent);
		
	}
	@Override
	public void addFriendEvent(FriendEvent friendEvent) {
		friendDao.addFriendEvent(friendEvent);
		
	}
	@Override
	public void addFriend(Friend friend) {
		friendDao.addFriend(friend);
	}
	@Override
	public void delFriend(Friend friend) {
		friendDao.delFriend(friend);
		
	}
	@Override
	public void updateFriend(Friend friend) {
		friendDao.updateFriend(friend);
	}

	@Override
	public void addFollow(Follow follow) {
		friendDao.addFollow(follow);
		
	}

	@Override
	public void delFriendFollow(Follow follow) {
		friendDao.delFriendFollow(follow);
	}
	@Override
	public void delFollow(Follow follow) {
		friendDao.delFollow(follow);
		
	}

	@Override
	public Follow getFollow(Follow follow) {
		Follow getF = friendDao.getFollow(follow);
		return getF;
	}
	
	@Override
	public List<Map<String,Object>> getAdvFriendsByUserNo(int no) {
		List<Map<String,Object>> friends = friendDao.getRecFriendsByUserNo(no);
		
		int len = friends.size();
		
		Random random = new Random();
		
		
		return friends;
	}
	
	@Override
	public void addExcFriend(User user, int excNo) {
		
		ExcFriends excF = new ExcFriends();
		excF.setOriginUserNo(user.getNo());
		User excFriend =  friendDao.getUserByNo(excNo);
		excF.setExcFriend(excFriend);
		
		friendDao.addExcFriend(excF);
		
	}
	
}
