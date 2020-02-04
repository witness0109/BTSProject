package com.bts.app;

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

		return session.selectOne("idcheck", id);
	}
}
