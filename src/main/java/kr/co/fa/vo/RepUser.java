package kr.co.fa.vo;

import java.util.Date;

public class RepUser {

	private int wrnNo;
	private Date wrnDate;
	private String acuUser;
	private String wrnStatus;
	
	public RepUser() {}

	public int getWrnNo() {
		return wrnNo;
	}

	public void setWrnNo(int wrnNo) {
		this.wrnNo = wrnNo;
	}

	public String getWrnStatus() {
		return wrnStatus;
	}

	public void setWrnStatus(String wrnStatus) {
		this.wrnStatus = wrnStatus;
	}

	public Date getWrnDate() {
		return wrnDate;
	}

	public void setWrnDate(Date wrnDate) {
		this.wrnDate = wrnDate;
	}

	public String getAcuUser() {
		return acuUser;
	}

	public void setAcuUser(String acuUser) {
		this.acuUser = acuUser;
	}
	
	
}
