package com.ddd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied :: "+auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/logout")
	public void loggoutGet() {
		log.info("loggoutGet() - 로그아웃 실행");
		
	}
}
