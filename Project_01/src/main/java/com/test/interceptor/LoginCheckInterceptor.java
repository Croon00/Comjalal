package com.test.interceptor;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import com.test.beans.UserBean;

public class LoginCheckInterceptor implements HandlerInterceptor{

	// 로그인 정보가 담긴 객체를 주입받는다.
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 로그인을 하지 않았다면...
		Boolean a1 = loginUserBean.getCheck_login();
		
		if(a1 == null || a1 != true) {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "main");
			
			RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/main/message.jsp");
			dis.forward(request, response);
			return false;
		}
		return true;
	}
	
}






