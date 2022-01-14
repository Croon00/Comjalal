package com.test.controller;

import java.util.List;

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
import com.test.beans.BuytempBean;
import com.test.beans.CartBean;
import com.test.beans.ProductBean;
import com.test.beans.ProductBoardBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBoardBean;
import com.test.service.ProductBoardService;
import com.test.service.VideoBoardService;

@Controller
public class ProductBoardController {

	// 서비스 주입
	@Autowired
	private ProductBoardService productboardService;
	@Autowired
	private VideoBoardService videoboardService;

	// 어드민 정보 객체 주입
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;

	// 상품 리스트
	@GetMapping("/board_product_list")
	public String board_product_list(@RequestParam Integer product_board_idx,
			@RequestParam(defaultValue = "1") Integer page, Model model) {
		// 전체 페이지의 개수 구하기
		// 상품 개수 가져오기

		int list_count = productboardService.get_product_count(product_board_idx);

		int page_count = list_count / 10;

		if (list_count % 10 > 0) {
			page_count++;
		}

		// 파라미터로 전달된 페이지 번호가 전체 페이지 수 보다 클 경우
		if (page > page_count) {
			page = page_count;
		}

		if (page < 1) {
			page = 1;
		}
		// 게시판 정보 가져오기
		ProductBoardBean productboardBean = productboardService.getProductBoardInfo(product_board_idx);
		model.addAttribute("productboardBean", productboardBean);

		// 상품 리스트 가져오기
		List<ProductBean> list1 = productboardService.getProductList(product_board_idx, page);
		model.addAttribute("product_list", list1);
		// 게시판 번호를 request에 담기
		model.addAttribute("product_board_idx", product_board_idx);

		// 하단부 페이지 번호표쇠(pageination)을 구성하기 위한 값
		// 시작
		int start = ((page - 1) / 10 * 10) + 1;
		int end = start + 9;

		// end 값이 page_count보다 크면 page_count로 셋팅한다.
		if (end > page_count) {
			end = page_count;
		}

		int prev = start - 1;
		int next = end + 1;

		// 시작
		model.addAttribute("page_start", start);
		// 끝
		model.addAttribute("page_end", end);
		// 현재 페이지 번호
		model.addAttribute("now_page", page);
		// 이전
		model.addAttribute("prev", prev);
		// 다음
		model.addAttribute("next", next);

		// 비디오 게시판 정보를 가져온다.
		VideoBoardBean videoboardBean = videoboardService.getVideoBoardInfo(product_board_idx);
		model.addAttribute("videoboardBean", videoboardBean);
		
		List<VideoBean> list3 = videoboardService.top1_list(videoboardBean.getVideo_board_idx());
		model.addAttribute("list3", list3);
		return "product/board_product_list";

	}

	// 상품 등록
	@GetMapping("/product_write")
	public String product_write(@RequestParam Integer product_board_idx, @RequestParam(defaultValue = "1") Integer page,
			Model model) {
		// 게시판 번호를 request에 담는다
		model.addAttribute("product_board_idx", product_board_idx);
		model.addAttribute("now_page", page);

		return "product/product_write";
	}

	// 상품 등록 처리
	@PostMapping("/product_write_pro")
	public String product_write_pro(@ModelAttribute ProductBean bean1, Model model) {
//			System.out.println(bean1.getContent_subject());
//			System.out.println(bean1.getContent_text());
//			System.out.println(bean1.getContent_board_idx());

		// 업로드된 파일이 있을 경우에만 저장처리를 한다.
		if (bean1.getUpload_file().getSize() > 0) {
			String file_name = productboardService.saveUploadFile(bean1.getUpload_file());
			bean1.setProduct_file(file_name);
		} else {
			bean1.setProduct_file(null);
		}

		if (bean1.getUpload_file2().getSize() > 0) {
			String file_name2 = productboardService.saveUploadFile2(bean1.getUpload_file2());
			bean1.setProduct_file2(file_name2);
		} else {
			bean1.setProduct_file2(null);
		}

		System.out.println(bean1.getProduct_idx());

		// 페이징 구현을 위해 임시 글을 많이 넣는 코드
		// 주석처리 해주세요

		// String str1 = bean1.getContent_subject();
//			//for(int i = 0; i < 405; i++) {
//				//bean1.setContent_subject(str1 + i);
//				//boardService.addContentData(bean1);
//			}
		// 서비스의 메서드를 호출한다.
		productboardService.addProductData(bean1);

		System.out.println(bean1.getProduct_idx());

		model.addAttribute("msg", "작성되었습니다.");
		model.addAttribute("url", "product_read?product_notice_idx=" + bean1.getProduct_notice_idx() + "&product_idx="
				+ bean1.getProduct_idx());

		return "main/message";

	}

	@GetMapping("/product_modify")
	public String product_modify(@ModelAttribute ProductBean bean1, Model model) {

		// 상품 데이터 가져오기
		ProductBean readProductBean = productboardService.getProductData(bean1.getProduct_idx());

		model.addAttribute("readProductBean", readProductBean);
		model.addAttribute("product_board_idx", bean1.getProduct_notice_idx());
		return "product/product_modify";
	}

	@PostMapping("/product_modify_pro")
	public String product_modify_pro(@ModelAttribute ProductBean bean, Model model) {

		if (bean.getUpload_file().getSize() > 0) {
			String file_name = productboardService.saveUploadFile(bean.getUpload_file());
			bean.setProduct_file(file_name);
		} else {
			bean.setProduct_file(null);
		}

		if (bean.getUpload_file2().getSize() > 0) {
			String file_name2 = productboardService.saveUploadFile2(bean.getUpload_file2());
			bean.setProduct_file2(file_name2);
		} else {
			bean.setProduct_file2(null);
		}
		productboardService.modifyProduct(bean);

		model.addAttribute("msg", "수정되었습니다.");
		model.addAttribute("url", "product_read?product_idx=" + bean.getProduct_idx() + "&product_notice_idx="
				+ bean.getProduct_notice_idx());

		return "main/message";
	}

	@GetMapping("/product_delete")
	public String product_delete(@ModelAttribute ProductBean bean1, Model model) {
		// 서비스의 메서드를 호출
		productboardService.deleteProduct(bean1);

		model.addAttribute("msg", "삭제되었습니다");
		model.addAttribute("url", "board_product_list?product_board_idx=" + bean1.getProduct_notice_idx());

		return "main/message";
	}

	// 상품 상세정보
	@GetMapping("/product_read")
	public String product_read(@ModelAttribute ProductBean bean1, Model model) {

		// 상품 데이터를 가져온다.
		ProductBean readProductBean = productboardService.getProductData(bean1.getProduct_idx());

		model.addAttribute("readProductBean", readProductBean);
		model.addAttribute("product_board_idx", bean1.getProduct_notice_idx());

		return "product/product_read";
	}

	// 상품 장바구니 집어넣기
	@GetMapping("/product_cart_pro")
	public String product_cart_pro(@ModelAttribute CartBean bean1, Model model) {

		productboardService.addCartProductData(bean1);

		model.addAttribute("msg", "장바구니에 저장되었습니다.");
		model.addAttribute("url", "product_cart");
		return "main/message";
	}

	// 상품 장바구니
	@GetMapping("/product_cart")
	public String product_cart(@ModelAttribute CartBean bean1, Model model) {

		// 장바구니로 상품 가져오기
		List<CartBean> list1 = productboardService.getCartList();

		model.addAttribute("cart_list", list1);

		return "product/product_cart";
	}

	@GetMapping("/product_cart_delete")
	public String product_cart_delete(@ModelAttribute CartBean bean1, Model model) {

		productboardService.deleteCartProduct(bean1);

		model.addAttribute("msg", "삭제되었습니다.");
		model.addAttribute("url", "product_cart");

		return "main/message";
	}

	@GetMapping("/product_search_list_pro")
	public String product_search_list_pro(@RequestParam(defaultValue = "") String keyword, Model model) {
		// 게시판 정보 가져오기
		System.out.println(keyword);
		List<ProductBean> list1 = productboardService.getSerachList(keyword);

		System.out.println(list1);
		model.addAttribute("search_list", list1);

		return "product/board_product_search_list";

	}

	// 장바구니에서 체크한 상품 넘기기
	@PostMapping("/product_order_pro")
	public String product_order_pro(Model model, @RequestParam("buytemp_num") int buytemp_num,
			@RequestParam("buytemp_amount") int buytemp_amount,
			@RequestParam("buytemp_product_idx") int buytemp_product_idx, @ModelAttribute BuytempBean bean1) {

		productboardService.addBuytempData(bean1);

		model.addAttribute("msg", "체크한 상품을 구매합니다.");
		model.addAttribute("url", "product_order");
		return "main/message";
	}
	
	// 구매페이지에 있는 상품 넘기기
	@PostMapping("/product_payment_pro")
	public String product_payment_pro(Model model, @RequestParam("ordered_num") int ordered_num,
			@RequestParam("ordered_amunt") int ordered_amunt,
			@RequestParam("ordered_product_idx") int ordered_product_idx, 
			@RequestParam("ordered_date") String ordered_date,
			@ModelAttribute BuytempBean bean1) {

		productboardService.addBuytempData(bean1);

		model.addAttribute("msg", "결제 완료.");
		model.addAttribute("url", "product_cart");
		return "main/message";
	}

	// 구매페이지
	@GetMapping("/product_order")
	public String product_order(@ModelAttribute BuytempBean bean1, Model model) {

		List<BuytempBean> list1 = productboardService.getOrderList();


		model.addAttribute("buytemp_list", list1);

		System.out.println(list1);
		
		return "product/product_order";
	}

}
