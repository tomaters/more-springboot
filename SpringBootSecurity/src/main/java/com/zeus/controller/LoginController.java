package com.zeus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class LoginController {

	@RequestMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
		model.addAttribute("error", "Login error");
		}
		if (logout != null) {
		model.addAttribute("logout", "Log out");
		}
		return "loginForm";
		}
	
	@RequestMapping("/logout")
	public String logoutForm() {
		log.info("logoutForm");
		return "logoutForm";
	}
}
