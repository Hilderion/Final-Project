package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.BoardMedia;

public interface TagDao {

	List<BoardMedia> tagPicture(int userNo);
	BoardMedia tagInformation(int boardNo);
}
