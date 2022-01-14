package com.test.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.test.beans.AdminBean;
import com.test.beans.ContentBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBoardBean;
import com.test.db.VideoBoardDao;

@Service
public class VideoBoardService {

	@Autowired
	private VideoBoardDao videoboardDao;

	// 관리자 로그인 사용자 정보 객체 주입
	@Resource(name = "loginAdminBean")
	@Lazy
	private AdminBean loginAdminBean;

	// 영상 게시판 정보 가져오기
	public List<VideoBoardBean> getVideoBoardList() {

		List<VideoBoardBean> list1 = videoboardDao.getVideoBoardList();

		return list1;
	}

	// 영상 작성
	public void addVideoData(VideoBean bean1) {
		// 현재 로그인한 사용자의 번호를 담아준다.
		bean1.setVideo_writer_idx(loginAdminBean.getAdmin_idx());
		// 글을 저장하는 메서드를 호출한다.
		videoboardDao.addVideoData(bean1);
	}

	// 영상 하나 가져오기

	public VideoBean getVideoData(Integer video_idx) {

		// 서비스의 메서드를 호출한다.
		VideoBean bean1 = videoboardDao.getVideoData(video_idx);
		return bean1;
	}

	// 영상 정보 하나 가져오기
	public VideoBoardBean getVideoBoardInfo(Integer video_board_idx) {
		VideoBoardBean bean1 = videoboardDao.getVideoBoardInfo(video_board_idx);
		return bean1;
	}

	// 영상 리스트를 가져온다
	public List<VideoBean> getVideoList(Integer video_board_idx, Integer page) {
		// 페이징을 위한 값을 구한다.
		// 제외할 값
		Integer a1 = (page - 1) * 10;

		// dao의 메서드를 호출한다.
		List<VideoBean> list1 = videoboardDao.getVideoList(video_board_idx, a1);
		return list1;
	}

	// 영상 개수를 가져온다.
	public Integer get_video_count(Integer video_notice_idx) {
		Integer list_count = videoboardDao.get_video_count(video_notice_idx);
		return list_count;
	}

	// 영상을 삭제한다
	public void deleteVideo(VideoBean bean1) {
		// dao의 메서드를 호출한다.
		videoboardDao.deleteVideo(bean1);
	}

	// 영상을 수정한다.
	public void modifyVideo(VideoBean bean1) {
		// dao의 메서드를 호출한다

		videoboardDao.modifyVideo(bean1);
	}

	// 게시글 리스트를 가져온다
	public List<VideoBean> top5_list(Integer video_board_idx) {
		List<VideoBean> list1 = videoboardDao.top5_list(video_board_idx);
		return list1;
	}

	// 게시글 리스트를 가져온다
	public List<VideoBean> top1_list(Integer video_board_idx) {
		List<VideoBean> list1 = videoboardDao.top1_list(video_board_idx);
		return list1;
	}

}
