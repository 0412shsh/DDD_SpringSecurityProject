package com.ddd.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddd.domain.AuthVO;
import com.ddd.domain.MemberVO;
import com.ddd.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {

	
	private static final Logger log = LoggerFactory.getLogger(SampeController.class);

	@Autowired
	private MemberService service;
	
	
	// 회원가입 GET - all 
	@GetMapping("/register")
	public void getRegister() {
		log.info("getRegister() 실행 ");
	}
	
	// 회원가입 POST
	@PostMapping("/register")
	public String postRegister(MemberVO vo, AuthVO ao) throws Exception {
		log.info("postRegister() 실행 ");
		service.insertMember(vo, ao);
		service.sendEmail(vo);
		log.info("컨트롤러 : 회원가입 완료 ~!!! ");
		return "redirect:/member/login";
	}
	
	// 로그인 GET -all
	@GetMapping("/login")
	public void getLogin(String error, String logout, Model model) {
		log.info("getLogin() 실행 ");
		log.info("error : "+error);
		log.info("logout : "+logout);
		
		if(error != null) {
			// 에러
			model.addAttribute("error","Login Error Check your account.");
			
		}
		if(logout != null) {
			model.addAttribute("logout","Logout!!");
		}
	}
	
	// 비밀번호 재발급 GET
//	@GetMapping("/findpw")
//	public void getFindPw() throws Exception {
//		log.info("getFindPw() 호출 - 비밀번호 재발급");
//	
//	}
	
//	// 비밀번호 재발급 POST
//	@PostMapping("/findpw")
//	public void postFindPw(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
//		log.info("postFindPw() 호출 - 비밀번호 재발급");
//		service.findPw(member, response);
//	
//	}
	
	// 아이디 중복체크
	@GetMapping("/idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) throws Exception {
		log.info("idCheck() 호출");
		int result = service.idCheck(userid);
		return result; 
	}
	
	// 이메일 중복체크
	@GetMapping("/emailcheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) throws Exception {
		log.info("emailCheck() 호출 ");
		int result = service.emailCheck(email);
		return result;
	}
	
	
}
