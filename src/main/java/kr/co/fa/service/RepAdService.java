package kr.co.fa.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.vo.RepAd;

public interface RepAdService {

	void addAd (RepAd repAd, List<MultipartFile> file) throws IOException;
	List<RepAd> getAdByUserNo (int userNo);
	List<RepAd> getAllAd ();
	void repAdStart (int no);
	void repAdCancel (int no);
	void repAdAccept (int no);
	void repAdReject (int no);
	RepAd getAcceptedAd ();
	
	
	
}
