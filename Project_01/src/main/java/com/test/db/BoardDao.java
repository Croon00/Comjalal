package com.test.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.BoardBean;
import com.test.beans.ContentBean;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate tmp;

	// 게시판 정보 가져오기
	public List<BoardBean> getBoardList() {
		// 쿼리를 실행한다.
		List<BoardBean> list1 = tmp.selectList("board_db.select_board_info");

		return list1;
	}

	// 게시판 정보 하나 가져오기
	public BoardBean getBoardInfo(Integer board_idx) {
		// dao의 메서드를 호출한다.
		BoardBean bean1 = tmp.selectOne("board_db.get_board_info", board_idx);
		return bean1;
	}

	// 게시글을 저장한다.
	public void addContentData(ContentBean bean1) {
		// 쿼리 실행
		tmp.insert("board_db.add_content_data", bean1);
	}

	// 게시글 하나를 가져온다
	public ContentBean getContentData(Integer content_idx) {
		// 쿼리 실행
		ContentBean bean1 = tmp.selectOne("board_db.select_content_info", content_idx);
		return bean1;
	}

	// 게시글 리스트를 가져온다
	public List<ContentBean> getContentList(Integer board_idx, Integer a1) {
		// 페이징을 위한 정보를 가지고 있는 객체
		// (몇개를 건너띄고, 몇개를 가져와라)
		RowBounds bounds = new RowBounds(a1, 10);
		// 쿼리실행
		List<ContentBean> list1 = tmp.selectList("board_db.get_content_list", board_idx, bounds);
		return list1;
	}

	// 게시글 삭제한다.
	public void deleteContent(ContentBean bean1) {
		// 삭제
		tmp.delete("board_db.delete_content", bean1);
	}

	// 게시글을 수정한다.
	public void modifyContent(ContentBean bean1) {
		tmp.update("board_db.update_content_info", bean1);
	}

	// 답변 부분을 수정한다
	public void modifyReply(ContentBean bean1) {
		tmp.update("board_db.update_content_reply", bean1);
	}

	// 게시글의 개수를 가져온다.
	public Integer get_content_count(Integer content_board_idx) {
		// 가져온다.
		Integer list_count = tmp.selectOne("board_db.get_content_count", content_board_idx);

		return list_count;
	}

	// 메인 페이지 구성을 위해 상위 5개만 가져온다.
	public List<ContentBean> top5_list(Integer board_idx) {

		RowBounds bounds = new RowBounds(0, 5);
		// 쿼리실행
		List<ContentBean> list1 = tmp.selectList("board_db.get_content_list", board_idx, bounds);
		return list1;
	}
}
