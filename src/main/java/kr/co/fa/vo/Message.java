package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

	private static SimpleDateFormat formatter = new SimpleDateFormat("M월 d일");
	
	private int no;
	private User sendUser;
	private User receiveUser;
	private String contents;
	private Date createDate;
	private String check;
	private int receiveNotCheckCount;
	
	public Message() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	public User getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(User receiveUser) {
		this.receiveUser = receiveUser;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public int getReceiveNotCheckCount() {
		return receiveNotCheckCount;
	}

	public void setReceiveNotCheckCount(int receiveNotCheckCount) {
		this.receiveNotCheckCount = receiveNotCheckCount;
	}

	
	public String getPassedTime() throws Exception {
		Date currentDate = new Date();
		long createTime = createDate.getTime();
		long currentTime = currentDate.getTime();
		long minute = (currentTime - createTime)/(1000*60);
		
		if (minute < 1) {
			return "방금 전";
		} else if (minute < 60) {
			return minute + "분 전";
		} else if (minute < 60 * 24) {
			return minute/60 + "시간 전";
		} else {
			return formatter.format(createDate);
		}
	}
}
