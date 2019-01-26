package kr.co.fa.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.dao.RepBoardDao;
import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.RepPhoto;
import kr.co.fa.vo.RepSub;
import kr.co.fa.vo.User;

@Service
public class RepBoardServiceImpl implements RepBoardService{

	@Value("${directory.rep.image}")
	private String repImageDirectory;
	
	@Autowired
	RepBoardDao boardDao;

	@Override
	public void boardWrite(RepBoard repBoard, List<MultipartFile> upfiles) throws IOException {
		
		boardDao.addBoard(repBoard);
		int boardNo = boardDao.getBoardNowNo();
		
		RepPhoto photo = new RepPhoto();
		
		if (upfiles != null) {
			for (MultipartFile mf : upfiles) {
				
				if (!mf.getOriginalFilename().equals("")) {
					photo.setNo(boardNo);
					
					String fileName = mf.getOriginalFilename();
					fileName = System.currentTimeMillis() +"-" + fileName ;
					FileCopyUtils.copy(mf.getBytes(), new File(repImageDirectory, fileName));
					
					photo.setImage(fileName);
					boardDao.addFile(photo);
				}
				
			}
		}
		
	}
	@Override
	public void boardWrite2(RepBoard repBoard, List<MultipartFile> upfiles) throws IOException {
		
		boardDao.addBoard2(repBoard);
		int boardNo = boardDao.getBoardNowNo();
		
		RepPhoto photo = new RepPhoto();
		
		if (upfiles != null) {
			for (MultipartFile mf : upfiles) {
				
				if (!mf.getOriginalFilename().equals("")) {
					photo.setNo(boardNo);
					
					String fileName = mf.getOriginalFilename();
					fileName = System.currentTimeMillis() +"-" + fileName ;
					FileCopyUtils.copy(mf.getBytes(), new File(repImageDirectory, fileName));
					
					photo.setImage(fileName);
					boardDao.addFile(photo);
				}
				
			}
		}
		
	}

	@Override
	public List<RepBoard> getBoardByUserNo(int userNo) {
		List<RepBoard> board = boardDao.getBoardByUserNo(userNo);
		
		return board;
	}
	@Override
	public RepBoard getBoardByNo(int boardNo) {
		RepBoard board = boardDao.getBoardByNo(boardNo);
		int userNo = board.getUser().getNo();
		User user = boardDao.getUserByNo(userNo);
		board.setUser(user);
		board.setContent(board.getContentWithBr());
		
		//TODO : 파일 첨부가 된 경우 조회해주는 service 구현
		List<RepPhoto> photos = boardDao.getFiles(boardNo);
		board.setPhotos(photos);
		// 시간 표기를 24시나 오후가 제대로 표기되게 고쳐볼것
		
		List<RepSub> subs = boardDao.getSubs(boardNo);
		for (RepSub sub : subs) {
			if (sub.getRepSubShow().equals("N")) {
				sub = null;
			} else {
				sub.setUser(boardDao.getUserByNo(sub.getUser().getNo()));
			}
			
		}
		
		board.setSubs(subs);
		
		return board;
	}

	@Override
	public void subWrite(int boardNo, int userNo, String contents) {

		RepSub sub = new RepSub();
		sub.setRepBoard(boardDao.getBoardByNo(boardNo));
		sub.setUser(boardDao.getUserByNo(userNo));
		sub.setContent(contents);
		sub.setContent(sub.getContentWithReplace());
		
		boardDao.addSub(sub);
		
		
	}

	@Override
	public void subDel(int subNo) {
		boardDao.repSubDel(subNo);
		
	}
	
	@Override
	public int getTotalRows(RepBoardCriteria criteria) {
		return boardDao.getTotalRows(criteria);
	}
	

	@Override
	public List<RepBoard> getBoards(RepBoardCriteria criteria, int cp) {
		
		if ("유형".equals(criteria.getOpt())) {
			criteria.setOpt(null);
		}
		
		int totalRows = getTotalRows(criteria);
		
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp);
		
		if (pagination.getBeginIndex() <= 0 ) {
			criteria.setBeginIndex(1);
			criteria.setEndIndex(1);
		} else {
			criteria.setBeginIndex(pagination.getBeginIndex());
			criteria.setEndIndex(pagination.getEndIndex());
		}
		
		
		List<RepBoard> boards = boardDao.getBoards(criteria);
		
		for (RepBoard board : boards) {
			
			int userNo = board.getUser().getNo();
			User user = boardDao.getUserByNo(userNo);
			board.setUser(user);
		}
		
		return boards;
	}

	@Override
	public List<RepBoard> getSubBoards(List<RepBoard> boards) {
		
		for (RepBoard board : boards) {
			String title = board.getTitle();
			if (title != null && title.length() > 25) {
				title = title.substring(0, 25);
				String colons = "...";
				title += colons;
				board.setTitle(title);
			}
			
		}
		return boards;
	}
	
	
	
}
