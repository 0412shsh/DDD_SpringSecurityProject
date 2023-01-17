package com.ddd.persistence;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;

public interface MemberDAO {

	
	
	//회원가입 - tbl_member
	public void insertMember (MemberVO vo) throws Exception;
	
	//회원가입 - tbl_member_auth
	public void insertAuth(AuthVO ao) throws Exception;

	//비밀번호 재발급 - 회원정보 조회
	public MemberVO readMember(String userid) throws Exception;
	
	//아이디 체크 
	public int idCheck(String user_id) throws Exception;
	
	//비밀번호 변경
//	public int updatePw(MemberVO vo) throws Exception;
	
	//휴대폰 중복 체크 
	public int emailCheck(String email) throws Exception;
	
	
}