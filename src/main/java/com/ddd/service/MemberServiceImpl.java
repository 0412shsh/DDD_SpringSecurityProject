package com.ddd.service;

import java.io.PrintWriter;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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

//	// 비밀번호 찾기
//	@Override
//	public void findPw(MemberVO vo,HttpServletResponse response) throws Exception {
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		MemberVO ck =dao.readMember(vo.getUserid());
//		log.info("회원정보조회 결과 : "+ck);
//		
//		
//		// 가입된 아이디가 없을 경우
//		if(dao.idCheck(vo.getUserid()) == 0) {
//			log.info("DAO : idCheck(userid) 체크 실행");
//			out.print("아이디가 존재하지 않습니다.");
//			out.close();
//		}
//		else if(!vo.getEmail().equals(ck.getEmail())) {
//			log.info("D : 이메일 존재 체크 실행");
//			out.print("등록되지 않은 이메일입니다.");
//			out.close();
//		}
//		else {
//			String pw="";
//			for(int i=0; i<12; i++) {
//				pw += (char)((Math.random()*26)+97);
//			}
//			
//			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//			vo.setUserpw(passwordEncoder.encode(pw));
//			dao.updatePw(vo);
//			
//			// 비밀번호 재발급 메일 발송
//			sendEmail(vo,"findpw");
//			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
//			out.close();
//		}
//		
//	}
	
	
	
	// 이메일 발송
	@Override
	public void sendEmail(MemberVO vo) throws Exception {
		// Mail 서버 설정 
		String charSet = "utf-8";
		String hostSMTP ="smtp.naver.com";
		String hostSMTPid = "0412corn@naver.com";
		String hostSMTPpwd = "lovessh0412";
		
		//보내는 사람 Email, 제목, 내용 
		String fromEmail = "0412corn@naver.com";
		String fromName = "DearDiary:D";
		String subject ="";
		String msg ="";
		
			subject = "💖DearDiary:D -- 회원가입을 축하합니다..💖";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: black;'>";
			msg += "🎂"+vo.getUserid() + "님의 회원가입을 축하합니다.🎂</h3>";
			msg += "<h3 style='color: black;'>";
			msg += "DDD와 함께 해주셔서 감사합니다. 당신의 소중한 순간을 DDD에 남겨보시길 바랍니다.</h3>";
//			msg += "<p>임시 비밀번호 : ";
//			msg += vo.getUserpw() + "</p></div>";
			
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			
			
			log.info("S : 임시비밀번호 전송 성공 @@@@@@@@ ");
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(String username) throws Exception {
		return dao.idCheck(username);
	}
	// 이메일 중복 체크
	@Override
	public int emailCheck(String email) throws Exception {
		return dao.emailCheck(email);
	}
	
	

}
