package com.zeus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@RequestMapping("/list")
	public void list() {
		log.info("notice list: all access");
	}
	
	@RequestMapping("/register")
	public void register() {
		log.info("notice registerForm: only members access");
	}
}
