package com.bts.app;


import java.sql.Array;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

public interface MemberService {


	public int joinMember(MemberVO vo);


	public int checkID(String id);

	public void membercheck(HttpSession session, String email, String name);
	

	//암호조회
	public List<String> checkPw(String[] list);
	
	//이메일조회
	public List<String> checkMail(String[] list);
	
	

	public String checkPw(String id);

	public void logout(HttpSession session);

}
