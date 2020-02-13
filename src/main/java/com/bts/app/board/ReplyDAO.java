package com.bts.app.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession session;
	
	public int commentCount() {
		return session.selectOne("board.commentCount");
	}
	
	
	public List<ReplyVO> commentList(int seq){
		
	List<ReplyVO> list = session.selectList("board.commentList", seq);
	return list;
	}
	
	public int commentInsert(ReplyVO vo) {
		System.out.println(vo);
		return session.insert("board.commentInsert", vo);
		
	}
	
	public int commentupdate(ReplyVO vo) {
		return session.update("board.commentUpdate", vo);
	}
	
	public int commentDelete(int rno) {
		return session.delete("board.commentDelete", rno);
	}
	
	

	
	

}
