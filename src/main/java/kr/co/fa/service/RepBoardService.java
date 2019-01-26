package kr.co.fa.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;

public interface RepBoardService {

	void boardWrite (RepBoard repBoard, List<MultipartFile> upfiles) throws IOException;
	void boardWrite2 (RepBoard repBoard, List<MultipartFile> upfiles) throws IOException;
	RepBoard getBoardByNo(int boardNo);
	List<RepBoard> getBoardByUserNo(int userNo);
	void subWrite (int boardNo, int userNo, String contents);	
	void subDel (int subNo);
	List<RepBoard> getBoards (RepBoardCriteria criteria, int cp);
	int getTotalRows (RepBoardCriteria criteria);
	List<RepBoard> getSubBoards (List<RepBoard> boards);
}
