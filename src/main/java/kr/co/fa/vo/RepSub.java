package kr.co.fa.vo;

import java.util.Date;

public class RepSub {

	private int no;
	private RepBoard repBoard;
	private User user;
	private String content;
	private Date createDate;
	private String repSubShow;
	
	public RepSub() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}



	public RepBoard getRepBoard() {
		return repBoard;
	}

	public void setRepBoard(RepBoard repBoard) {
		this.repBoard = repBoard;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}
	
	public String getContentWithReplace() {
		if (content == null) {
			return "";
		}
		
		String replaced = this.content;
		replaced = replaced.replace(" ", "&nbsp;");
		replaced = replaced.replace(System.lineSeparator(), "<br/>");
		return replaced;
		
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRepSubShow() {
		return repSubShow;
	}

	public void setRepSubShow(String repSubShow) {
		this.repSubShow = repSubShow;
	}
	
	
	
}
