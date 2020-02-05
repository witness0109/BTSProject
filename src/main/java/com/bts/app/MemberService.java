package com.bts.app;


import java.sql.Array;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

public interface MemberService {


	public int joinMember(MemberVO vo);


	public int checkID(String id);

	public void membercheck(HttpSession session, String email, String name);
	
	public List<String> checkPw(String[] list);
	

	
	
}
