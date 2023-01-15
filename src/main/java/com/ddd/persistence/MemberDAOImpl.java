package com.ddd.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private static final String NAMESPACE = "com.ddd.mappers.MemberMapper";
	
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		log.info("DAO : insertMember(MemberVO vo) -- 회원가입 실행 "+ vo);
		
		sqlSession.insert(NAMESPACE+".insertMember", vo);
	}

	// 권한 삽입
	@Override
	public void insertAuth(AuthVO ao) throws Exception {
		log.info("DAO : insertAuth(AuthVO ao) -- 회원가입 실행 ");
		sqlSession.insert(NAMESPACE+".insertAuth", ao);
	}
	
	

	
	
}
