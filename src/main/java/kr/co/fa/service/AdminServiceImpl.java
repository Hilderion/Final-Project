package kr.co.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.AdminDao;
import kr.co.fa.dao.RepAdDao;
import kr.co.fa.dao.RepBoardDao;
import kr.co.fa.dao.RepCaseDao;
import kr.co.fa.vo.RepAdmin;
import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.User;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	@Autowired
	RepBoardDao boardDao;
	
	@Autowired
	RepCaseDao caseDao;
	
	@Autowired
	RepAdDao adDao;
	
	@Override
	public void addAdmin(RepAdmin newAdmin, RepAdmin accessAdmin) {
		if (newAdmin.getSecLevel() >= 3) {
			System.out.println("권한 부정 조작 발견. 해당 관리자의 생성을 취소합니다.");
			killHackAccess(accessAdmin);
		} else {
			adminDao.addAdmin(newAdmin);
		}
		
	}

	@Override
	public RepAdmin checkLogin(String id, String pwd) {
		
		RepAdmin admin = adminDao.getAdminById(id);
		
		if(admin == null) {
			return null;
		} 
		
		if (!admin.getPwd().equals(pwd)) {
			return null;
		}
		
		return admin;
	}

	@Override
	public boolean checkDuplicateById(String id) {
		if (adminDao.getAdminById(id) != null) {
			return false;
		}
		
		return true;
	}

	@Override
	public List<RepBoard> getBoards() {
		
		RepBoardCriteria criteria = new RepBoardCriteria();
		
		criteria.setBeginIndex(1);
		criteria.setEndIndex(3);
		List<RepBoard> boards = boardDao.getBoards(criteria);
		
		for (RepBoard board : boards) {
			String title = board.getTitle();
			if (title.length() > 30) {
				title = title.substring(0, 30);
				String colons = "...";
				title += colons;
				board.setTitle(title);
			}
			
			int userNo = board.getUser().getNo();
			User user = boardDao.getUserByNo(userNo);
			board.setUser(user);
		}
		
		return boards;
	}

	@Override
	public int getRepCaseCount() {
		
		return caseDao.getRepCaseCount();
	}

	@Override
	public int getUserCount() {
		
		return adminDao.getUserCount();
	}

	@Override
	public List<RepAdmin> getAdminList(int accessNo, RepBoardCriteria criteria) {
		
		if ("보안레벨".equals(criteria.getOpt())) {
			criteria.setOpt(null);
		}
		
		List<RepAdmin> admins = adminDao.getAdminList(criteria);
		
		for (RepAdmin admin : admins) {
			if (admin.getNo() == accessNo) {
				admins.remove(admin);
				break;
			}
		}
		
		return admins;
	}

	@Override
	public boolean updateAdminAjax(RepAdmin admin, int no, int level, int hiddenLevel) {
		RepAdmin updateAdmin = adminDao.getAdminByNo(no);
		
		if (admin.getSecLevel() != hiddenLevel) {
			killHackAccess(admin);
			
			return false;
		}
		
		updateAdmin.setNo(no);
		updateAdmin.setSecLevel(level);
		
		adminDao.updateAdmin(updateAdmin);
		
		return true;
	}
	
	public void killHackAccess(RepAdmin admin) {
		System.out.println("부정 침입 발견");
		System.out.println("부정 침입자의 권한을 말소합니다.");
		admin.setSecLevel(0);
		adminDao.updateAdmin(admin);
	}
	
	@Override
	public int getRepAdCount() {
		return adDao.getRepAdCount();
	}

	
}
