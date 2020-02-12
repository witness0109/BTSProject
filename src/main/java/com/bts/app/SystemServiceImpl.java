package com.bts.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService {

	@Autowired
	MemberDAO dao;
	
	
	@Override
	public List<MemberVO> getAllMem() {
		return dao.getAllMember();
	}


	@Override
	public void deleteMem(String id) {
		dao.deleteMember(id);
		
	}

}
