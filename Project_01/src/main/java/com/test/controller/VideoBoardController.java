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
import com.test.beans.ContentBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBoardBean;
import com.test.service.ProductBoardService;
import com.test.service.VideoBoardService;

@Controller
public class VideoBoardController {
	
	// 서비스 주입
	@Autowired
	private VideoBoardService videoboardService;
	
	// 관리자 로그인 사용자 정보 객체 주입
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;
	
	@GetMapping("/video_board_list")
	public String video_board_list(@RequestParam Integer video_board_idx,
								   @RequestParam(defaultValue= "1") Integer page,
								   Model model) {
		
		// 전체 페이지의 개수를 구한다.
		// 영상 개수를 가져온다.
		int list_count = videoboardService.get_video_count(video_board_idx);
				
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
				
		VideoBoardBean videoboardBean = videoboardService.getVideoBoardInfo(video_board_idx);
		model.addAttribute("videoboardBean", videoboardBean);
		
		// 영상 게시글 리스트 가져오기
		List<VideoBean> list1 = videoboardService.getVideoList(video_board_idx, page);
		model.addAttribute("video_list", list1);
		
		// 영상 번호를 request에 담아준다.
		model.addAttribute("video_board_idx", video_board_idx);
		
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
				
		return"video/video_board_list";
	}
	
	@GetMapping("/video_board_list_base")
	public String video_board_list() {
		
		return"video/video_board_list_base";
	}
	
	// 영상 올리기
		@GetMapping("/video_board_write")
		public String video_board_write(@RequestParam(defaultValue = "1") Integer page,
									Model model) {
			
			// 게시판 번호를 request에 담는다
			model.addAttribute("now_page", page);
			
			return "video/video_board_write";
		}
	
		
		// 영상 올리기 처리
		@PostMapping("/video_write_pro")
		public String video_write_pro(@ModelAttribute VideoBean bean1,
									   Model model) {
//			System.out.println(bean1.getContent_subject());
//			System.out.println(bean1.getContent_text());
//			System.out.println(bean1.getContent_board_idx());
			
			
			
			
			// 페이징 구현을 위해 임시 글을 많이 넣는 코드
			// 주석처리 해주세요
			
			//String str1 = bean1.getContent_subject();
//			//for(int i = 0; i < 405; i++) {
//				//bean1.setContent_subject(str1 + i);
//				//boardService.addContentData(bean1);
//			}
			// 서비스의 메서드를 호출한다.
			videoboardService.addVideoData(bean1);
			
			System.out.println(bean1.getVideo_idx());
			
			model.addAttribute("msg", "작성되었습니다.");
			model.addAttribute("url", "video_board_list_base");
			
			return "main/message";
			
		}	
		
		// 영상 삭제하기
		@GetMapping("/video_board_delete")
		public String board_delete(@ModelAttribute VideoBean bean1, Model model) {
			// 서비스의 메서드를 호출한다.
			videoboardService.deleteVideo(bean1);
			
			model.addAttribute("msg", "삭제되었습니다");
			model.addAttribute("url", "video_board_list_base");
			
			return "main/message";
		}
		
		// 영상 수정하기
		@GetMapping("video_board_modify")
		public String video_board_modify(@ModelAttribute VideoBean bean1, Model model) {
			
			// 영상 데이터를 가져온다
			VideoBean readVideoBean = videoboardService.getVideoData(bean1.getVideo_idx());
			
			model.addAttribute("readVideoBean", readVideoBean);
			model.addAttribute("video_idx", bean1.getVideo_idx());
			
			return "video/video_board_modify";
			
		}
		
		// 영상 수정 처리 페이지
		@PostMapping("/video_modify_pro")
		public String video_modify_pro(@ModelAttribute VideoBean bean, Model model) {
			System.out.println(bean.getVideo_notice_idx());

			videoboardService.modifyVideo(bean);
			
			System.out.println(bean.getVideo_notice_idx());
			model.addAttribute("msg", "수정되었습니다");
			model.addAttribute("url","video_board_list_base");
			
			return "main/message";
		}
}

