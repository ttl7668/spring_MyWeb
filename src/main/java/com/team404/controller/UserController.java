package com.team404.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String loginForm(UserVO vo,HttpSession session,RedirectAttributes RA) {
		System.out.println(vo.toString());
		int result =userService.login(vo);
		System.out.println(result);
		if(result==1) {
			session.setAttribute("userId", vo.getUserId());//세션에 저장
			return "redirect:/";//홈 
			
		}else {
			RA.addFlashAttribute("msg","로그인실패");
			return "redirect:/user/userLogin";
		}
	
	}
	/*//내글 보기 
	 * @RequestMapping("/userMypage") public String userMypage(HttpSession session,
	 * Model model) {
	 * 
	 * String userId = (String)session.getAttribute("userId"); //마이페이지 진입 시 조인처리
	 * 
	 * UserVO userVO = userService.userInfo(userId);
	 * System.out.println(userVO.getUserPw());
	 * 
	 * model.addAttribute("userVO", userVO);
	 * 
	 * return "user/userMypage"; }
	 */
	 
	 //수정화면
	 @RequestMapping("/userMypage")
	 public String userMypage(HttpSession session, Model model) {
	      String userId = (String)session.getAttribute("userId");

	      UserVO userVO = userService.getInfo(userId);
	      //System.out.println(userVO.getUserPw());
	      
	      model.addAttribute("userVO", userVO);
	      
	      return "user/userMypage";
	 }
	 //수정폼
	 @RequestMapping(value="/updateForm",method=RequestMethod.POST)
	 public String updateForm(UserVO vo,RedirectAttributes RA) {
		 System.out.println(vo.toString());
			userService.update(vo);
			return "redirect:/";
	 }
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();//세션정보 삭제
		
		return "redirect:/";
	}

}

