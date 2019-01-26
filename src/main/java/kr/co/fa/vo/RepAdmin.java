package kr.co.fa.vo;

import java.util.Date;

public class RepAdmin {

	private int no;
	private int secLevel;
	private String id;
	private String name;
	private String pwd;
	private Date createDate;
	
	public RepAdmin() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSecLevel() {
		return secLevel;
	}

	public void setSecLevel(int secLevel) {
		this.secLevel = secLevel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	
	
}
