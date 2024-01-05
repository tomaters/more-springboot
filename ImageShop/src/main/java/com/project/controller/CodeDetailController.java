package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.domain.CodeLabelValue;
import com.project.domain.CodeDetail;
import com.project.service.CodeDetailService;
import com.project.service.CodeService;

@Controller
@RequestMapping("/codeDetail")
public class CodeDetailController {
	
	@Autowired
	private CodeDetailService codeDetailService;
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("/register")
	public void registerForm(Model model) throws Exception {
		CodeDetail codeDetail = new CodeDetail();
		model.addAttribute(codeDetail);
		
		List<CodeLabelValue> groupCodeList = codeService.getCodeGroupList();
		model.addAttribute("groupCodeList", groupCodeList);
	}
	
	@PostMapping("/register")
	public String register(CodeDetail codeDetail, RedirectAttributes rttr) throws Exception {
		codeDetailService.register(codeDetail);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/codeDetail/list";
	}
	
	@GetMapping("/list")
	public void list(Model model) throws Exception {
		model.addAttribute("list", codeDetailService.list());
	}
	
	@GetMapping("/read")
	public void read(CodeDetail codeDetail, Model model) throws Exception {
		model.addAttribute(codeDetailService.read(codeDetail));
		List<CodeLabelValue> groupCodeList = codeService.getCodeGroupList();
			model.addAttribute("groupCodeList", groupCodeList);
	}
	
	@GetMapping("/modify")
	public void modifyForm(CodeDetail codeDetail, Model model) throws Exception {
		model.addAttribute(codeDetailService.read(codeDetail));
		List<CodeLabelValue> groupCodeList = codeService.getCodeGroupList();
		model.addAttribute("groupCodeList", groupCodeList);
	}
	
	@PostMapping("/modify")
	public String modify(CodeDetail codeDetail, RedirectAttributes rttr) throws Exception {
		codeDetailService.modify(codeDetail);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/codeDetail/list";
	}
	
	@PostMapping("/remove")
	public String remove(CodeDetail codeDetail, RedirectAttributes rttr) throws Exception {
		codeDetailService.remove(codeDetail);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/codeDetail/list";
	}
}
