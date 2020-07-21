package com.team404.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team404.command.ReplyVO;
import com.team404.reply.service.ReplyService;

@RestController //비동기전용 댓글 컨트롤러
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	@PostMapping(value = "/replyRegist")
	public int replyRegist(@RequestBody ReplyVO vo) { // 경로 : reply/replyRegist 
		
		int result = replyService.replyRegist(vo);
		
		return result; //성공시 1 
	}
	
	@GetMapping("/getList/{bno}")
	public ArrayList<ReplyVO> getList(@PathVariable("bno") int bno){
		
		ArrayList<ReplyVO> list = replyService.getList(bno);
		return list;
	}
	
	@PostMapping(value="/update")
	public int update(@RequestBody ReplyVO vo) {
		int result=replyService.update(vo);
		System.out.println(result);
		return 0 ;  
	}

}
