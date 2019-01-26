package kr.co.fa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("LOGIN_ADMIN");
		
		if (obj == null) {
			response.sendRedirect("/fa/adminLogin?login=fail");
			return false;
		}
		
		return true;
		
	}
	
	

	
}
