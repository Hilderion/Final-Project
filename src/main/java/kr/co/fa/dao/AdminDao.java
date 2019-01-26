package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.RepAdmin;
import kr.co.fa.vo.RepBoardCriteria;

public interface AdminDao {
	
	void addAdmin (RepAdmin repAdmin);
	RepAdmin getAdminById (String adminId);
	int getUserCount();
	List<RepAdmin> getAdminList(RepBoardCriteria criteria);
	void updateAdmin(RepAdmin repAdmin);
	RepAdmin getAdminByNo (int no);
}
