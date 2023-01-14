package com.ddd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample/*")
@Controller
public class SampeController {

	private static final Logger log = LoggerFactory.getLogger(SampeController.class);
	
	@GetMapping("/all")
	public void getAll() {
		log.info("getAll() 실행 - 모든 사람 접근");
	}
	
	@GetMapping("/member")
	public void getMember() {
		log.info("getMember() 실행 - 회원만 접근");
	}
	
	@GetMapping("/admin")
	public void getAdmin() {
		log.info("getAdmin() 실행 - 관리자만 접근");
	}
}
