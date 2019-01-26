package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Allim {

	private static SimpleDateFormat formatter = new SimpleDateFormat("M월 d일 a HH:mm");
	
	private int no;
	private User user;
	private String event;
	private Date date;
	private String check;
	private User subUser;
	private User friend;
	private int eventNo;
	
	public Allim() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public User getSubUser() {
		return subUser;
	}

	public void setSubUser(User subUser) {
		this.subUser = subUser;
	}

	public User getFriend() {
		return friend;
	}

	public void setFriend(User friend) {
		this.friend = friend;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getPassedTime() throws Exception {
		Date currentDate = new Date();
		long createTime = date.getTime();
		long currentTime = currentDate.getTime();
		long minute = (currentTime - createTime)/(1000*60);
		
		if (minute < 1) {
			return "방금 전";
		} else if (minute < 60) {
			return minute + "분 전";
		} else if (minute < 60 * 24) {
			return minute/60 + "시간 전";
		} else {
			return formatter.format(date);
		}
	}
}
