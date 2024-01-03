package com.zeus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeus.dao.BoardDAO;
import com.zeus.domain.Board;
import com.zeus.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void register(Board board) throws Exception {
		boardDAO.create(board);
	}

	@Override
	public Board read(Integer boardNo) throws Exception {
		return boardDAO.read(boardNo);
	}

	@Override
	public void modify(Board board) throws Exception {
		boardDAO.update(board);
	}

	@Override
	public void remove(Integer boardNo) throws Exception {
		boardDAO.delete(boardNo);
	}

	@Override
	public List<Board> list() throws Exception {
		return boardDAO.list();
	}
 
}