package com.bts.app.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bts.app.board.BoardVO;
import com.bts.app.board.PagingCriteria;

@Service
public class NoticeInfoService implements NoticeService {

	@Autowired
	NoticeDAO dao;

	@Override
	public List<NoticeVO> getAlLBoard() {
		List<NoticeVO> list = dao.getAllBoard();
		return list;
	}

	@Override
	public NoticeVO getnoticedetail(int seq) {
		return dao.getnoticedetail(seq);
	}

	@Override
	public int insertnotice(NoticeVO vo) {
		return dao.insertnotice(vo);
	}

	@Override
	public void noticeupdate(NoticeVO vo) {
		dao.noticeupdate(vo);
		
	}

	@Override
	public void noticedelete(int seq) {
		dao.noticedelete(seq);
		
	}

	@Override
	public int namecheck(NoticeVO vo) {
		return dao.namecheck(vo);
	}

	@Override
	public List<NoticeVO> getnoticelist(PagingCriteria2 paging) {
		
		return dao.getnoticelist(paging);
	}

	@Override
	public int totalCnt() {
		return dao.totalCnt();
	}
	
	
}
