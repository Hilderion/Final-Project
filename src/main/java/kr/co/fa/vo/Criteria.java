package kr.co.fa.vo;

public class Criteria {

	private int userNo;
	private int friendNo;
	private int boardNo;
	private int replyParentNo;
	private String follow;
	private String anoCheck;
	private String keyword;
	private String openRange;
	private String event;
	
	public Criteria() {}

	
	public String getEvent() {
		return event;
	}


	public void setEvent(String event) {
		this.event = event;
	}


	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public String getAnoCheck() {
		return anoCheck;
	}

	public void setAnoCheck(String anoCheck) {
		this.anoCheck = anoCheck;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOpenRange() {
		return openRange;
	}

	public void setOpenRange(String openRange) {
		this.openRange = openRange;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getReplyParentNo() {
		return replyParentNo;
	}


	public void setReplyParentNo(int replyParentNo) {
		this.replyParentNo = replyParentNo;
	}
	
	
}
