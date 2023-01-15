package com.ddd.persistence;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;

public interface MemberDAO {

	
	
	//회원가입 - tbl_member
	public void insertMember (MemberVO vo) throws Exception;
	
	//회원가입 - tbl_member_auth
	public void insertAuth(AuthVO ao) throws Exception;
	
}
