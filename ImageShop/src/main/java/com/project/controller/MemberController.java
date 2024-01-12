package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.domain.CodeLabelValue;
import com.project.domain.Member;
import com.project.service.CodeService;
import com.project.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/register")
	public void registerForm(Member member, Model model) throws Exception {
		String groupCode = "A00";
		List<CodeLabelValue> jobList = codeService.getCodeList(groupCode);
		model.addAttribute("jobList", jobList);
	}

	@PostMapping("/register")
	public String register(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr)
			throws Exception {
		if (result.hasErrors()) {
			String groupCode = "A00";
			List<CodeLabelValue> jobList = codeService.getCodeList(groupCode);
			model.addAttribute("jobList", jobList);
			return "user/register";
		}
		String inputPassword = member.getUserPw();
		member.setUserPw(passwordEncoder.encode(inputPassword));

		memberService.register(member);
		rttr.addFlashAttribute("userName", member.getUserName());
		return "redirect:user/registerSuccess";
	}

	@GetMapping("/registerSuccess")
	public void registerSuccess(Model model) throws Exception {
	}

	@GetMapping("/list")
	public void list(Model model) throws Exception {
		model.addAttribute("list", memberService.list());
	}

	@GetMapping("/read")
	public void read(int userNo, Model model) throws Exception {
		String groupCode = "A00";
		List<CodeLabelValue> jobList = codeService.getCodeList(groupCode);
		model.addAttribute("jobList", jobList);
		model.addAttribute(memberService.read(userNo));
	}

	@GetMapping("/modify")
	public void modifyForm(int userNo, Model model) throws Exception {
		String groupCode = "A00";
		List<CodeLabelValue> jobList = codeService.getCodeList(groupCode);
		model.addAttribute("jobList", jobList);
		model.addAttribute(memberService.read(userNo));
	}

	@PostMapping("/modify")
	public String modify(Member member, RedirectAttributes rttr) throws Exception {
		memberService.modify(member);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/list";
	}

	@PostMapping("/remove")
	public String remove(int userNo, RedirectAttributes rttr) throws Exception {
		memberService.remove(userNo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/list";
	}
	
	@PostMapping("/setup")
	public String setupAdmin(Member member, RedirectAttributes rttr) throws Exception {
		if(memberService.countAll() == 0) {
			String inputPassword = member.getUserPw();
			member.setUserPw(passwordEncoder.encode(inputPassword));
			
			member.setJob("00");
			
			memberService.setupAdmin(member);
			
			rttr.addFlashAttribute("userName", member.getUserName());
			return "redirect:/user/registerSuccess";
		}
		return "redirect:/user/setupFailure";
	}
	
	@GetMapping("/setup")
	public String setupAdminForm(Member member, Model model) throws Exception {
		if(memberService.countAll() == 0) {
			return "user/setup";
		}
		return "user/setupFailure";
	}
	
}
