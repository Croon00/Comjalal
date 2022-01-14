package com.test.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import com.test.beans.AdminBean;
import com.test.beans.ProductBoardBean;
import com.test.service.ProductBoardService;

public class TopMenuInterceptor implements HandlerInterceptor {

	@Autowired
	private ProductBoardService productboardService;
	
	// 세션 scope로 지정된 객체를 주입받는다.
	// 이 객체에는 로그인한 사용자의 정보가 담겨져 있다.
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 데이터 가져오기
		List<ProductBoardBean> product_menu_list = productboardService.getProductBoardList();
		request.setAttribute("top_proudct_menu_list", product_menu_list);
		
		// 로그인 정보를 담는다.
		request.setAttribute("loginAdminBean", loginAdminBean);
		// 다음 단계로 진행할 수 있도록 true를 반환한다.
		return true;
	}
}
