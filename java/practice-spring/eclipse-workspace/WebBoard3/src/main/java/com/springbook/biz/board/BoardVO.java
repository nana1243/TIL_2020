package com.springbook.biz.board;

public class BoardVO {
	
	private int seq;
	private String title;
	private String writer;
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}


	public BoardVO(int seq, String title, String writer) {
		this.seq = seq;
		this.title = title;
		this.writer = writer;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + "]";
	}
	
	

}
