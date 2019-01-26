package kr.co.fa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.RepUserService;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.User;

@Controller
public class RepUserController {

	@Autowired
	RepUserService userService;
	
	@RequestMapping(value="/admin/repuser", method=RequestMethod.GET)
	public String repUser(RepBoardCriteria criteria, 
						@RequestParam(name="cp", required=false, defaultValue="1") int cp,
						Model model) {
		
		
		List<User> users = userService.getUserList(criteria, cp);
		int totalRows = userService.getTotalRows(criteria);
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp, 20);
		
		model.addAttribute("users", users);
		model.addAttribute("pagination", pagination);
		
		return "admin/rep-user";
	}
	
	@RequestMapping(value="/admin/repuser/ajax", method=RequestMethod.GET)
	@ResponseBody
	public User repUserAjax(@RequestParam("no") int no) {

		return userService.getUserByNo(no);
	}
	
	@RequestMapping(value="/admin/repuser/switch", method=RequestMethod.GET)
	@ResponseBody
	public String repUserAjaxSwitch(@RequestParam("no") int no,
									@RequestParam("access") String access) {
		
		return userService.updateUser(no, access);
	}
	
	
}
