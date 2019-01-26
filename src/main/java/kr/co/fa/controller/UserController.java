package kr.co.fa.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.fa.service.BoardService;
import kr.co.fa.service.UserService;
import kr.co.fa.vo.Board;
import kr.co.fa.vo.User;

@Controller
public class UserController {

	@Value("${directory.image}")
	private String photoDirectory;

	@Autowired
	UserService userService;

	@Autowired
	BoardService boardService;

	@RequestMapping(value="/getUser")
	public @ResponseBody User getUser(@RequestParam("user") int userNo) {
		User user = userService.getUserByUserNo(userNo);
		return user;
	}
	@RequestMapping(value="/users")
	public String userHome() {

		return "users/home-hjs";
	}

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerform() {

		return "users/home-hjs";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(String name, String email, String pwd, int year, int month, int day, String gender) {

		String birth = year + "-" + month + "-" + day ;
		String manProfile = "male.png";
		String womanProfile = "female.png";
		String cover = "basiccover.jpg";
		
		User user = new User();

		user.setName(name);
		user.setEmail(email);
		user.setPassword(pwd);
		user.setBirth(birth);
		user.setSex(gender);

		if (gender.equals("M")) {
			user.setProfile(manProfile);
		} else {
			user.setProfile(womanProfile);
		}

		user.setCover(cover);
		
		if(userService.getUserByEmail(email) == null) {
			
			userService.addUser(user);
			return "redirect:/";
			
		} else {
			
			return "redirect:/";
			
		}


	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginform() {

		return "profile";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String mailid, String pwd, HttpSession session, Model model) {

		User user = userService.getUserByEmail(mailid);
		if (user == null) {
			return "redirect:/";
		}

		if (!user.getPassword().equals(pwd)) {
			return "redirect:/";
		}

		session.setAttribute("LOGIN_USER", user);
		return "redirect:/";
	}

	@RequestMapping(value="/addcover")
	public String uploadCover(MultipartFile photofile, HttpSession session) throws IOException {

		User logined = (User) session.getAttribute("LOGIN_USER");

		String mail = logined.getEmail();

		User user = userService.getUserByEmail(mail);

		System.out.println("사진 경로: " + photoDirectory);

		if(!photofile.isEmpty()) {

			String filename = photofile.getOriginalFilename();
			System.out.println("파일 이름: " + filename);

			long filesize = photofile.getSize();
			System.out.println("파일사이즈: " + filesize);

			String contentType = photofile.getContentType();
			System.out.println("컨텐츠 타입: " + contentType);

			FileCopyUtils.copy(photofile.getBytes(), new File(photoDirectory, filename));
			user.setCover(filename);
			userService.updateUser(user);

		}
		user = userService.getUserByUserNo(user.getNo());
		session.setAttribute("LOGIN_USER", user);

		return "redirect:profile.do?userNo=" + logined.getNo();
	}

	@RequestMapping(value="/addprofile")
	public String uploadProfile(MultipartFile profilephoto, HttpSession session) throws IOException {

		User logined = (User) session.getAttribute("LOGIN_USER");

		String mail = logined.getEmail();

		User user = userService.getUserByEmail(mail);

		System.out.println("사진 경로: " + photoDirectory);

		if(!profilephoto.isEmpty()) {

			String filename = profilephoto.getOriginalFilename();
			System.out.println("파일 이름: " + filename);

			long filesize = profilephoto.getSize();
			System.out.println("파일사이즈: " + filesize);

			String contentType = profilephoto.getContentType();
			System.out.println("컨텐츠 타입: " + contentType);

			FileCopyUtils.copy(profilephoto.getBytes(), new File(photoDirectory, filename));
			user.setProfile(filename);
			userService.updateUser(user);

		}
		user = userService.getUserByUserNo(user.getNo());
		session.setAttribute("LOGIN_USER", user);

		return "redirect:profile.do?userNo=" + logined.getNo();
	}

	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
