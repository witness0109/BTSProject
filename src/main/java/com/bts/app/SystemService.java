package com.bts.app;

import java.util.List;

public interface SystemService {

	//모든 member 
	public List<MemberVO> getAllMem();
	
	//강퇴기능
	public void deleteMem(String id);
	
}
