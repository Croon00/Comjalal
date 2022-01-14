package com.test.db;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.UserBean;

// DAO : Database Access Object - 데이터베이스에 관련된 작업을 하는 bean

@Repository
public class UserDao {

	// 쿼리문 관리 객체를 주입받는다.
	@Autowired
	private SqlSessionTemplate tmp;
	
	// 회원 정보를 저장하는 메서드
	public void addUserInfo(UserBean bean1) {
		// 쿼리를 실행한다.
		tmp.insert("user_db.add_user_info", bean1);
	}
	
	// 아이디 중복확인 여부 함수
	public String checkUserId(String newId) {
		// 쿼리를 실행한다
		String user_name = tmp.selectOne("user_db.check_user_id", newId);
		
		return user_name;
	}
	
	// 로그인 처리 메서드
	public UserBean loginUserPro(UserBean loginCheckBean) {
		// 쿼리를 실행한다.
		UserBean loginUserBean = tmp.selectOne("user_db.login_user_pro", loginCheckBean);
				
		return loginUserBean;
	}
	
	// 회원 정보를 가져오는 메서드
	public UserBean getUserInfo(Integer user_idx) {
		// 쿼리를 실행한다.
		UserBean memberBean = tmp.selectOne("user_db.get_user_info", user_idx);
		
		return memberBean;
	}
	
	// 회원정보 수정
	public void modifyUserInfo(UserBean bean1) {
		// 쿼리를 실행한다.
		tmp.update("user_db.modify_user_info", bean1);
	}
	
}
