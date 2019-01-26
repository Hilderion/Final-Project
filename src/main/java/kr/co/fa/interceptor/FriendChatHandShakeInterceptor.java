package kr.co.fa.interceptor;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import kr.co.fa.vo.User;

public class FriendChatHandShakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		ServletServerHttpRequest sshr = (ServletServerHttpRequest) request;
		HttpSession session = sshr.getServletRequest().getSession();
		
		User user = (User)session.getAttribute("LOGIN_USER");
		if (user != null) {
			attributes.put("LOGIN_USER_NO", user.getNo());
		}
		return true;
	}
}
