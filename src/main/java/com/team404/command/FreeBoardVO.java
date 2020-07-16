package com.team404.command;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class FreeBoardVO {
	
	/*
	 * VO 맞추는 기준
	 * 1.테이블기준
	 * 2.화면기준 
	 */
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate; 
	
	

}
