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

import com.test.beans.UserBean;
import com.test.service.UserService;

@Controller
public class UserController {

	// 서비스 주입
	@Autowired
	UserService userService;
	
	// 세션영역에 저장되어 있는 bean을 주입받는다.
	@Resource(name = "loginUserBean")
	@Lazy
	UserBean loginUserBean;
	
	// 로그인
	@GetMapping("/user_login")
	public String user_login(@RequestParam(defaultValue = "false") boolean chk,
							 Model model) {
		// chk 변수는 true가 들어 있으면 로그인 실패 문구를 보여줄 것이다.
		model.addAttribute("chk", chk);
		
		return "user/user_login";
	}
	
	// 회원가입
	@GetMapping("/user_join")
	public String user_join() {
		return "user/user_join";
	}
	
	// 정보수정
	@GetMapping("/user_modify")
	public String user_modify(Model model) {
		// 데이터를 가져온다
		UserBean memberBean = userService.getUserInfo(loginUserBean.getUser_idx());
		model.addAttribute("memberBean", memberBean);
		
		return "user/user_modify";
	}
	
	// 회원가입처리
	@PostMapping("/user_join_pro")
	public String user_join_pro(@ModelAttribute("joinBean") UserBean bean1,
							    Model model) {
//		System.out.println(bean1.getUser_name());
//		System.out.println(bean1.getUser_id());
//		System.out.println(bean1.getUser_pw());
//		System.out.println(bean1.getUser_postal_code());
//		System.out.println(bean1.getUser_addr1());
//		System.out.println(bean1.getUser_addr2());
		
		// 저장 처리 함수 호출
		userService.addUserInfo(bean1);
		
		model.addAttribute("msg", "가입이 완료되었습니다.");
		model.addAttribute("url", "user_login");
		
		return "main/message";
	}
	// 중복 여부 확인
	@GetMapping("/check_user_id")
	public String check_user_id(@RequestParam("new_id") String new_id,
			                     Model model) {
		// 서비스를 통해 중복 여부 값을 가져온다.
		String chk = userService.checkUserId(new_id);
		
		model.addAttribute("chk", chk);
		
		return "user/check_user_id";
	}
	
	// 로그인 처리
	@PostMapping("/user_login_pro")
	public String user_login_pro(@ModelAttribute("loginCheckBean") UserBean bean1,
								 Model model) {
//	System.out.println(bean1.getUser_id());
//	System.out.println(bean1.getUser_pw());
	
	userService.loginUserPro(bean1);
	
	if(loginUserBean.getCheck_login() == null) {
		model.addAttribute("msg", "로그인에 실패하였습니다");
		model.addAttribute("url", "user_login?chk=true");
		
		
	} else {
		
		model.addAttribute("msg", "로그인에 성공하였습니다.");
		model.addAttribute("url", "main");
	}
	
	return "main/message";
	}
	
	@PostMapping("/user_modify_pro")
	public String userModfiyPro(@ModelAttribute("modifyBean") UserBean modifyUserBean,
								 Model model) {
		// 서비스 메서드 호출
		userService.modifyUserInfo(modifyUserBean);
		
		model.addAttribute("msg", "수정되었습니다.");
		model.addAttribute("url", "user_modify");
		
		return "main/message";
	}
	
	// 로그아웃
	@GetMapping("/user_logout")
	public String user_logout(Model model) {
		// 서비스의 메서드를 호출한다.
		userService.UserLoginOut();
		
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("url", "main");
		
		return "main/message";
	}
}