package com.team404.reply.service;

import java.util.ArrayList;

import com.team404.command.ReplyVO;
import com.team404.util.Criteria;

public interface ReplyService {
	
	public int replyRegist(ReplyVO vo); //댓글등록
	//public ArrayList<ReplyVO> getList(int bno); //목록등록
	public ArrayList<ReplyVO> getList(Criteria cri,int bno);//페이징목록요청
	public int getTotal(int bno);//댓글개수
	
 	public int update(ReplyVO vo); //댓글수정
	public int pwCheck(ReplyVO vo);//비번 확인
	public int delete(ReplyVO vo);//삭제

}
