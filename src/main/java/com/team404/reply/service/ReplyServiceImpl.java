package com.team404.reply.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team404.command.ReplyVO;
import com.team404.reply.mapper.ReplyMapper;
import com.tema404.util.Criteria;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public int replyRegist(ReplyVO vo) {
		
		return replyMapper.replyRegist(vo);
		
	}

	/*
	 * @Override public ArrayList<ReplyVO> getList(int bno) {
	 * 
	 * return replyMapper.getList(bno); }
	 */
	
	@Override
	public ArrayList<ReplyVO> getList(Criteria cri, int bno) {
		
		return replyMapper.getList(cri,bno);
	}

	@Override
	public int update(ReplyVO vo) {
		
		return replyMapper.update(vo);
	}

	@Override
	public int pwCheck(ReplyVO vo) {

		return replyMapper.pwCheck(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		
		return replyMapper.delete(vo);
	}

	@Override
	public int getTotal(int bno) {
		
		return replyMapper.getTotal(bno);
	}

}
