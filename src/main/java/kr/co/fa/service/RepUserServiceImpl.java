package kr.co.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.fa.dao.RepCaseDao;
import kr.co.fa.dao.RepUserDao;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.RepCase;
import kr.co.fa.vo.User;

@Service
public class RepUserServiceImpl implements RepUserService {

	@Value("${directory.modal.image}")
	private String photoDirectory;
	
	@Autowired
	RepUserDao userDao;
	
	@Autowired
	RepCaseDao caseDao;
	
	@Override
	public int getTotalRows(RepBoardCriteria criteria) {

		return userDao.getTotalRows(criteria);
	}

	@Override
	public List<User> getUserList(RepBoardCriteria criteria, int cp) {
		
		if("성별".equals(criteria.getOpt())) {
			criteria.setOpt(null);
		}
		if("정지여부".equals(criteria.getStatus())) {
			criteria.setStatus(null);
		}
		
		int totalRows = getTotalRows(criteria);
		
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp, 20);
		
		if (pagination.getBeginIndex() <= 0 ) {
			criteria.setBeginIndex(1);
			criteria.setEndIndex(1);
		} else {
			criteria.setBeginIndex(pagination.getBeginIndex());
			criteria.setEndIndex(pagination.getEndIndex());
		}
		
		List<User> users = userDao.getUserList(criteria);
		
		return users;
	}

	@Override
	public User getUserByNo(int no) {
		User user = userDao.getUserByNo(no);
		
		user.setProfile(photoDirectory + user.getProfile());
		
		return user;
	}

	@Override
	public String updateUser(int no, String access) {
		RepCase repCase = new RepCase();
		repCase.setIhrNo(no);
		
		if ("active".equals(access)) {
			repCase.setStatus("Y");
			caseDao.updateUserStatus(repCase);
			
			return "active";
		} else {
			repCase.setStatus("N");
			caseDao.updateUserStatus(repCase);
			
			return "deactive";
		}
	}

	
	
	
}
