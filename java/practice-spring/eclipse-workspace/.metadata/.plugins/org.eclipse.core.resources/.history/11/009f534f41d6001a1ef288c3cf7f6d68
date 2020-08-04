package com.springbook.biz.boardimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertboard() {
		boardDAO.insert();
	}

	@Override
	public void deleteboard() {
		boardDAO.delete();
	}

	@Override
	public void updateboard() {
		boardDAO.update();
	}

	@Override
	public void readboard() {
		boardDAO.read();

	}

}
