package kr.co.fa.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.AllimService;
import kr.co.fa.service.BoardService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.User;

@Controller
public class AllimController {

	@Autowired
	AllimService allimService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value="/friendAllimCheck")
	public String friendAllimCheck(@RequestParam ("allimNo") int allimNo,  
								   @RequestParam ("confirm") String confirm) {
		
		Allim allim = allimService.getAllimByAllimNo(allimNo);
		allim.setCheck(confirm);
		
		allimService.updateAllim(allim);
		
		return "redirect:findFriend.do";
		
	}
	
	@RequestMapping(value="/allim")
	public String myAllimView(Model model, HttpSession session) {
				
		User logined = (User) session.getAttribute("LOGIN_USER");
		List<Allim> allims = allimService.myAllimView(logined.getNo());
		
		model.addAttribute("allims", allims);
		model.addAttribute("logined", logined);
		
		return "allim";
	}
	
	@RequestMapping(value="/view")
	public @ResponseBody List<Allim> view(@RequestParam("no") int no,
									 Model model) {
		
		List<Allim> views = allimService.myAllimView(no);
				
		return views;
	}
	
	
	@RequestMapping(value="/updateallim")
	public String updateAllim(@RequestParam ("no") int no, 
							  @RequestParam ("confirm") String confirm,
							  HttpSession session) {
	
		User logined = (User) session.getAttribute("LOGIN_USER");
		
		int loginedNo = logined.getNo();
		
		Allim allim = allimService.getAllimByAllimNo(no);
		
		if(allim.getCheck().equals("Y")) {
			String refuse = "N";
			allim.setCheck(refuse);
		} else {
			allim.setCheck(confirm);
		}
		
		allimService.updateAllim(allim);
		
		return "redirect:allim?no=" + loginedNo;
	}
	
	
	/* ajax 알림 업데이트 사용 안 함
	@RequestMapping(value="/updateallim")
	public @ResponseBody int updateAllim(@RequestParam ("no") int no, @RequestParam("userNo") int userNo, 
									 @RequestParam ("confirm") String confirm) {
		
		Allim allim = allimService.getAllimByAllimNo(no);
		allim.setCheck(confirm);
		
		allimService.updateAllim(allim);
		int alimCount = allimService.myAllimCount(userNo);
		
		return alimCount;
	}
	*/
	
	@RequestMapping(value="/allimdetailview")
	public String allimdetailview(@RequestParam ("allimNo") int  allimNo,
								@RequestParam ("eventNo") int eventNo,
								@RequestParam ("confirm") String confirm,
			  					HttpSession session,
			  					Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");		
		
		Allim allim = allimService.getAllimByAllimNo(allimNo);
		allim.setCheck(confirm);
		allimService.updateAllim(allim);
		
		
		Allim allimInfo = allimService.getAllimByAllimNo(allimNo);
		Board allimSelect = boardService.getBoardByNo(eventNo);
		List<BoardMedia> medias = boardService.getBoardMediasByBoardNo(eventNo);
		
		model.addAttribute("allimInfo", allimInfo);
		model.addAttribute("allimSelect", allimSelect);
		model.addAttribute("medias", medias);
		model.addAttribute("loginUser", user);
		
		return "allimdetailview";
	}
}
