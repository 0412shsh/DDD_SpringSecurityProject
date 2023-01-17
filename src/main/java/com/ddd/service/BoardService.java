package com.ddd.service;

import java.util.List;

import com.ddd.domain.CommunityBoardVO;
import com.ddd.domain.DiaryBoardVO;

public interface BoardService {

	// 커뮤니티 글 작성 
	public void insert(CommunityBoardVO vo) throws Exception;
	
	
	// 다이어리 글 작성
	public void insertD(DiaryBoardVO vo) throws Exception;
	
	// 다이어리 글 목록
	public List<DiaryBoardVO> getListD(String userid) throws Exception;
	
	// 다이어리 글 개수
	public int total(String userid) throws Exception;
	
	// 다이어리 글 상세
	public DiaryBoardVO readD(Integer dno) throws Exception;
	
	// 다이어리 글 수정 
	public int updateD(DiaryBoardVO vo) throws Exception;
	
	// 다이어리 글 삭제
	public int deleteD(int dno) throws Exception;
	
	// 메인 게시글 3개 
	public List<DiaryBoardVO> getRecent(String userid) throws Exception;
	
}
