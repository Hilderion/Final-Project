package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User {

	private int no;
	private String name;
	private String email;
	private String password;
	private String birth;
	private String sex;
	private String available;
	private Date createDate;
	private String address;
	private String education;
	private String profile;
	private String cover;
	private String tel;
	private String pageName;
	private int parentNo;
	private String category;
	private int friendCount;
	private User withFriend;
	private int nowday;
	private int userBirthday;
	private int pageLikeCount;
	
	public User() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getFriendCount() {
		return friendCount;
	}

	public void setFriendCount(int friendCount) {
		this.friendCount = friendCount;
	}
	
	public String getSimpleCreateDate() {
		if (createDate == null) {
			return null;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String simpleDate = format.format(createDate);
		
		return simpleDate; 
	}
	
	public String getKoreanSex() {
		
		if ("M".equals(this.sex)) {
			sex= "남자";
		} else if ("F".equals(this.sex)) {
			sex = "여자";
		}
		return sex;
	}

	public User getWithFriend() {
		return withFriend;
	}

	public void setWithFriend(User withFriend) {
		this.withFriend = withFriend;
	}

	public int getNowday() {
		return nowday;
	}

	public void setNowday(int nowday) {
		this.nowday = nowday;
	}

	public int getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(int userBirthday) {
		this.userBirthday = userBirthday;
	}

	public int getPageLikeCount() {
		return pageLikeCount;
	}

	public void setPageLikeCount(int pageLikeCount) {
		this.pageLikeCount = pageLikeCount;
	}
	
	
	
}
