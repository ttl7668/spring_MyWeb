package com.team404.freeboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team404.command.FreeBoardVO;
import com.team404.freeboard.mapper.FreeBoardMapper;
import com.tema404.util.Criteria;


@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardMapper freeBoardMapper;
	
	@Override
	public void regist(FreeBoardVO vo) {
		freeBoardMapper.regist(vo);
		
	}

	@Override
	public ArrayList<FreeBoardVO> getList(Criteria cri) {
		
		return freeBoardMapper.getList(cri);
	}

	@Override
	public FreeBoardVO getContent(int bno) {
		
		return freeBoardMapper.getContent(bno);
	}

	@Override
	public int update(FreeBoardVO vo) {
		freeBoardMapper.update(vo);
		return 1;
	}

	@Override
	public void delete(FreeBoardVO vo) {
		freeBoardMapper.delete(vo);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return freeBoardMapper.getTotal(cri);
	}







	

	

}
