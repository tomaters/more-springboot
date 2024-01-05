package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CodeGroup;
import com.project.service.CodeGroupService;

@Controller
@RequestMapping("/codeGroup")
public class CodeGroupController {
	
	@Autowired
	private CodeGroupService service;

	@GetMapping("/register")
	public void registerForm(Model model) throws Exception {
		CodeGroup codeGroup = new CodeGroup();
		model.addAttribute(codeGroup);
	}
	
	@PostMapping("/register")
	public String register(CodeGroup codeGroup, RedirectAttributes rttr) throws Exception {
		service.register(codeGroup);
		// refer to script in list.jsp -> alert is sent if SUCCESS is passed down
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/codeGroup/list";
	}
	
	@GetMapping("/list")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}
	
	@GetMapping("/read")
	public void read(String groupCode, Model model) throws Exception {
		model.addAttribute(service.read(groupCode));
	}
}
