package com.test.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.test.beans.UserBean;
import com.test.db.UserDao;

@Service
public class UserService {

	// dao를 주입
	@Autowired UserDao userDao;
	
	// 로그인 정보가 담긴 객체 주입받기
	@Resource
	@Lazy
	private UserBean loginUserBean;
	
	// 회원가입 처리 함수
		public void addUserInfo(UserBean bean1) {
			// 저장함수를 호출한다.
			userDao.addUserInfo(bean1);
		}
		
		// 아이디 중복 여부 확인 함수
		public String checkUserId(String newId) {
			// 데이터를 가져온다.
			String user_name = userDao.checkUserId(newId);
			
			// 만약 가져온 사용자 이름이 있다면 아이디가 존재하는 것으로 취급한다.
			if(user_name != null) {
				return "NO";
			} else {
				return "YES";
			}
		}
		
		// 로그인 처리
		public void loginUserPro(UserBean loginCheckBean) {
			
			// 로그인한 사용자 정보를 가져온다.
			UserBean tempBean = userDao.loginUserPro(loginCheckBean);
			
			// 가져온 정보가 있다면 로그인 성공이므로
			// 세션영역에 저장되어 있는 객체에 값을 넣어준다.
			if(tempBean != null) {
				loginUserBean.setUser_idx(tempBean.getUser_idx());
				loginUserBean.setCheck_login(true);
			}
		}
		
		// 사용자 정보를 가져온다.
		public UserBean getUserInfo(Integer user_idx) {
			// 사용자 정보를 가져온다.
			UserBean memberBean = userDao.getUserInfo(user_idx);
			
			return memberBean;
		}
		
		// 사용자 정보를 수정한다.
		public void modifyUserInfo(UserBean bean1) {
			// 세션에 저장되어 있는 로그인한 사용자의 번호를 담는다.
			bean1.setUser_idx(loginUserBean.getUser_idx());
			
			// 쿼리를 실행한다.
			userDao.modifyUserInfo(bean1);
		}
		
		// 로그아웃
		public void UserLoginOut() {
			// 세션영역에 저장되어 있는 로그인 사용자 객체의 check_login 변수를
			// null을 셋팅한다.
			loginUserBean.setCheck_login(null);
		}

	}