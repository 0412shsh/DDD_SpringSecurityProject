package com.ddd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddd.domain.CommunityBoardVO;
import com.ddd.domain.DiaryBoardVO;
import com.ddd.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{


	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	private BoardDAO dao;

	// 커뮤니티 글 작성
	@Override
	public void insert(CommunityBoardVO vo) throws Exception {
		log.info("서비스 : insert(CommunityBoardVO vo) -- 커뮤니티 글 작성 호출");
		dao.insert(vo);
	}

	
	// 다이어리 글 작성 
	@Override
	public void insertD(DiaryBoardVO vo) throws Exception {
		log.info("서비스 : insertD(DiaryBoardVO vo) -- 다이어리 글 작성 호출");
		dao.insertD(vo);
	}

	// 다이어리 글 목록
	@Override
	public List<DiaryBoardVO> getListD(String userid) throws Exception {

		List<DiaryBoardVO> boardList = dao.getListD(userid);
		
		return boardList;
	}


	// 다이어리 글 개수
	@Override
	public int total(String userid) throws Exception {
		
		int total = dao.total(userid);
		return total;
	}

	// 다이어리 글 상세
	@Override
	public DiaryBoardVO readD(Integer dno) throws Exception {

		DiaryBoardVO readList = dao.readD(dno);
		
		return readList;
	}

	// 다이어리 글 수정 
	@Override
	public int updateD(DiaryBoardVO vo) throws Exception {
		log.info("Service : updateD(DiaryBoardVO vo) 호출");
		int cnt = dao.updateD(vo);
		return 0;
	}

	// 다이어리 글 삭제
	@Override
	public int deleteD(int dno) throws Exception {
		int cnt = dao.deleteD(dno);
		return 0;
	}

	// 메인 게시글 3개 
	@Override
	public List<DiaryBoardVO> getRecent(String userid) throws Exception {
		List<DiaryBoardVO> recentList = dao.getRecent(userid);
		
		return recentList;
	}
	
	
	
	
	
	
	
	

}
