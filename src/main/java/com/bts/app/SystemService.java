package com.bts.app;

import java.util.List;

public interface SystemService {

	//조회 member 
	public List<MemberVO> getAllMem();
	
	//강퇴
	public void deleteMem(String id);
	
}
