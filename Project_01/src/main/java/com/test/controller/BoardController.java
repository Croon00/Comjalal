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

import com.test.beans.BoardBean;
import com.test.beans.ContentBean;
import com.test.beans.UserBean;
import com.test.service.BoardService;

@Controller
public class BoardController {
	
	// 서비스 주입
	@Autowired
	private BoardService boardService;
	
	// 로그인 사용자 정보 객체 주입
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	// 게시글 리스트
		@GetMapping("/board_list")
		public String board_list(@RequestParam Integer board_idx,
								 @RequestParam(defaultValue= "1") Integer page,
								 Model model){
			// 전체 페이지의 개수를 구한다.
			// 글의 개수를 가져온다.
			int list_count = boardService.get_content_count(board_idx);
					
			int page_count = list_count / 10;
					
			if(list_count % 10 > 0) {
				page_count ++;
			}
			
			// 파라미터로 전달된 페이지 번호가 전체 페이지 수 보다 클 경우
			if(page > page_count) {
				page = page_count;
			}
			
			if(page < 1) {
				page = 1;
			}
			
			// 게시판 정보를 가져온다
			BoardBean boardBean = boardService.getBoardInfo(board_idx);
			model.addAttribute("boardBean", boardBean);
			
			// 게시글 리스트를 가져온다.
			List<ContentBean> list1 = boardService.getContentList(board_idx, page);
			model.addAttribute("content_list", list1);
			
			// 게시판 번호를 request에 담아준다.
			model.addAttribute("board_idx", board_idx);
			
			// 하단부 페이지 번호표쇠(pageination)을 구성하기 위한 값
			// 시작
			int start = ((page - 1)/ 10 * 10) + 1;
			int end = start + 9;
			
			
			
			// end 값이 page_count보다 크면 page_count로 셋팅한다.
			if(end > page_count) {
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
			
			return "board/board_list";	
		}
	
	
	@GetMapping("/board_read")
		public String board_read(@ModelAttribute ContentBean bean1, Model model) {
			
			// 게시글 데이터를 가져온다.
			ContentBean readContentBean = boardService.getContentData(bean1.getContent_idx());
			
			model.addAttribute("readContentBean", readContentBean);
			model.addAttribute("board_idx", bean1.getContent_board_idx());
			
			// 로그인한 사용자 정보를 담는다.
			model.addAttribute("loginUserBean", loginUserBean);
			
			return "board/board_read";
	}
	
		// 게시글 수정하기
		@GetMapping("/board_modify")
		public String board_modify(@ModelAttribute ContentBean bean1, Model model) {
			
			// 게시글 데이터를 가져온다.
			ContentBean readContentBean = boardService.getContentData(bean1.getContent_idx());
			
			model.addAttribute("readContentBean", readContentBean);
			model.addAttribute("board_idx", bean1.getContent_board_idx());
			
			return "board/board_modify";
		}
		
		//답변글 작성하기
		@GetMapping("/board_reply")
		public String board_reply(@ModelAttribute ContentBean bean1, Model model) {
			
			// 게시글 데이터 가져오기
			ContentBean readContentBean = boardService.getContentData(bean1.getContent_idx());
			
			model.addAttribute("readContentBean", readContentBean);
			model.addAttribute("board_idx", bean1.getContent_board_idx());
			
			return "board/board_reply";
		}
		
		// 글쓰기
		@GetMapping("/board_write")
		public String board_write(@RequestParam Integer board_idx,
								  @RequestParam(defaultValue = "1") Integer page,
									Model model) {
			
			// 게시판 번호를 request에 담는다
			model.addAttribute("board_idx", board_idx);
			model.addAttribute("now_page", page);
			
			return "board/board_write";
		}
		
		// 글쓰기 처리
		@PostMapping("/board_write_pro")
		public String board_write_pro(@ModelAttribute ContentBean bean1,
									   Model model) {
			
			// 업로드된 파일이 있을 경우에만 저장처리를 한다.
			if(bean1.getUpload_file().getSize() > 0) {
				String file_name = boardService.saveUploadFile(bean1.getUpload_file());
				bean1.setContent_file(file_name);
			} else {
				bean1.setContent_file(null);
			}
						
			// 서비스의 메서드를 호출한다.
			boardService.addContentData(bean1);
			
			System.out.println(bean1.getContent_idx());
			
			model.addAttribute("msg", "작성되었습니다.");
			model.addAttribute("url", "board_read?content_board_idx=" + bean1.getContent_board_idx()
										+ "&content_idx=" + bean1.getContent_idx());
			
			return "main/message";
			
		}
		
		// 답변 내용 처리
		@PostMapping("/board_reply_pro")
		public String board_reply_pro(@ModelAttribute ContentBean bean,
									   Model model) {
			
			// 서비스의 메서드를 호출한다.
			boardService.modifyReply(bean);
					
			model.addAttribute("msg", "답변 작성되었습니다..");
			model.addAttribute("url","board_read?content_idx=" + bean.getContent_idx() + "&content_board_idx=" + bean.getContent_board_idx());
			
			return "main/message";
			
		}
		
		@GetMapping("/board_delete")
		public String board_delete(@ModelAttribute ContentBean bean1, Model model) {
			// 서비스의 메서드를 호출한다.
			boardService.deleteContent(bean1);
			
			model.addAttribute("msg", "삭제되었습니다");
			model.addAttribute("url", "board_list?board_idx=" + bean1.getContent_board_idx());
			
			return "main/message";
		}
		
		// 글 수정 처리 페이지
		@PostMapping("/board_modify_pro")
		public String board_modify_pro(@ModelAttribute ContentBean bean, Model model) {
			
			// 업로드된 파일이 있을 경우에만 저장처리를 한다.
			if(bean.getUpload_file().getSize() > 0) {
				String file_name = boardService.saveUploadFile(bean.getUpload_file());
				bean.setContent_file(file_name);
			} else {
				bean.setContent_file(null);
			}
			boardService.modifyContent(bean);
			
			model.addAttribute("msg", "수정되었습니다");
			model.addAttribute("url","board_read?content_idx=" + bean.getContent_idx() + "&content_board_idx=" + bean.getContent_board_idx());
			
			return "main/message";
		}
}
