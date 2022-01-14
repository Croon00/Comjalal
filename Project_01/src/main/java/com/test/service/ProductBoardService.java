package com.test.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.beans.AdminBean;
import com.test.beans.BuytempBean;
import com.test.beans.CartBean;
import com.test.beans.OrderedBean;
import com.test.beans.ProductBean;
import com.test.beans.ProductBoardBean;
import com.test.beans.UserBean;
import com.test.db.ProductBoardDao;

@Service
public class ProductBoardService {

	@Autowired
	private ProductBoardDao productboardDao;

	// 로그인 관리자 정보 객체 주입받기
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;

	// 로그인 사용자 정보 객체 주입받기
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	// 업로드될 파일이 저장될 경로를 주입받기
	@Value("${path.upload}")
	private String upload_path;

	// 게시판 정보 가져오기
	public List<ProductBoardBean> getProductBoardList() {

		List<ProductBoardBean> list1 = productboardDao.getProductBoardList();

		return list1;
	}

	// 상품 등록
	public void addProductData(ProductBean bean1) {
		// 현재 로그인한 어드민 사용자 번호 담기
		bean1.setProduct_writer_idx(loginAdminBean.getAdmin_idx());
		// 글을 저장하는 메서드 호출
		productboardDao.addProductData(bean1);
	}

	// 상품 장바구니에 저장
	public void addCartProductData(CartBean bean1) {
		bean1.setCart_user_idx(loginUserBean.getUser_idx());

		productboardDao.addCartProductData(bean1);
	}

	// 임시테이블에 장바구니 상품 저장
	public void addBuytempData(BuytempBean bean1) {
		bean1.setBuytemp_user_idx(loginUserBean.getUser_idx());

		productboardDao.addBuytempData(bean1);
	}
	
	// 임시테이블에 장바구니 상품 저장
		public void addPaymentData(OrderedBean bean1) {
			bean1.setOrdered_user_idx(loginUserBean.getUser_idx());

			productboardDao.addPaymentData(bean1);
		}

	// 업로드된 파일 데이터 저장
	public String saveUploadFile(MultipartFile upload_file) {
		// 서버에 저장될 파일 이름
		// 현재 시간 + 원본 파일 이름
		String file_name = System.currentTimeMillis() + "-" + upload_file.getOriginalFilename();

		// 저장한다.
		try {
			upload_file.transferTo(new File(upload_path + "/" + file_name));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}

	// 업로드된 파일 데이터 저장
	public String saveUploadFile2(MultipartFile upload_file2) {
		// 서버에 저장될 파일 이름
		// 현재 시간 + 원본 파일 이름
		String file_name2 = System.currentTimeMillis() + "-" + upload_file2.getOriginalFilename();

		// 저장한다.
		try {
			upload_file2.transferTo(new File(upload_path + "/" + file_name2));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name2;
	}

	// 상품 정보 하나를 확인
	// 상품 하나를 가져온다
	public ProductBean getProductData(Integer product_idx) {

		// 서비스의 메서드를 호출한다
		ProductBean bean1 = productboardDao.getProductData(product_idx);
		return bean1;
	}

	// 게시판 정보 하나 가져오기
	public ProductBoardBean getProductBoardInfo(Integer product_board_idx) {
		// dao의 메서드를 호출한다.
		ProductBoardBean bean1 = productboardDao.getProductBoardInfo(product_board_idx);
		return bean1;
	}

	// 상품 리스트를 가져온다.
	public List<ProductBean> getProductList(Integer product_idx, Integer page) {
		// 페이징을 위한 값을 구한다.
		// 제외할 값

		Integer a1 = (page - 1) * 10;

		// dao의 메서드 호출
		List<ProductBean> list1 = productboardDao.getProductList(product_idx, a1);
		return list1;
	}

	// 구매페이지로 장바구니에서 체크한 상품목록을 가져온다
	public List<BuytempBean> getOrderList() {

		List<BuytempBean> list1 = productboardDao.getOrderList(loginUserBean.getUser_idx());

		return list1;
	}

	// 상품 개수 가져오기
	public Integer get_product_count(Integer product_board_idx) {
		Integer list_count = productboardDao.get_product_count(product_board_idx);
		return list_count;
	}

	// 상품 수정하기
	public void modifyProduct(ProductBean bean1) {
		// dao의 메서드를 호출한다
		productboardDao.modifyProduct(bean1);
	}

	// 상품 삭제
	public void deleteProduct(ProductBean bean1) {
		// dao의 메서드를 호출
		productboardDao.deleteProduct(bean1);
	}

	// 장바구니로 상품 목록 가져오기
	public List<CartBean> getCartList() {

		List<CartBean> list1 = productboardDao.getCarttList(loginUserBean.getUser_idx());
		return list1;
	}

	// 장바구니에서 상품 삭제
	public void deleteCartProduct(CartBean bean1) {
		// dao의 메서드를 호출
		productboardDao.deleteCartProduct(bean1);
	}

	// 검색 리스트를 가져온다.
	public List<ProductBean> getSerachList(String keyword) {
		// 페이징을 위한 값을 구한다.
		// 제외할 값

		// dao의 메서드 호출
		List<ProductBean> list1 = productboardDao.getSearchList(keyword);
		return list1;
	}
	
	// 메인 페이지를 위한 리스트
	public List<ProductBean> top3_list(Integer product_board_idx){
		List<ProductBean> list1 = productboardDao.top3_list(product_board_idx);
		return list1;
	}

}
