package com.test.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.beans.BoardBean;
import com.test.beans.ContentBean;
import com.test.beans.UserBean;
import com.test.db.BoardDao;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	// 로그인 사용자 정보 객체를 주입받음
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	// 업로드될 파일이 저장될 경로를 주입받는다.
	@Value("${path.upload}")
	private String upload_path;

	// 게시판 정보 가져오기
	public List<BoardBean> getBoardList() {

		List<BoardBean> list1 = boardDao.getBoardList();

		return list1;
	}

	// 게시판 정보 하나를 가져오기
	public BoardBean getBoardInfo(Integer board_idx) {
		// dao의 메서드를 호출한다.
		BoardBean bean1 = boardDao.getBoardInfo(board_idx);
		return bean1;
	}

	// 글 작성
	public void addContentData(ContentBean bean1) {
		// 현재 로그인한 사용자의 번호를 담아준다.
		bean1.setContent_writer_idx(loginUserBean.getUser_idx());
		// 글을 저장하는 메서드를 호출한다.
		boardDao.addContentData(bean1);
	}

	// 업로드된 파일 데이터를 저장한다.
	public String saveUploadFile(MultipartFile upload_file) {
		// 서버에 저장될 파일 이름
		// 현재 시간 + 원본파일이름
		String file_name = System.currentTimeMillis() + "-" + upload_file.getOriginalFilename();

		// 저장한다.
		try {
			upload_file.transferTo(new File(upload_path + "/" + file_name));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}

	// 게시글 정보 하나를 확인
	// 게시글 하나를 가져온다.
	public ContentBean getContentData(Integer content_idx) {

		// 서비스의 메서드를 호출한다.
		ContentBean bean1 = boardDao.getContentData(content_idx);
		return bean1;
	}

	// 게시글 리스트를 가져온다
	public List<ContentBean> getContentList(Integer board_idx, Integer page) {
		// 페이징을 위한 값을 구한다.
		// 제외할 값
		Integer a1 = (page - 1) * 10;

		// dao의 메서드를 호출한다.
		List<ContentBean> list1 = boardDao.getContentList(board_idx, a1);
		return list1;
	}

	// 게시글 개수를 가져온다.
	public Integer get_content_count(Integer content_board_idx) {
		Integer list_count = boardDao.get_content_count(content_board_idx);
		return list_count;
	}

	// 게시글을 삭제한다
	public void deleteContent(ContentBean bean1) {
		// dao의 메서드를 호출한다.
		boardDao.deleteContent(bean1);
	}

	// 답변 글을 작성한다.
	public void modifyReply(ContentBean bean1) {
		// dao의 메서드를 호출한다
		boardDao.modifyReply(bean1);
	}

	// 게시글을 수정한다.
	public void modifyContent(ContentBean bean1) {
		// dao의 메서드를 호출한다
		boardDao.modifyContent(bean1);
	}

	// 메인페이지를 위한 게시글 리스트를 가져온다
	public List<ContentBean> top5_list(Integer board_idx) {
		List<ContentBean> list1 = boardDao.top5_list(board_idx);
		return list1;
	}
}
