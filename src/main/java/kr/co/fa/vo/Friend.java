package kr.co.fa.vo;

public class Friend {

	private User user;
	private int no;
	private String anoCheck;
	
	public Friend () {}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAnoCheck() {
		return anoCheck;
	}

	public void setAnoCheck(String anoCheck) {
		this.anoCheck = anoCheck;
	}

}
