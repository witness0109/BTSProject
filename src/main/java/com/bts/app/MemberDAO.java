package com.bts.app;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;

	public int joinMember(MemberVO vo) {
		System.out.println(vo);
	
		return session.insert("mem.memberjoin", vo);
	}


	public int checkID(String id) {

		return session.selectOne("mem.idcheck", id);
	}
	
	public String checkPw(String id) {
		return session.selectOne("mem.pwcheck",id);
	}
	
	public void logout(HttpSession session) {
	}
}
