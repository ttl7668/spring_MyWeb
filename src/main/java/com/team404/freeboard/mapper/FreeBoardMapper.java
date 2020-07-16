package com.team404.freeboard.mapper;

import java.util.ArrayList;

import com.team404.command.FreeBoardVO;
import com.tema404.util.Criteria;

public interface FreeBoardMapper {
	
	public void regist(FreeBoardVO vo);
	public ArrayList<FreeBoardVO> getList(Criteria cri);//글목록
	public int getTotal(Criteria cri);//총 게시글 수 
	public FreeBoardVO getContent(int bno);
	public int update(FreeBoardVO vo);
	public void delete(FreeBoardVO vo);//삭제


}
