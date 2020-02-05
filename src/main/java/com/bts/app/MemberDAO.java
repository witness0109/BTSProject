package com.bts.app;

import java.util.List;

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
	
	public List<String> checkPw(String[] list) {

		return session.selectList("mem.pwcheck",list);
	}
	
	public List<String> checkMail(String[] list) {

		return session.selectList("mem.mailcheck",list);
	}
	
	
	
}
