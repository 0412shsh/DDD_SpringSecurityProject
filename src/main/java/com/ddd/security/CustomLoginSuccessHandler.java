package com.ddd.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{


	private static final Logger log = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
			log.info("로그인 성공");
			
			List<String> roleNames = new ArrayList<>();
			
			auth.getAuthorities().forEach(authority -> {
				
				roleNames.add(authority.getAuthority());
				
			});
			
			
			log.info("Role Names : " + roleNames);
			
			if(roleNames.contains("ROLE_ADMIN")) {
				response.sendRedirect("/");
				return;
			}
			
			if(roleNames.contains("ROLE_MEMBER")) {
				response.sendRedirect("/");
				return;
			}
			
			response.sendRedirect("/");
			
	}
	
	

}
