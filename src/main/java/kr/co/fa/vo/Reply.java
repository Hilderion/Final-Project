package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Reply {

	private static SimpleDateFormat formatter = new SimpleDateFormat("M월 d일 a HH:mm");
	
	private int no;
	private Board board;
	private String contents;
	private Date date;
	private User user;
	private Reply parent;
	private int childCheck;
	private int sequence;
	private String available;
	private int parentNo;
	
	public Reply() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public Reply getParent() {
		return parent;
	}

	public void setParent(Reply parent) {
		this.parent = parent;
	}

	public int getChildCheck() {
		return childCheck;
	}

	public void setChildCheck(int childCheck) {
		this.childCheck = childCheck;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	
	@JsonIgnore
	public String getPassedTime() throws Exception {
		if (date == null) {
			return null;
		}
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
