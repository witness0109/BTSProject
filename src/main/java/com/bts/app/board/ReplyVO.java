package com.bts.app.board;

import java.util.Date;

public class ReplyVO {

	private int seq;
	private int rno;
	private String contents;
	private String writer;
	private Date time;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ReplyVO [seq=" + seq + ", rno=" + rno + ", contents=" + contents + ", writer=" + writer + ", time="
				+ time + "]";
	}
	
	
	
	
	
}
