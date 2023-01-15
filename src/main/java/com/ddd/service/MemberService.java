package com.ddd.service;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;

public interface MemberService {

	//회원가입 
	public void insertMember (MemberVO vo, AuthVO ao) throws Exception;
	
	
}
