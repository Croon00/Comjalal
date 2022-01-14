package com.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.beans.BoardBean;
import com.test.beans.ContentBean;
import com.test.beans.ProductBean;
import com.test.beans.ProductBoardBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBoardBean;
import com.test.service.BoardService;
import com.test.service.ProductBoardService;
import com.test.service.VideoBoardService;

@Controller
public class MainController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private VideoBoardService videoboardService;

	@Autowired
	private ProductBoardService productboardService;

	// main
	@GetMapping("/main")
	public String main(Model model) {

		// 게시판 정보를 가져온다.
		List<BoardBean> board_list = new ArrayList<BoardBean>();
		board_list.add(boardService.getBoardInfo(2));
		board_list.add(boardService.getBoardInfo(3));

		model.addAttribute("board_list", board_list);

		// 상위 5개의 데이터를 담을 Map
		HashMap<String, List<ContentBean>> map1 = new HashMap<String, List<ContentBean>>();

		// 2과 3의 게시판만큼 반복한다.
		for (BoardBean bean1 : board_list) {
			// 상위 5개를 가져온다.
			if (bean1.getBoard_idx() == 2 || bean1.getBoard_idx() == 3) {
				List<ContentBean> list1 = boardService.top5_list(bean1.getBoard_idx());
				// 해시맵에 담는다.
				map1.put(bean1.getBoard_name(), list1);
			}
		}

		model.addAttribute("top5_map", map1);

		// 비디오 게시판 정보를 가져온다.
		VideoBoardBean videoboardBean = videoboardService.getVideoBoardInfo(0);
		model.addAttribute("videoboardBean", videoboardBean);

		// 게시판의 수 반복한다.
		// 상위 5개를 가져온다.
		List<VideoBean> list2 = videoboardService.top5_list(videoboardBean.getVideo_board_idx());
		// 해시맵에 담는다.

		List<VideoBean> list3 = videoboardService.top1_list(videoboardBean.getVideo_board_idx());

		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);

		
		
		// 상품 게시판 정보를 가져온다.
		List<ProductBoardBean> product_board_list = new ArrayList<ProductBoardBean>();
		product_board_list.add(productboardService.getProductBoardInfo(1));
		product_board_list.add(productboardService.getProductBoardInfo(3));
		product_board_list.add(productboardService.getProductBoardInfo(10));
		product_board_list.add(productboardService.getProductBoardInfo(5));
		product_board_list.add(productboardService.getProductBoardInfo(9));

		model.addAttribute("product_board_list", product_board_list);

		// 상위 5개의 데이터를 담을 Map
		HashMap<String, List<ProductBean>> map2 = new HashMap<String, List<ProductBean>>();

		// 2과 3의 게시판만큼 반복한다.
		for (ProductBoardBean bean2 : product_board_list) {
			// 상위 5개를 가져온다.
			if (bean2.getProduct_board_idx() == 1 || bean2.getProduct_board_idx() == 3 || bean2.getProduct_board_idx() == 10
				|| bean2.getProduct_board_idx() == 5 || bean2.getProduct_board_idx() == 9) {
				List<ProductBean> list4 = productboardService.top3_list(bean2.getProduct_board_idx());
				// 해시맵에 담는다.
				map2.put(bean2.getProduct_board_name(), list4);
			}
		}

		model.addAttribute("top3_map", map2);

		return "main/main";
	}

}
