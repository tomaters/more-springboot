package com.zeus.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/list")
	public void list() {
		log.info("board list: all access");
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("/register")
	public void register() {
		log.info("board registerForm: only members access");
	}
	
	@PreAuthorize("isAuthenticated()") 
	@RequestMapping("/read")
	public void read() {
		log.info("read: only authorized can access");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@RequestMapping("/modify")
	public void modifyForm() {
		log.info("modifyForm: only members or admin can access");
	}
}
