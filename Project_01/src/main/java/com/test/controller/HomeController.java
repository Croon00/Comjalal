package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




// bean 등록
// bean의 역할을 Controller로 지정한다.(component)
@Controller
public class HomeController {

	// 주소만 입력하여 요청했을 때 호출될 메서드 (aop) 브라우저가 요청하는 행위
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/main";
	}
	
}
