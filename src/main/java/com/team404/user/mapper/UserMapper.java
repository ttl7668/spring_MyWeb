package com.team404.user.mapper;

import com.team404.command.UserVO;

public interface UserMapper {
	
	public int idCheck(UserVO vo);
	public int insert(UserVO vo);
	public int login(UserVO vo);
}
