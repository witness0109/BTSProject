package com.bts.app.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyInfoService implements ReplyService {

	@Autowired
	ReplyDAO dao;

	@Override
	public int commentCount() {
		return dao.commentCount();
	}

	@Override
	public List<ReplyVO> commentList() {
		return dao.commentList();
	}

	@Override
	public int commentInsert(ReplyVO vo) {
		return dao.commentInsert(vo);
	}

	@Override
	public int commentUpdate(ReplyVO vo) {
		return dao.commentupdate(vo);
	}

	@Override
	public int commentDelete(int rno) {
		return dao.commentDelete(rno);
	}

	
	


}
