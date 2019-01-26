package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class RepCase {

	private int no;
	private String type;
	private int ihrNo;
	private String contents;
	private String status;
	private Date rcvDate;
	private int acuNo;
	private List<User> acuUser;
	private User acUser;
	private User indvUser;
	private List<RepCase> manyCases;
	
	public RepCase() {}

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

	public int getIhrNo() {
		return ihrNo;
	}

	public void setIhrNo(int ihrNo) {
		this.ihrNo = ihrNo;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRcvDate() {
		return rcvDate;
	}

	public void setRcvDate(Date rcvDate) {
		this.rcvDate = rcvDate;
	}

	public int getAcuNo() {
		return acuNo;
	}

	public void setAcuNo(int acuNo) {
		this.acuNo = acuNo;
	}

	public List<User> getAcuUser() {
		return acuUser;
	}

	public void setAcuUser(List<User> acuUser) {
		this.acuUser = acuUser;
	}

	public User getIndvUser() {
		return indvUser;
	}

	public void setIndvUser(User indvUser) {
		this.indvUser = indvUser;
	}

	public List<RepCase> getManyCases() {
		return manyCases;
	}

	public void setManyCases(List<RepCase> manyCases) {
		this.manyCases = manyCases;
	}

	public User getAcUser() {
		return acUser;
	}

	public void setAcUser(User acUser) {
		this.acUser = acUser;
	}
	
	public String getSimpleRcvDate () {
		if (rcvDate == null) {
			return null;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String simpleDate = format.format(rcvDate);
		
		return simpleDate; 
	}
	
	
	
}
