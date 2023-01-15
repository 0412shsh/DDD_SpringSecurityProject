package com.ddd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
