package kr.co.fa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fa.view.FileDownloadView;
import kr.co.fa.service.RepBoardService;
import kr.co.fa.vo.RepAd;
import kr.co.fa.vo.RepBoard;
import kr.co.fa.vo.RepBoardCriteria;
import kr.co.fa.vo.RepBoardPagination;
import kr.co.fa.vo.User;

@Controller
public class RepBoardController {
	
	@Value("${directory.file}")
	private String fileDirectory;
	
	@Autowired
	RepBoardService boardService;
	
	@Autowired
	FileDownloadView FileDownloadView;
	
	public User sessionGetUser(HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		return user;
	}

	@RequestMapping(value="/admin/repBoard/boardDetail",method=RequestMethod.GET)
	public String repBoardDetail(Model model, @RequestParam("no") int boardNo) {
		RepBoard board = boardService.getBoardByNo(boardNo);
		
		model.addAttribute("board", board);
		return "admin/rep-board-detail";
	}
	
	@RequestMapping(value="/admin/repBoard/boardList")
	public String repBoardList(RepBoardCriteria criteria, 
								@RequestParam(name="cp", required=false, defaultValue="1") int cp, 
								Model model) {
		
		List<RepBoard> boards = boardService.getBoards(criteria, cp);
		boards = boardService.getSubBoards(boards);
		
		int totalRows = boardService.getTotalRows(criteria);
		
		RepBoardPagination pagination = new RepBoardPagination(totalRows, cp);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("boards", boards);
		
		return "admin/rep-board-list";
	}
	
	@RequestMapping(value="/admin/repBoard/boardWriteForm")
	public String repBoardWriteForm() {
		
		return "admin/rep-board-write";
	}
	
	
	@RequestMapping(value="/admin/repBoard/repWrite",method=RequestMethod.POST)
	public String repBoardWrite(RepBoard repBoard, List<MultipartFile> upfiles) throws IOException {

		boardService.boardWrite(repBoard, upfiles);
		
		return "redirect:/admin/repBoard/boardList";
	}
	
	
	@RequestMapping(value="/admin/repBoard/boardDetail/subWrite", method=RequestMethod.POST)
	public String repSubWrite (@RequestParam ("boardNo") int boardNo,
								@RequestParam("userNo") int userNo,
								@RequestParam("sub_contents") String contents) {
		
		boardService.subWrite(boardNo, userNo, contents);
		
		return "redirect:/admin/repBoard/boardDetail?no="+boardNo;
		
	}
	
	@RequestMapping(value="/subWrite2", method=RequestMethod.POST)
	public String repSubWrite2 (@RequestParam ("boardNo") int boardNo,
			@RequestParam("userNo") int userNo,
			@RequestParam("sub_contents") String contents) {
		
		boardService.subWrite(boardNo, userNo, contents);
		
		return "redirect:boardDetail?no="+boardNo;
		
	}
	
	@RequestMapping(value="/admin/repBoard/boardDetail/subDel",method=RequestMethod.GET)
	public String repSubDel (@RequestParam ("boardNo") int boardNo,
							@RequestParam ("subNo") int subNo) {
		
		boardService.subDel(subNo);
		
		return "redirect:/admin/repBoard/boardDetail?no="+boardNo;
	}
	
	@RequestMapping(value="/subDel2",method=RequestMethod.GET)
	public String repSubDel2 (@RequestParam ("boardNo") int boardNo,
			@RequestParam ("subNo") int subNo) {
		
		boardService.subDel(subNo);
		
		return "redirect:boardDetail?no="+boardNo;
	}
	
	@RequestMapping("/admin/repBoard/download")
	public ModelAndView fileDownload(String dir, String name) {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(FileDownloadView);
		mav.addObject("directory", fileDirectory + dir);
		mav.addObject("filename", name);
		
		return mav;
	}
	
	@RequestMapping("/download2")
	public ModelAndView fileDownload2(String dir, String name) {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(FileDownloadView);
		mav.addObject("directory", fileDirectory + dir);
		mav.addObject("filename", name);
		
		return mav;
	}
	
	@RequestMapping("/request")
	public String userRequest(Model model, HttpSession session) {
		User user = sessionGetUser(session);
		List<RepBoard> boards = boardService.getBoardByUserNo(user.getNo());
		
		model.addAttribute("boards", boards);
		return "admin/user-request";
	}
	

	@RequestMapping(value="/reqwrite",method=RequestMethod.POST)
	public String reqBoardWrite(RepBoard repBoard, List<MultipartFile> upfiles) throws IOException {
		boardService.boardWrite2(repBoard, upfiles);
		
		return "redirect:/request";
	}
	
	@RequestMapping(value="/boardDetail")
	public String reqBoardDetail (@RequestParam("no") int boardNo, Model model) {
		RepBoard board = boardService.getBoardByNo(boardNo);
		
		model.addAttribute("board", board);
		return "admin/user-request-detail";
	}
	
}
