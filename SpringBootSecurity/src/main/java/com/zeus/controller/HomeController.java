package com.zeus.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("home: all access");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date); 
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}

	@RequestMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("accessError denied: " + auth);
		model.addAttribute("msg", "You do not have access to this page");
	}
}
