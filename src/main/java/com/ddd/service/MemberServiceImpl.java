package com.ddd.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;
import com.ddd.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo, AuthVO ao) throws Exception {
		log.info("서비스 : insertMember(vo,ao) 호출 !! ");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		vo.setUserpw(passwordEncoder.encode(vo.getUserpw()));
		dao.insertMember(vo);
		
		ao.setUserid(vo.getUserid());
		ao.setAuth("ROLE_MEMBER");
		log.info("서비스 : 권한 설정 내역 ---"+ao.getAuth()+ "/////" + ao.getUserid());
		dao.insertAuth(ao);
	}

	
}
