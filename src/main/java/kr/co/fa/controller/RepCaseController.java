package kr.co.fa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.RepCaseService;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.RepCase;

@Controller
public class RepCaseController {

	@Autowired
	RepCaseService caseService;
	
	@RequestMapping(value="admin/case")
	public String repCase(RepBoardCriteria criteria,
							@RequestParam(name="cp",required=false, defaultValue="1" ) int cp,
							Model model) {
		
		List<RepCase> cases = caseService.getRepCases(criteria, cp);
		int totalRows = caseService.getTotalRows(criteria);
		
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("cases", cases);
		
		return "admin/rep-case";
	}
	
	// test method
	@RequestMapping(value="admin/casetest")
	public String repCaseReportTest() {
		
		return "admin/rep-case-test";
	}
	
	@RequestMapping(value="admin/test-submit", method=RequestMethod.POST)
	public String repCaseTest(RepCase repCase) {

		caseService.addRepCase(repCase);
		
		return "redirect:case";
	}
	
	//ajax
	@RequestMapping(value="admin/case/case-process", method=RequestMethod.GET, produces=MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String repCaseAjaxProcess(RepCase repCase) {
		
		caseService.ajaxProcess(repCase);
		
		return "success";
	}
	
	@RequestMapping(value="admin/case/case-rollback", method=RequestMethod.GET)
	@ResponseBody
	public String repCaseAjaxRollBack(RepCase repCase) {
		
		caseService.ajaxRollBack(repCase);
		
		return "";
	}
	
	@RequestMapping(value="profile.do/report" , method=RequestMethod.POST)
	@ResponseBody
	public String repCaseReport(RepCase repCase) {
		
		caseService.addRepCase(repCase);
		
		return "success";
	}
	
	@RequestMapping(value="report" , method=RequestMethod.POST)
	@ResponseBody
	public String repCaseSubReport(RepCase repCase) {
		
		caseService.addRepCase(repCase);
		
		return "success";
	}
	
	@RequestMapping(value="admin/case/case-ajax", method=RequestMethod.GET)
	@ResponseBody
	public RepCase repCaseAjaxModal (int no) {
		
		RepCase repCase =caseService.getRepCaseByNo(no);
		
		return repCase;
	};
	
	
}
