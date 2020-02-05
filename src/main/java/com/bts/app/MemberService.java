package com.bts.app;

import javax.servlet.http.HttpSession;

public interface MemberService {

	public int joinMember(MemberVO vo);

	public int checkID(String id);

	public void membercheck(HttpSession session, String email, String name);
	
	public String checkPw(String id);

	public void logout(HttpSession session);
}
