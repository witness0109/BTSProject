package com.bts.app;

import javax.servlet.http.HttpSession;

public interface MemberService {

	//카카오, 네이버
	public int joinMember(MemberVO vo);


	public int checkID(String id);

	public void membercheck(HttpSession session, String email, String name);
	
	public String checkPw(String id);

	public void logout(HttpSession session);
}
