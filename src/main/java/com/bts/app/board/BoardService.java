package com.bts.app.board;

import java.util.List;

public interface BoardService {

	public List<BoardVO> getAlLBoard();
	
	public BoardVO getBoardDetail(int seq);
	
	public int insertBoard(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public void delete(int seq);
	
	public int namecheck(BoardVO vo);
}
