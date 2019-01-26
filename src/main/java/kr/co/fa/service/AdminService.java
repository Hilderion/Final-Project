package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.Allim;
import kr.co.fa.vo.RepAdmin;
import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;

public interface AdminService {
	
	void addAdmin (RepAdmin newAdmin, RepAdmin accessAdmin);
	boolean checkDuplicateById (String id);
	RepAdmin checkLogin (String id, String pwd);
	List<RepBoard> getBoards ();
	int getRepCaseCount();
	int getUserCount();
	int getRepAdCount ();
	List<RepAdmin> getAdminList(int accessNo, RepBoardCriteria criteria);
	boolean updateAdminAjax(RepAdmin admin, int no, int level, int hiddenLevel);
}
