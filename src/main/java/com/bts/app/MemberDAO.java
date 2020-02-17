package com.bts.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;

	public int joinMember(MemberVO vo) {

		return session.insert("mem.memberjoin", vo);
	}

	public int checkID(String id) {

		return session.selectOne("mem.idcheck", id);
	}

	public List<String> checkPw(String[] list) {

		return session.selectList("mem.pwcheck", list);
	}

	public List<String> checkMail(String[] list) {

		return session.selectList("mem.mailcheck", list);
	}

	public int loginMember(String[] inf) {
		return session.selectOne("mem.login",inf);
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public void updatemember(MemberVO vo) {
		session.update("mem.updatemember", vo);
	}
	
	//관리자 모드
	public List<MemberVO> getAllMember(){
		return session.selectList("mem.allmember");
	}
	
	//관리자 모드
	public void deleteMember(String id) {
		session.delete("mem.kickmember", id);
	}

	public String findname(String id) {
		return session.selectOne("mem.name",id);
	}

}
