package com.test.db;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.AdminBean;

@Repository
public class AdminDao {

	// 쿼리문 관리 객체 주입
	@Autowired
	private SqlSessionTemplate tmp;
	
	// 로그인 처리 메서드
	public AdminBean loginAdminPro(AdminBean loginCheckBean) {
		// 쿼리를 실행한다
		AdminBean loginAdminBean = tmp.selectOne("admin_db.login_admin_pro", loginCheckBean);
			
			return loginAdminBean;
	}
	
	// 아이디 중복확인 여부 함수
	public String checkAdminId(String newId) {
		// 쿼리 실행
		String admin_name = tmp.selectOne("admin_db.check_admin_id", newId);
		
		return admin_name;
	}
	
	// 회원 정보를 가져오는 메서드
	public AdminBean getAdminInfo(Integer admin_idx) {
		// 쿼리를 실행한다
		AdminBean memberBean = tmp.selectOne("admin_db.get_admin_info", admin_idx);
		
		return memberBean;
	}
}

