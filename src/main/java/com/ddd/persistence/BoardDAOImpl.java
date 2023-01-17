package com.ddd.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddd.domain.CommunityBoardVO;
import com.ddd.domain.DiaryBoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.ddd.mappers.BoardMapper";
	
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);

	// 커뮤니티 글 작성
	@Override
	public void insert(CommunityBoardVO vo) throws Exception {
		log.info("DAO : insert(CommunityBoardVO vo) -- 커뮤니티 글작성 실행 "+ vo);
				
		sqlSession.insert(NAMESPACE+".insert", vo);
	}
	// 다이어리 글 작성
	@Override
	public void insertD(DiaryBoardVO vo) throws Exception {
		log.info("insertD(DiaryBoardVO vo) -- 다이어리 글작성 실행 "+ vo);
		
		sqlSession.insert(NAMESPACE+".insertD", vo);
	}
	
	// 다이어리 글 목록 
	@Override
	public List<DiaryBoardVO> getListD(String userid) throws Exception {
		log.info("getListD(String userid) -- 다이어리 목록 실행 "+ userid +"@@@@@@@");
		
		List<DiaryBoardVO> boardList = sqlSession.selectList(NAMESPACE+".listD",userid);
		
		return boardList;
	}
	
	
	// 다이어리 글 개수
	@Override
	public int total(String userid) throws Exception {
		log.info("total(String userid) -- 다이어리 글 개수 실행 "+ userid +"@@@@@@@");
	
		int total = sqlSession.selectOne(NAMESPACE+".totalD",userid);
		
		return total;
	}
	
	
	// 다이어리 글 상세
	@Override
	public DiaryBoardVO readD(Integer dno) throws Exception {

		return sqlSession.selectOne(NAMESPACE+".readD",dno);
	}
	
	
	// 다이어리 글 수정 
	@Override
	public int updateD(DiaryBoardVO vo) throws Exception {
		log.info("DAO : updateD(DiaryBoardVO vo) 호출");
		int cnt = sqlSession.update(NAMESPACE+".updateD",vo);
		
		return 0;
	}
	
	
	// 다이어리 글 삭제 
	@Override
	public int deleteD(int dno) throws Exception {
		log.info("deleteD(int dno) 호출");
		int cnt = sqlSession.delete(NAMESPACE+".deleteD",dno);
		return 0;
		
	}
	
	// 메인 게시글 3개 
	@Override
	public List<DiaryBoardVO> getRecent(String userid) throws Exception {

		List<DiaryBoardVO> recentList = sqlSession.selectList(NAMESPACE+".recentD",userid);
		
		return recentList;
	}
	
	
	
	
	
}
