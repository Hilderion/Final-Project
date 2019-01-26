package kr.co.fa.service;

import java.util.List;

import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepCase;
import kr.co.fa.vo.User;

public interface RepCaseService {

	List<RepCase> getRepCases (RepBoardCriteria criteria, int cp); 
	int getTotalRows(RepBoardCriteria criteria);
	void addRepCase (RepCase repCase);
	void ajaxProcess (RepCase repCase);
	void ajaxRollBack (RepCase repCase);
	RepCase getPrevCase (RepCase repCase);
	RepCase getRepCaseByNo (int no);
}
