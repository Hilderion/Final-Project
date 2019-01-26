package kr.co.fa.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Board {
	
	private static SimpleDateFormat formatter = new SimpleDateFormat("M월 d일 a HH:mm");

	private int no;
	private User user;
	private String contents;
	private Date createDate;
	private String mediaCheck;
	private String openRange;
	private String available;
	private int like;
	private Board share;
	private int repCount;
	private List<BoardMedia> boardMedias;
	// 게시글, 댓글, 페이지번호중 하나 담을 용도
	private Like event;
	private Tag tag;
	private List<Tag> tags;
	private BoardMedia boardMedia;
	private Reply reply;
	
	public Board() {}
	
	public List<BoardMedia> getBoardMedias() {
		return boardMedias;
	}

	public void setBoardMedias(List<BoardMedia> boardMedias) {
		this.boardMedias = boardMedias;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getMediaCheck() {
		return mediaCheck;
	}

	public void setMediaCheck(String mediaCheck) {
		this.mediaCheck = mediaCheck;
	}

	public String getOpenRange() {
		return openRange;
	}

	public void setOpenRange(String openRange) {
		this.openRange = openRange;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Board getShare() {
		return share;
	}

	public void setShare(Board share) {
		this.share = share;
	}

	public int getRepCount() {
		return repCount;
	}

	public void setRepCount(int repCount) {
		this.repCount = repCount;
	}


	public static SimpleDateFormat getFormatter() {
		return formatter;
	}

	public static void setFormatter(SimpleDateFormat formatter) {
		Board.formatter = formatter;
	}

	public Like getEvent() {
		return event;
	}

	public void setEvent(Like event) {
		this.event = event;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public BoardMedia getBoardMedia() {
		return boardMedia;
	}

	public void setBoardMedia(BoardMedia boardMedia) {
		this.boardMedia = boardMedia;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getPassedTime() throws Exception {
		if (createDate == null) {
			return null;
		}
		Date currentDate = new Date();
		long createTime = createDate.getTime();
		long currentTime = currentDate.getTime();
		long minute = (currentTime - createTime)/(1000*60);
		
		if (minute < 1) {
			return "방금 전";
		} else if (minute < 60) {
			return minute + "분 전";
		} else if (minute < 60 * 24) {
			return minute/60 + "시간 전";
		} else {
			return formatter.format(createDate);
		}
	}
}
