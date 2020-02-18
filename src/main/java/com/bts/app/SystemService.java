package com.bts.app;

import java.util.List;

import com.bts.app.board.PagingCriteria;

public interface SystemService {

	//조회 member 
	public List<MemberVO> getAllMem();
	
	//강퇴
	public void deleteMem(String id);
	
	public int memberCnt();
	
	List<MemberVO> getMemberList(PagingCriteria paging);
	
}
