package kr.co.fa.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;

import kr.co.fa.service.UserService;
import kr.co.fa.service.AllimService;
import kr.co.fa.service.FriendService;
import kr.co.fa.service.MessageService;
import kr.co.fa.vo.Allim;
import kr.co.fa.vo.FriendEvent;
import kr.co.fa.vo.User;

public class UserInfoInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	UserService userService;
	@Autowired
	FriendService friendService;
	@Autowired
	AllimService allimService;
	@Autowired
	MessageService messageService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("LOGIN_USER");
		
		if(null != user) {
			List<User> friends = friendService.getFriendsByUserNo(user.getNo());
			int allimCount = allimService.myAllimCount(user.getNo());
			int requestCount = friendService.getFriendRequestCount(user.getNo());
			int messageCount = messageService.getMessageCount(user.getNo());
			List<FriendEvent> events = friendService.getFriendRequest(user.getNo());
			
			List<Map<String,Object>> friends2 = friendService.getAdvFriendsByUserNo(user.getNo());
			List<Allim> allims = allimService.myAllimView(user.getNo());
			
			request.setAttribute("loginFriends", friends);
			request.setAttribute("allimCount", allimCount);
			request.setAttribute("recommands", friends2);
			request.setAttribute("events", events);
			request.setAttribute("requestCount", requestCount);
			request.setAttribute("messageCount", messageCount);
			request.setAttribute("allims", allims);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}
}
