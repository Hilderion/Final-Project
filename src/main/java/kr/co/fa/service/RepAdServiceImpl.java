package kr.co.fa.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.dao.RepAdDao;
import kr.co.fa.vo.RepAd;
import kr.co.fa.vo.User;

@Service
public class RepAdServiceImpl implements RepAdService {

	@Value("${directory.rep.Ad}")
	private String repAdDirectory;

	@Autowired
	RepAdDao adDao;

	@Override
	public void addAd(RepAd repAd, List<MultipartFile> file) throws IOException {

		if (file != null) {

			for (MultipartFile mf : file) {

				if (!mf.getOriginalFilename().equals("")) {

					String fileName = mf.getOriginalFilename();
					fileName = System.currentTimeMillis() + "-" + fileName;
					FileCopyUtils.copy(mf.getBytes(), new File(repAdDirectory, fileName));

					repAd.setPhoto(fileName);
					adDao.repAdAdd(repAd);
				}

			}

		}

	}

	@Override
	public List<RepAd> getAdByUserNo(int userNo) {
		List<RepAd> ads = adDao.getAdByUserNo(userNo);

		return ads;
	}

	@Override
	public List<RepAd> getAllAd() {
		
		List<RepAd> ads =adDao.getAllAd();
		
		for(RepAd ad : ads) {
			User user = adDao.getUserByNo(ad.getUserNo());
			ad.setAdUser(user);
		}
		
		return ads;
	}

	@Override
	public void repAdStart(int no) {
		adDao.adStartByNo(no);
	}

	@Override
	public void repAdCancel(int no) {
		adDao.adCancelByNo(no);
	}

	@Override
	public void repAdAccept(int no) {
		adDao.adAcceptByNo(no);
	}

	@Override
	public void repAdReject(int no) {
		adDao.adRejectByNo(no);
	}

	@Override
	public RepAd getAcceptedAd() {
		
		List<RepAd> ads = adDao.getAllAdAccepted();
		
		if (ads == null) {
			return null;
		}
		
		Random rnd = new Random();
		int rn = rnd.nextInt(ads.size());
		
		RepAd ad = ads.get(rn);
		
		return ad;
	}

	

	
}
