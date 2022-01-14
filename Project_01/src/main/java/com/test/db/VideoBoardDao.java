package com.test.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.ContentBean;
import com.test.beans.VideoBean;
import com.test.beans.VideoBoardBean;

@Repository
public class VideoBoardDao {

	@Autowired
	private SqlSessionTemplate tmp;
	
	// 영상 게시판 정보 가져오기
	public List<VideoBoardBean> getVideoBoardList(){
		// 쿼리 실행
		List<VideoBoardBean> list1 = tmp.selectOne("video_board_db.select_board_info");
		
		return list1;
	}
	
	// 영상 게시글 저장하기
	public void addVideoData(VideoBean bean1) {
		// 쿼리 실행
		tmp.insert("video_board_db.add_video_data", bean1);
		
	}
	
	// 영상 게시글 하나 가져오기
	public VideoBean getVideoData(Integer video_idx) {
		// 쿼리 실행
		VideoBean bean1 = tmp.selectOne("video_board_db.select_video_info", video_idx);
		return bean1;
	}
	
	// 영상 게시판 정보 하나 가져오기
	public VideoBoardBean getVideoBoardInfo(Integer video_board_idx) {
		// dao의 메서드를 호출한다
		VideoBoardBean bean1 = tmp.selectOne("video_board_db.get_video_board_info", video_board_idx);
		return bean1;
	}
	
	// 영상 리스트 가져오기
	public List<VideoBean> getVideoList(Integer video_board_idx, Integer a1){
		// 페이징을 위한 정보를 가지고 있는 객체
		// (몇개를 건너 띄고 몇 개 가져오기)
		RowBounds bounds = new RowBounds(a1, 10);
		// 쿼리 실행
		List<VideoBean> list1 = tmp.selectList("video_board_db.get_video_list", video_board_idx, bounds);
		return list1;
	}
	
	// 영상 삭제
	public void deleteVideo(VideoBean bean1) {
		
		tmp.delete("video_board_db.delete_video", bean1);
	}
	
	// 영상 수정
	public void modifyVideo(VideoBean bean1) {
		tmp.update("video_board_db.update_video_info", bean1);
	}
	
	// 영상 개수 가져오기
	public Integer get_video_count(Integer video_index_idx) {
		// 가져오기
		Integer list_count = tmp.selectOne("video_board_db.get_video_count", video_index_idx);
		
		return list_count;
	}
	
	// 메인 페이지 구성을 위해 상위 5개만 가져온다.
	public List<VideoBean> top5_list(Integer video_board_idx){

		RowBounds bounds = new RowBounds(0, 5);
		// 쿼리실행
		List<VideoBean> list1 = tmp.selectList("video_board_db.get_video_list", video_board_idx, bounds);
		return list1;
	}
	
	// 메인 페이지 구성을 위해 상위 5개만 가져온다.
		public List<VideoBean> top1_list(Integer video_board_idx){

			RowBounds bounds = new RowBounds(0, 1);
			// 쿼리실행
			List<VideoBean> list1 = tmp.selectList("video_board_db.get_video_list", video_board_idx, bounds);
			return list1;
		}
}
