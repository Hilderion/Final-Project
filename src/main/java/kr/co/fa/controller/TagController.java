package kr.co.fa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fa.service.TagService;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Tag;

@Controller
public class TagController {
	
	@Autowired
	TagService tagService;
	
	@RequestMapping(value="/tagPicture")
	public @ResponseBody List<BoardMedia> tags(@RequestParam ("userNo") int userNo) {
		
		List<BoardMedia> tagPictures = tagService.tagPicture(userNo); 
		
		return tagPictures;
	}
	
	@RequestMapping(value="/tagInformation")
	public @ResponseBody BoardMedia tagInfo(@RequestParam ("tagId") int tagId) {
		
		BoardMedia tagInform = tagService.tagInformation(tagId);
		
		return tagInform;
	}

}
