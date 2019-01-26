package kr.co.fa.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RepAd {

	private int no;
	private int userNo;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rcvDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private String show;
	private String permit;
	private String photo;
	private String adReject;
	private User adUser;
	
	public RepAd() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getRcvDate() {
		return rcvDate;
	}
	public void setRcvDate(Date rcvDate) {
		this.rcvDate = rcvDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getAdReject() {
		return adReject;
	}

	public void setAdReject(String adReject) {
		this.adReject = adReject;
	}

	public User getAdUser() {
		return adUser;
	}

	public void setAdUser(User adUser) {
		this.adUser = adUser;
	}
	
	
	
	
	
}
