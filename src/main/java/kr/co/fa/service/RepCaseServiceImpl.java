package kr.co.fa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.RepCaseDao;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.RepCase;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.User;

@Service
public class RepCaseServiceImpl implements RepCaseService{
	
	@Value("${directory.modal.image}")
	private String photoDirectory;
	
	@Autowired
	RepCaseDao repCaseDao;
	
	@Override
	public int getTotalRows(RepBoardCriteria criteria) {

		return repCaseDao.getTotalRows(criteria);
		
	}

	@Override
	public List<RepCase> getRepCases(RepBoardCriteria criteria, int cp) {
		
		if ("유형".equals(criteria.getOpt())) {
			criteria.setOpt(null);
		}
		if ("활동가능".equals(criteria.getStatus())) {
			criteria.setStatus(null);
		}
		
		int totalRows = getTotalRows(criteria);
		
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp);
		
		if (pagination.getBeginIndex() <= 0) {
			pagination.setBeginIndex(1);
			pagination.setEndIndex(1);
		} else {
			criteria.setBeginIndex(pagination.getBeginIndex());
			criteria.setEndIndex(pagination.getEndIndex());
		}
		
		List<RepCase> repcases = repCaseDao.getRepCases(criteria);
		
		for (RepCase repCase : repcases) {
			
			User acuUser = repCaseDao.getUserByNo(repCase.getAcuNo()); 
			List<User> users = new ArrayList<>();
			users.add(acuUser);
			
			repCase.setAcuUser(users);
		}
		
		return repcases;
	}

	@Override
	public void addRepCase(RepCase repCase) {
		
		String type = repCase.getType();
		
		if (type.equals("user") || type.equals("page")) {
			User user = repCaseDao.getUserByNo(repCase.getIhrNo());
			repCase.setStatus(user.getAvailable());
			repCase.setContents(user.getName());
		} else if (type.equals("board")) {
			Board board = repCaseDao.getBoardbyNo(repCase.getIhrNo());
			
			String contents = board.getContents();
			
			if (contents != null &&contents.length() > 25) {
				contents = contents.substring(0, 25);
				String colons = "...";
				contents = contents + colons;
			}
			repCase.setStatus(board.getAvailable());
			repCase.setContents(contents);
		} else if (type.equals("sub")) {
			Reply reply = repCaseDao.getReplyByNo(repCase.getIhrNo());
			repCase.setStatus(reply.getAvailable());
			repCase.setContents(reply.getContents());
		}
		
		RepCase prevCase = getPrevCase(repCase);
		
		if (prevCase == null) {
			
			repCaseDao.addRepCase(repCase);
			
		} 
		
	}

	@Override
	public void ajaxProcess(RepCase repCase) {
		
		String type = repCase.getType();
		repCase.setStatus("N");
		
		if ("user".equals(type) || "page".equals(type)) {
			repCaseDao.updateUserStatus(repCase);
		} else if (type.equals("board")) {
			repCaseDao.updateBoardStatus(repCase);
		} else if (type.equals("sub")) {
			repCaseDao.updateReplyStatus(repCase);
		}
		
		repCaseDao.updateRepCase(repCase);
		repCaseDao.updateRepCase2(repCase);
		
	}

	@Override
	public void ajaxRollBack(RepCase repCase) {
		
		String type = repCase.getType();
		repCase.setStatus("Y");
		
		if (type.equals("user") || type.equals("page")) {
			repCaseDao.updateUserStatus(repCase);
		} else if (type.equals("board")) {
			repCaseDao.updateBoardStatus(repCase);
		} else if (type.equals("sub")) {
			repCaseDao.updateReplyStatus(repCase);
		}
		
		repCaseDao.updateRepCase(repCase);
		repCaseDao.updateRepCase2(repCase);
	}

	@Override
	public RepCase getPrevCase(RepCase repCase) {
		
		return repCaseDao.getPrevCase(repCase);
	}
	
	

	@Override
	public RepCase getRepCaseByNo(int no) {
		
		RepCase repCase = repCaseDao.getRepCaseByNo(no);
		
		int ihrNo = repCase.getIhrNo();
		User indvUser = repCaseDao.getUserByNo(ihrNo);
		indvUser.setProfile(photoDirectory + indvUser.getProfile());
		repCase.setIndvUser(indvUser);
		
		List<RepCase> repCases = repCaseDao.getRepCasesByIhrNo(ihrNo);
		
		List<User> users = new ArrayList<>();

		for (RepCase indvCase : repCases) {
			int acuUserNo = indvCase.getAcuNo();
			User acuUser = repCaseDao.getUserByNo(acuUserNo);
			users.add(acuUser);
			indvCase.setAcUser(acuUser);
		}
		
		repCase.setAcuUser(users);
		repCase.setManyCases(repCases);
		
		return repCase;
	}
	
}
