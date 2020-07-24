package com.team404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team404.command.UserVO;
import com.team404.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("userService")
	UserService userService;
	
		
	//일반 컨트롤러에서는 return의 결과가 viewResolver로 가게됩니다.
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public int userIdCheck(@RequestBody UserVO vo) {
		userService.idCheck(vo);
		return userService.idCheck(vo);
	}
	//회원가입
	@RequestMapping("/userJoin")
	public String userJoin() {
		return "user/userJoin";
	}
	
	//회원가입폼으로 이동
	@RequestMapping(value="/joinForm",method=RequestMethod.POST)
	public String joinForm(UserVO vo,RedirectAttributes RA) {
	
		System.out.println(vo.toString());
		int result =userService.insert(vo);
		if(result==1) {
			RA.addFlashAttribute("msg","회원가입되었습니다");
			
		}else {
			RA.addFlashAttribute("msg","회원가입 실패 되었습니다");
		}
		return "redirect:/user/userLogin";
	}
	
	//로그인
	@RequestMapping("/userLogin")
	public String userLogin() {
		return "user/userLogin";
	}
	
	//로긴폼으로 이동 
	@RequestMapping(value="/loginForm",method=RequestMethod.POST)
	public String loginForm(UserVO vo,RedirectAttributes RA) {
		System.out.println(vo.toString());
		int result =userService.login(vo);
		
		if(result==1) {
			RA.addFlashAttribute("msg","로그인성공");
			
		}else {
			RA.addFlashAttribute("msg","로그인실패");
		}
	
		return "user/userMypage";
	}

	@RequestMapping("/userMypage")
	public String userMypage() {
		return "user/userMypage";
		
	}

}

