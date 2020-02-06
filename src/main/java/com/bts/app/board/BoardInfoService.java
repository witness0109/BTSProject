package com.bts.app.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardInfoService implements BoardService {

	@Autowired
	BoardDAO dao;
	
	@Override
	public List<BoardVO> getAlLBoard() {
		List<BoardVO> list = dao.getAllBoard();
		return list;
	}

	@Override
	public BoardVO getBoardDetail(int seq) {
		return dao.getBoardDetail(seq);
	}
	
	
	@Override
	public int insertBoard(BoardVO vo) {
		return dao.insertBoard(vo);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
		
	}

	@Override
	public void delete(int seq) {
		dao.delete(seq);
		
	}
	
	@Override
	public int namecheck(BoardVO vo) {
		return dao.namecheck(vo);
		
	}
}
