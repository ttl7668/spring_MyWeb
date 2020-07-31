package com.team404.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team404.command.FreeBoardVO;
import com.team404.freeboard.service.FreeBoardService;
import com.team404.util.Criteria;
import com.team404.util.PageVO;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	/*
	 * 화면처리->테이블생성->등록처리
	 */
	
	@Autowired
	@Qualifier("freeBoardService")
	private FreeBoardService freeBoardService;
	
	//목록화면
	@RequestMapping("/freeList")
	public String freeList(Model model,Criteria cri) {
		//기본
//		ArrayList<FreeBoardVO> list = freeBoardService.getList();
//		model.addAttribute("boardList",list);
		
		//페이징
//		ArrayList<FreeBoardVO> list=freeBoardService.getList(cri);//페이지계산처리
//		int total = freeBoardService.getTotal();//총 게시글 수
//		PageVO pageVO = new PageVO(cri,total);//화면에 그려질 페이지네이션처리
		
		//검색페이징
		ArrayList<FreeBoardVO> list=freeBoardService.getList(cri);
		int total = freeBoardService.getTotal(cri);
		PageVO pageVO = new PageVO(cri,total);
				
		//System.out.println(cri.toString());
		
		model.addAttribute("boardList",list);
		model.addAttribute("pageVO",pageVO);
		
		return "freeBoard/freeList";
	}
	
	//등록화면
	@RequestMapping("/freeRegist")
	public String freeRegist() {
		return "freeBoard/freeRegist";
	}
	
	//등록처리
	@RequestMapping(value="/registForm",method=RequestMethod.POST)
	public String registForm(FreeBoardVO vo,RedirectAttributes RA) {
		
		freeBoardService.regist(vo);
		
		//등록성공여부(msg)-일회성 사용 가능
		RA.addFlashAttribute("msg","정상등록되었습니다");
		
		return "redirect:/freeBoard/freeList";//등록후에 리스트화면으로 리다이렉트
	}
	
//	//수정화면
//	@RequestMapping("/freeModify")
//	public String freeModify(@RequestParam("bno") int bno,
//							Model model) {
//		
//		FreeBoardVO vo =freeBoardService.getContent(bno);
//		model.addAttribute("boardVO",vo);
//		return "freeBoard/freeModify";
//	}
//	
//	//상세화면
//	@RequestMapping("/freeDetail")
//	public String freeDetail(@RequestParam("bno") int bno,
//							Model model) {
//		
//		FreeBoardVO vo =freeBoardService.getContent(bno);
//		model.addAttribute("boardVO",vo);
//		
//		return "freeBoard/freeDetail";
//	}
	
	//글 수정+상세화면
	@RequestMapping({"/freeModify","/freeDetail"})
	public void getContent(@RequestParam("bno") int bno,
							Model model) {
		FreeBoardVO vo =freeBoardService.getContent(bno);
		model.addAttribute("boardVO",vo);
	}
		
	
	//글 수정처리
	@RequestMapping("/freeupdate")
	public String freeupdate(FreeBoardVO vo,RedirectAttributes RA) {
				
		int result = freeBoardService.update(vo);
		
		if(result==1) {
			RA.addFlashAttribute("msg","게시글이 정상 수정 되었습니다");
		}else {
			RA.addFlashAttribute("msg","게시글이 실패 수정 되었습니다");
		}
		//다시 상세화면으로 리다이렉트
		return "redirect:/freeBoard/freeList";
	}
	
	//삭제처리
	@RequestMapping("/freeDelete")
	public String freeupdate(FreeBoardVO vo) {
		freeBoardService.delete(vo);
		return "redirect:/freeBoard/freeList";
	}
	
	

}
