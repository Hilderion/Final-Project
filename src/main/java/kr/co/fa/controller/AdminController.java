package kr.co.fa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import kr.co.fa.service.AdminService;
import kr.co.fa.vo.RepAdmin;
import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/adminLogin",method=RequestMethod.GET) 
	public String login() {
		
		return "admin/admin-login-jih";
	}
	
	@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
	public String adminLogin(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			WebRequest webRequest) {
		RepAdmin admin = adminService.checkLogin(id, pwd);
		
		if (admin == null) {
			return "redirect:/adminLogin?login=fail";
			
		} else if (admin.getSecLevel() == 0) {
			return "redirect:/adminLogin?login=exile";
		}
		
		webRequest.setAttribute("LOGIN_ADMIN", admin, WebRequest.SCOPE_SESSION);
			
		return "redirect:/admin";
			
		
	}
	
	@RequestMapping(value="/admin/logout")
	public String logoutAdmin(WebRequest webRequest) {
		webRequest.removeAttribute("LOGIN_ADMIN", WebRequest.SCOPE_SESSION);
		
		return "redirect:adminLogin.do";
	}
	
	@RequestMapping(value="/admin")
	public String adminHome(Model model) {
		
		List<RepBoard> boards = adminService.getBoards();
		int caseCount = adminService.getRepCaseCount();
		int userCount = adminService.getUserCount();
		int adCount = adminService.getRepAdCount();
		
		model.addAttribute("adCount", adCount);
		model.addAttribute("userCount", userCount);
		model.addAttribute("caseCount", caseCount);
		model.addAttribute("boards", boards);
		
		return "admin/home-jih";
	}
	
	@RequestMapping(value="/admin/adminConfig") 
	public String adminConfig() {
		
		return "admin/admin-jih";
	}
	
	@RequestMapping(value="/admin/duplCheck", method=RequestMethod.GET)
	@ResponseBody
	public String adminDuplCheck(@RequestParam("id")String id) {
		if (adminService.checkDuplicateById(id) == false) {
			return "dupl";
		}
		return "possible";
	}
	
	@RequestMapping(value="/admin/adminregister", method=RequestMethod.POST)
	public String addAdmin(RepAdmin repAdmin, HttpServletRequest request) {
		RepAdmin accessAdmin = getSessionAdmin(request);
		
		adminService.addAdmin(repAdmin, accessAdmin);
			
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/admin/adminList")
	public String adminList(Model model, HttpServletRequest request, RepBoardCriteria criteria) {

		RepAdmin admin = getSessionAdmin(request);
		int accessNo = admin.getNo();
		
		List<RepAdmin> admins = adminService.getAdminList(accessNo, criteria);
		
		model.addAttribute("admins",admins);
		return "admin/admin-list";
	}
	
	@RequestMapping(value="/admin/adminList/ajax", method=RequestMethod.GET )
	@ResponseBody
	public String adminAjax (int no, int level, int hiddenLevel, HttpServletRequest request) {
		
		RepAdmin admin = getSessionAdmin(request);
		boolean result = adminService.updateAdminAjax(admin, no, level, hiddenLevel);
		
		if (true == result) {
			return "success";
		} else {
			return "exile";
		}
	}
	
	public RepAdmin getSessionAdmin (HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("LOGIN_ADMIN");
		RepAdmin admin = (RepAdmin) obj;
		return admin;
	}
	
	

}
