package com.team404.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.tema404.util.Criteria;

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
	
	//일반목록
	/*
	 * @GetMapping("/getList/{bno}") 
	 * public ArrayList<ReplyVO> getList(@PathVariable("bno") int bno){
	 * 
	 * ArrayList<ReplyVO> list = replyService.getList(bno); return list; }
	 */
	
	//페이지
	@GetMapping("/getList/{bno}/{pageNum}")
	public HashMap<String,Object> getList(@PathVariable("bno") int bno,
									  @PathVariable("pageNum")int pageNum){
		
		//1.화면에 더보기 버튼생성, 더보기 버튼 이벤트
		//2.getList메서드가 (글번호,페이비번호)를 매개변수로 받는다
		//3.Mapper인터페이스의 각각 다른값을 전달하기 위해서 @Param어노페이션을 사용
		//4.쿼리문을 페이징 쿼리로 변경 
		//5.레스트방식은 화면에 필요한 값을 여러개 보낼때, 리턴에 map 이나 새로운 VO형식으로 데이터를 한번에 담아서 처리
		
		Criteria cri = new Criteria(pageNum,20);//화면에서 전달되는 페이지번호,데이터수
		
		//데이터
		ArrayList<ReplyVO> list = replyService.getList(cri, bno);
		//토탈
		int total = replyService.getTotal(bno);
		
		System.out.println(list.toString());
		System.out.println(total);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("total",total);
		
		return map;
	}
	
	@PostMapping(value="/update")
	public int update(@RequestBody ReplyVO vo) {
		//비밀번호 확인
		int result = replyService.pwCheck(vo);
		System.out.println("결과:"+result);
		
		if(result==1) {//비번이 맞는경우 
			return replyService.update(vo);
			
		}else {//비번이 틀린경우
			return 0;  
			
		}
		
	}
	
	@PostMapping(value="/delete")
	public int delete(@RequestBody ReplyVO vo) {
		System.out.println(vo.toString());
		int result = replyService.pwCheck(vo);
		if(result==1) {
			return replyService.delete(vo);
		}else {
			return 0;
			
		}
	}

}
