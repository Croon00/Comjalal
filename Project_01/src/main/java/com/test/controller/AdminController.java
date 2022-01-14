package com.test.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.beans.AdminBean;
import com.test.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// 세션영역에 저장되어 있는 bean을 주입받는다
	@Resource(name = "loginAdminBean")
	@Lazy
	AdminBean loginAdminBean;

	// 로그인
	@GetMapping("/admin_login")
	public String user_login(@RequestParam(defaultValue = "false") boolean chk123,
							 Model model) {
		// chk123 변수는 true가 들어 있으면 로그인 실패 문구를 보여줄 것이다.
		model.addAttribute("chk123", chk123);
		
		return "admin/admin_login";
	}
	// 중복 여부 확인
	@GetMapping("/check_admin_id")
	public String check_admin_id(@RequestParam("new_id") String new_id,
								  Model model) {
		
		// 서비스를 통해 중복 여부 값을 가져오기
		String chk123 = adminService.checkAdminId(new_id);
		
		model.addAttribute("chk123", chk123);
		
		return "admin/check_admin_id";
	}
	
	// 로그인 처리
	@PostMapping("/admin_login_pro")
	public String admin_login_pro(@ModelAttribute("loginAdminBean") AdminBean bean1,
								  Model model) {
		
		adminService.loginAdminPro(bean1);
		
		if(loginAdminBean.getCheck_login() == null) {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			model.addAttribute("url", "adimin_login?chk123=true");
		}
		else {
			
			model.addAttribute("msg", "로그인에 성공하였습니다.");
			model.addAttribute("url", "main");
		}
		
		return "main/message";
	}
	
	// 로그아웃
	@GetMapping("/admin_logout")
	public String admin_logout(Model model) {
		// 서비스의 메서드를 호출한다.
		adminService.AdminLoginOut();
		
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("url", "main");
		
		return "main/message";
	}
	
	// 관리자 페이지
	@GetMapping("/admin_management")
	public String admin_management() {
		
		return "admin/admin_management";
	}
}
