package com.team404.snsboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team404.command.SnsBoardVO;
import com.team404.sns.mapper.SnsBoardMapper;

@Service("snsBoardService")
public class SnsBoardServiceImpl implements SnsBoardService{

	@Autowired
	private SnsBoardMapper snsBoardMapper;
	
	@Override
	public boolean regist(SnsBoardVO vo) {
		
		return snsBoardMapper.regist(vo);
	}
		

}
