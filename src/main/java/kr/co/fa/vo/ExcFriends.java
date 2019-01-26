package kr.co.fa.vo;

import java.util.List;

public class ExcFriends {
	
	private int originUserNo;
	private List<User> recFreinds;
	private List<ExcFriends> excFriends;
	private User excFriend;
	
	public int getOriginUserNo() {
		return originUserNo;
	}
	public void setOriginUserNo(int originUserNo) {
		this.originUserNo = originUserNo;
	}
	public List<User> getRecFreinds() {
		return recFreinds;
	}
	public void setRecFreinds(List<User> recFreinds) {
		this.recFreinds = recFreinds;
	}
	public List<ExcFriends> getExcFriends() {
		return excFriends;
	}
	public void setExcFriends(List<ExcFriends> excFriends) {
		this.excFriends = excFriends;
	}
	public User getExcFriend() {
		return excFriend;
	}
	public void setExcFriend(User excFriend) {
		this.excFriend = excFriend;
	}
	
	
	
	
	
	
}
