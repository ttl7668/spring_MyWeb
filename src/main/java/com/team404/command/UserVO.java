package com.team404.command;

import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrZipNum;
	private String addrBasic;
	private String addrDetail;
	private String regdate;
	
	//회원글목록(1:다 매핑)
	private ArrayList<FreeBoardVO> userBoardList;

}
