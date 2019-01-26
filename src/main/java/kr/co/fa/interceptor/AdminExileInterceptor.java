package kr.co.fa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.fa.vo.RepAdmin;

public class AdminExileInterceptor extends HandlerInterceptorAdapter{

	public static final int adminLv0 = 0;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("LOGIN_ADMIN");
		RepAdmin admin = (RepAdmin) obj;
		
		if (admin.getSecLevel() == adminLv0) {
			response.sendRedirect("/fa/adminLogin?login=exile");
			return false;
		} 
		
		return true;
		
	}
	
	

	
}
