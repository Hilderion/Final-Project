package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.RepAd;
import kr.co.fa.vo.User;

public interface RepAdDao {

	void repAdAdd (RepAd repAd);
	List<RepAd> getAdByUserNo (int userNo);
	List<RepAd> getAllAd ();
	User getUserByNo (int userNo);
	void adStartByNo (int no);
	void adCancelByNo (int no);
	void adRejectByNo (int no);
	void adAcceptByNo (int no);
	List<RepAd> getAllAdAccepted();
	int getRepAdCount();
}
