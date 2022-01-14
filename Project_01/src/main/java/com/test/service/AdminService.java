package com.test.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.test.beans.AdminBean;
import com.test.db.AdminDao;

@Service
public class AdminService {

	// dao를 주입
	@Autowired AdminDao adminDao;
	
	// 로그인 정보 담긴 객체 주입
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;
	
	// 로그인 처리
	public void loginAdminPro(AdminBean loginCheckBean) {
		
		// 로그인한 사용자 정보를 가져온다.
		AdminBean tempBean = adminDao.loginAdminPro(loginCheckBean);
		
		// 가져온 정보가 있다면 로그인 성공이므로
		// 세션영역에 저장되어 있는 객체에 값을 넣어준다
		if(tempBean != null) {
			loginAdminBean.setAdmin_idx(tempBean.getAdmin_idx());
			loginAdminBean.setCheck_login(true);
		}
	}
	
	// 아이디 중복 여부 확인 함수
	public String checkAdminId(String newId) {
		// 데이터를 가져온다
		String admin_name = adminDao.checkAdminId(newId);
		
		// 가져온 사용자 이름이 있다면 아이디 존재하는 것으로 취급
		if(admin_name != null) {
			return"No";
		}else {
			return "Yes";
		}
	}
	
	// 사용자 정보를 가져온다
	public AdminBean getAdminInfo(Integer admin_idx) {
		// 사용자 정보를 가져온다.
		AdminBean memberBean = adminDao.getAdminInfo(admin_idx);
		
		return memberBean;
	}
	
	public void AdminLoginOut() {
		// 세션영역에 저장되어 있는 로그인 어드민 객체의 check_login 변수를
		// null을 셋팅한다
		loginAdminBean.setCheck_login(null);
	}
}
