package com.bts.app.board;

import java.util.List;

public interface ReplyService {
	
	//´ñ±Û °³¼ö
	public int commentCount();
	
	//´ñ±Û ¸ñ·Ï
	public List<ReplyVO> commentList();
	
	//´ñ±Û ÀÛ¼º
	public int commentInsert(ReplyVO vo);
	
	//´ñ±Û ¼öÁ¤
	public int commentUpdate(ReplyVO vo);
	
	//´ñ±Û »èÁ¦
	public int commentDelete(int rno);

}
