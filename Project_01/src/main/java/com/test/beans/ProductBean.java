package com.test.beans;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	
	private Integer product_idx;
	private String product_name;
	private Integer product_code;
	private String product_made;
	private String product_date;
	private Integer product_notice_idx;
	private Integer product_writer_idx;
	private String product_file;
	private Integer product_price;
	private String product_text;
	private String product_file2;
	
	public String getProduct_file2() {
		return product_file2;
	}
	public void setProduct_file2(String product_file2) {
		this.product_file2 = product_file2;
	}
	// 파일 데이터를 주입받을 변수
	private MultipartFile upload_file;
	
	// 파일 데이터를 주입받을 변수
	private MultipartFile upload_file2;
	
	public MultipartFile getUpload_file2() {
		return upload_file2;
	}
	public void setUpload_file2(MultipartFile upload_file2) {
		this.upload_file2 = upload_file2;
	}
	public Integer getProduct_idx() {
		return product_idx;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public void setProduct_idx(Integer product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Integer getProduct_code() {
		return product_code;
	}
	public void setProduct_code(Integer product_code) {
		this.product_code = product_code;
	}
	public String getProduct_made() {
		return product_made;
	}
	public void setProduct_made(String product_made) {
		this.product_made = product_made;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public Integer getProduct_notice_idx() {
		return product_notice_idx;
	}
	public void setProduct_notice_idx(Integer product_notice_idx) {
		this.product_notice_idx = product_notice_idx;
	}
	public Integer getProduct_writer_idx() {
		return product_writer_idx;
	}
	public void setProduct_writer_idx(Integer product_writer_idx) {
		this.product_writer_idx = product_writer_idx;
	}
	public String getProduct_file() {
		return product_file;
	}
	public void setProduct_file(String product_file) {
		this.product_file = product_file;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public String getProduct_text() {
		return product_text;
	}
	public void setProduct_text(String product_text) {
		this.product_text = product_text;
	}
	
	
	
	
}
