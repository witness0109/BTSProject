package com.bts.app.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSession session;
	
	public List<NoticeVO> getAllBoard() {
		List<NoticeVO> list = session.selectList("notice.allboard");
		return list;
	}
	
	public int insertnotice(NoticeVO vo) {
		return session.insert("notice.insertnotice", vo);
	}
	
	public NoticeVO getnoticedetail(int seq) {
		return session.selectOne("notice.noticedetail", seq);
		
	}

	public void noticeupdate(NoticeVO vo) {
		session.selectOne("notice.noticeupdate", vo);
	}
	
	public void noticedelete(int seq) {
		session.selectOne("notice.noticedelete", seq);
	}
	
	public int namecheck(NoticeVO vo) {
		return session.selectOne("notice.namecheck", vo);
	}
	
	public List<NoticeVO> getnoticelist(PagingCriteria2 paging){
		return session.selectList("notice.getnoticelist", paging); 
	}
	
	public int totalCnt() {
		return session.selectOne("notice.getTotalCnt");
	}

	
}

