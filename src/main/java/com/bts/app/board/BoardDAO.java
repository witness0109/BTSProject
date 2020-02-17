package com.bts.app.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession session;
	
	public List<BoardVO> getAllBoard() {
		List<BoardVO> list = session.selectList("board.allboard");
		return list;
	}
	
	public int insertBoard(BoardVO vo) {
		System.out.println("具具具具");
		return session.insert("board.insertboard", vo);
	}
	
	public BoardVO getBoardDetail(int seq) {
		return session.selectOne("board.detail", seq);
		
	}

	public void update(BoardVO vo) {
		session.selectOne("board.update", vo);
	}
	
	public void delete(int seq) {
		session.selectOne("board.delete", seq);
	}
	
	public int namecheck(BoardVO vo) {
		return session.selectOne("board.namecheck", vo);
	}
	
	public List<BoardVO> getBoardList(PagingCriteria paging){
		return session.selectList("board.getBoardList", paging); 
	}
	
	public int totalCnt() {
		return session.selectOne("board.getTotalCnt");
	}

	
}

