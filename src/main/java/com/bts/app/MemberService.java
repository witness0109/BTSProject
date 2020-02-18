package com.bts.app;


import java.sql.Array;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

public interface MemberService {


	public int joinMember(MemberVO vo);


	public int checkID(String id);

	public void membercheck(HttpSession session, String email, String name);
	

	//��ȣ��ȸ
	public List<String> checkPw(String[] list);
	
	//�̸�����ȸ
	public List<String> checkMail(String[] list);

	//�α���
	public int login(String[] inf);
	
	//�α��ν� �ʿ��� �����ȸ

	
	public void logout(HttpSession session);
	
	
	public void updatemember(MemberVO vo);
	
	public String findname(String id);

	

	

}
