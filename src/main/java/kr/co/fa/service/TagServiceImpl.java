package kr.co.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.TagDao;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Tag;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	TagDao tagDao;

	@Override
	public List<BoardMedia> tagPicture(int userNo) {
		
		return tagDao.tagPicture(userNo);
	}

	@Override
	public BoardMedia tagInformation(int boardNo) {
		
		return tagDao.tagInformation(boardNo);
	}	
	
	
}
