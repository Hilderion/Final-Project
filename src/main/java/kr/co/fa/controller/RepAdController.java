package kr.co.fa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.fa.service.RepAdService;
import kr.co.fa.vo.RepAd;
import kr.co.fa.vo.User;

@Controller
public class RepAdController {

	@Autowired
	RepAdService adService;
	
	public User sessionGetUser(HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		return user;
	}
	
	@RequestMapping("/ad")
	public String adList(Model model, HttpSession session) {
		User user = sessionGetUser(session);
		List<RepAd> ads = adService.getAdByUserNo(user.getNo());
		
		model.addAttribute("ads",ads);
		return "admin/ad";
	}
	
	@RequestMapping(value="/adPermit", method=RequestMethod.POST)
	public String adPermit(RepAd repAd, @RequestParam("file") List<MultipartFile> file) throws IOException {
		
		adService.addAd(repAd, file);
		
		return "redirect:ad";
	}
	
	@RequestMapping("/admin/repad")
	public String repAd(Model model) {
		
		List<RepAd> ads = adService.getAllAd();
		model.addAttribute("ads",ads);
		
		return "admin/rep-ad";
	}
	
	@RequestMapping(value="admin/repad/start", method=RequestMethod.GET)
	@ResponseBody
	public String repAdStart(int no) {
		adService.repAdStart(no);
		
		return "";
	}
	
	@RequestMapping(value="admin/repad/cancel", method=RequestMethod.GET)
	@ResponseBody
	public String repAdCancel(int no) {
		adService.repAdCancel(no);
		
		return "";
	}
	
	@RequestMapping(value="admin/repad/reject", method=RequestMethod.GET)
	@ResponseBody
	public String repAdReject(int no) {
		adService.repAdReject(no);
		
		return "";
	}

	@RequestMapping(value="admin/repad/accept", method=RequestMethod.GET)
	@ResponseBody
	public String repAdReAccept(int no) {
		adService.repAdAccept(no);
		
		return "";
	}
	
}
