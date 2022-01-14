package com.test.beans;

public class AdminBean {

	private Integer admin_idx;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private Boolean check_login;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public Boolean getCheck_login() {
		return check_login;
	}
	public void setCheck_login(Boolean check_login) {
		this.check_login = check_login;
	}
	public Integer getAdmin_idx() {
		return admin_idx;
	}
	public void setAdmin_idx(Integer admin_idx) {
		this.admin_idx = admin_idx;
	}
	
	
}
