package com.team404.user.service;

import com.team404.command.UserVO;

public interface UserService {
	
	public int idCheck(UserVO vo);//아이디중복확인
	public int insert(UserVO vo);//회원가입처리
	public int login(UserVO vo);//로그인 검증
	public UserVO userInfo(String userId);//회원정보
	public int update(UserVO vo);//업데이트처리
	public UserVO getInfo(String userId);//정보얻기

}
