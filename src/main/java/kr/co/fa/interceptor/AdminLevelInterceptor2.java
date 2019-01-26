package kr.co.fa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.fa.vo.RepAdmin;

public class AdminLevelInterceptor2 extends HandlerInterceptorAdapter{

	public static final int adminLv2 = 2;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("LOGIN_ADMIN");
		RepAdmin admin = (RepAdmin) obj;
		
		if (admin.getSecLevel() <= adminLv2) {
			response.sendRedirect("/fa/admin");
			return false;
		} 
		
		return true;
		
	}
	
	

	
}
