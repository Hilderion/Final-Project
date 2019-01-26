package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.BoardMedia;

public interface TagService {

	List<BoardMedia> tagPicture(int userNo);
	BoardMedia tagInformation(int boardNo);
}
