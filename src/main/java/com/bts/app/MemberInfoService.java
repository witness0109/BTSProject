package com.bts.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoService implements MemberService {
	@Autowired
	MemberDAO dao;

	@Override
	public int joinMember(MemberVO vo) {

		return dao.joinMember(vo);
	}

	@Override
	public int checkID(String id) {
		return dao.checkID(id);
	}

}
