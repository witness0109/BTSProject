package com.bts.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bts.app.board.PagingCriteria;

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
	
	@Override
	public int memberCnt() {
		
		return dao.totalMemberCnt();
	}


	@Override
	public List<MemberVO> getMemberList(PagingCriteria paging) {
		// TODO Auto-generated method stub
		return dao.getMemberList(paging);
	}


}
