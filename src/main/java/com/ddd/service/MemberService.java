package com.ddd.service;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;

public interface MemberService {

	//회원가입 
	public void insertMember (MemberVO vo, AuthVO ao) throws Exception;
	
//	// 비밀번호 찾기
//	public void findPw(MemberVO vo, HttpServletResponse response) throws Exception;
	
	// 이메일 발송
	public void sendEmail(MemberVO vo) throws Exception;
	
	//아이디 중복 체크 
	public int idCheck(String username) throws Exception;
		
	//휴대폰 중복 체크 
	public int emailCheck(String email) throws Exception;
}
