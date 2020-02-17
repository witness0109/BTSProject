package com.bts.app.notice;

import java.util.List;

import com.bts.app.board.BoardVO;
import com.bts.app.board.PagingCriteria;

public interface NoticeService {

	public List<NoticeVO> getAlLBoard();
	
	public NoticeVO getnoticedetail(int seq);
	
	public int insertnotice(NoticeVO vo);
	
	public void noticeupdate(NoticeVO vo);
	
	public void noticedelete(int seq);
	
	public int namecheck(NoticeVO vo);
	
	List<NoticeVO> getnoticelist(PagingCriteria2 paging);
	
	int totalCnt();
	
}
