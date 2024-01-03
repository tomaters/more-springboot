package com.zeus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.domain.Board;
import com.zeus.service.BoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
    private BoardService service;

    @GetMapping("/registerForm")
    public String registerForm(Board board, Model model) throws Exception {
        log.info("registerForm");

        return "board/register";
    }

    @PostMapping("/register")
    public String register(Board board, Model model) throws Exception {
        log.info("register");
        service.register(board);
        model.addAttribute("msg", "registered");

        return "board/success";
    }

    @GetMapping("/list")
    public void list(Model model) throws Exception {
        log.info("list");

        model.addAttribute("list", service.list());
    }

    @GetMapping("/read")
    public void read(int boardNo, Model model) throws Exception {
        log.info("read");

        model.addAttribute(service.read(boardNo));
    }

    @PostMapping("/remove")
    public String remove(int boardNo, Model model) throws Exception {
        log.info("remove");
        service.remove(boardNo);
        model.addAttribute("msg", "deleted");

        return "board/success";
    }

    @GetMapping("/modify")
    public void modifyForm(int boardNo, Model model) throws Exception {
        log.info("modifyForm");

        model.addAttribute(service.read(boardNo));
    }

    @PostMapping("/modify")
    public String modify(Board board, Model model) throws Exception {
        log.info("modify");
        service.modify(board);

        model.addAttribute("msg", "modified");
        return "board/success";
    }
}
