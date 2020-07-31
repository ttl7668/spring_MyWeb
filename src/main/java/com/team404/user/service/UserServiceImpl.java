package com.team404.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team404.command.UserVO;
import com.team404.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int idCheck(UserVO vo) {
		System.out.println("수행됨");
		return userMapper.idCheck(vo);
	}

	@Override
	public int insert(UserVO vo) {
		
		return userMapper.insert(vo);
	}

	@Override
	public int login(UserVO vo) {
		
		return userMapper.login(vo);
	}

	@Override
	public UserVO userInfo(String userId) {
		
		return userMapper.userInfo(userId);
	}

}
