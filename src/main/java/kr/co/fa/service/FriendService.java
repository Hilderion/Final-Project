package kr.co.fa.service;

import java.util.List;
import java.util.Map;

import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.FriendEvent;
import kr.co.fa.vo.User;

public interface FriendService {

	int getFriendRequestCount (int userNo);
	List<User> getFriendsByUserNo (int no);
	List<FriendEvent> getFriendApply (int no);
	List<FriendEvent> getFriendRequest (int no);
	void cancelAddFriendEvent (FriendEvent friendEvent);
	void addFriendEvent (FriendEvent friendEvent);
	void addFriend (Friend friend);
	void delFriend (Friend friend);
	void updateFriend (Friend friend);
	void addFollow (Follow follow);
	void delFriendFollow (Follow follow);
	void delFollow (Follow follow);
	Follow getFollow (Follow follow);
	List<Map<String,Object>> getAdvFriendsByUserNo(int no);
	void addExcFriend (User user, int excNo);
	
}
