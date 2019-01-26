package kr.co.fa.vo;

import java.util.Date;
import java.util.List;

public class RepBoard {

	private int no;
	private String type;
	private User user;
	private String title;
	private String content;
	private Date createDate;
	private List<RepPhoto> photos;
	private List<RepSub> subs;
	
	public RepBoard () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	
	public String getContentWithBr() {
		if (content == null) {
			return "";
		}
		String replaced = this.content;
		replaced =	replaced.replace(" ", "&nbsp;");
		replaced = replaced.replace(System.lineSeparator(), "<br />");	
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

	public List<RepPhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(List<RepPhoto> photos) {
		this.photos = photos;
	}

	public List<RepSub> getSubs() {
		return subs;
	}

	public void setSubs(List<RepSub> subs) {
		this.subs = subs;
	}

	

}
