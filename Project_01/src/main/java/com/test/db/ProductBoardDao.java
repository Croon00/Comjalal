package com.test.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.BuytempBean;
import com.test.beans.CartBean;
import com.test.beans.OrderedBean;
import com.test.beans.ProductBean;
import com.test.beans.ProductBoardBean;

@Repository
public class ProductBoardDao {

	@Autowired
	private SqlSessionTemplate tmp;
	
	// 게시판 정보 가져오기
	public List<ProductBoardBean> getProductBoardList(){
		// 쿼리를 실행한다.
		List<ProductBoardBean> list1 = tmp.selectList("product_board_db.select_product_board_info");
		
		return list1;
		
	}
	
	// 상품을 저장한다
	public void addProductData(ProductBean bean1) {
		tmp.insert("product_board_db.add_product_data", bean1);
	}
	
	// 상품을 장바구니에 저장
	public void addCartProductData(CartBean bean1) {
		tmp.insert("product_board_db.add_cart_product_data", bean1);
	}
	
	// 장바구니에서 체크한 상품을 임시테이블에 저장
	public void addBuytempData(BuytempBean bean1) {
		tmp.insert("product_board_db.add_buytemp_data", bean1);
	}
	
	// 구매페이지로 아이템 결제
	public void addPaymentData(OrderedBean bean1) {
		tmp.insert("product_board_db.add_ordered_data", bean1);
	}
	
	
	
	// 상품 하나를 가져온다
	public ProductBean getProductData(Integer product_idx) {
		// 쿼리 실행
		ProductBean bean1 = tmp.selectOne("product_board_db.select_product_info", product_idx);
		return bean1;
	}
	
	// 게시판 정보 하나 가져오기
	public ProductBoardBean getProductBoardInfo(Integer product_board_idx) {
		// dao의 메서드를 호출한다.
		ProductBoardBean bean1 = tmp.selectOne("product_board_db.get_product_board_info", product_board_idx);
		return bean1;
	}
	
	// 상품 리스트를 가져온다.
	public List<ProductBean> getProductList(Integer product_board_idx, Integer a1){
		// 페이징을 위한 정보를 가지고 있는 객체
		RowBounds bounds = new RowBounds(a1, 10);
		// 쿼리 실행
		List<ProductBean> list1 = tmp.selectList("product_board_db.get_product_list", product_board_idx, bounds);
		return list1;
	}
	

	// 장바구니로 상품 목록을 가져오기
	public List<CartBean> getCarttList(Integer cart_user_idx){
		
		List<CartBean> list1 = tmp.selectList("product_board_db.get_cart_product_list", cart_user_idx);
		
		return list1;
	}
	
	// 구매페이지로 장바구니에서 체크한 상품 목록 가져오기
	public List<BuytempBean> getOrderList(Integer buytemp_user_idx){
	
		List<BuytempBean> list1 = tmp.selectList("product_board_db.get_order_product_list", buytemp_user_idx);

		return list1;
	}
	
	// 상품 개수를 가져온다.
	public Integer get_product_count(Integer product_index_idx) {
		//가져온다
		Integer list_count = tmp.selectOne("product_board_db.get_product_count", product_index_idx);
		
		return list_count;
	}
	
	// 상품 수정
	public void modifyProduct(ProductBean bean1) {
		tmp.update("product_board_db.update_product_info",bean1);
		
	}
	
	// 상품 삭제
	public void deleteProduct(ProductBean bean1) {
		tmp.delete("product_board_db.delete_product", bean1);
	}
	
	// 장바구니에서 상품 삭제
	public void deleteCartProduct(CartBean bean1) {
		tmp.delete("product_board_db.delete_cart_product", bean1);
	}
	
	
	// 상품 리스트를 가져온다.
	public List<ProductBean> getSearchList(String keyword){


		// 쿼리 실행
		List<ProductBean> list1 = tmp.selectList("product_board_db.search_product", "%" + keyword + "%");
		return list1;
	}
	
	// 메인페이지 구성을 위한 상위 3개만 가져오기
	public List<ProductBean> top3_list(Integer product_board_idx){
		
		RowBounds bounds = new RowBounds(0, 3);
		
		List<ProductBean> list1 = tmp.selectList("product_board_db.get_product_list", product_board_idx, bounds);
		return list1;
	}
	

	
}
