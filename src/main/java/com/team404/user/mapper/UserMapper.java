package com.team404.user.mapper;

import com.team404.command.UserVO;

public interface UserMapper {
	
	public int idCheck(UserVO vo);
	public int insert(UserVO vo);
	public int login(UserVO vo);
	public UserVO userInfo(String userId);//회원정보
	public int update(UserVO vo);//업데이트처리
	public UserVO getInfo(String userId);//정보얻기
}
