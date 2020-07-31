package com.team404.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//게시글 변경, 수정, 삭제에 대한 인터셉터
		//세션값과 writer정보가 같다면  컨트롤러를 실행, 화면에 그렇지 않으면 요청을 "권한이 없습니다"를 출력 
		HttpSession session = request.getSession();
		String userId =(String)session.getAttribute("userId");//로그인세션
		
		String writer = request.getParameter("writer");
		System.out.println(userId);
		System.out.println(writer);
		
		if(writer !=null && writer.equals(userId)) {
			return true; //컨트롤러를 그대로 실행
		}else {
			//화면에 문자열의 형태로 전달
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().write("<script>");
			response.getWriter().write("alert('권한이없습니다');");
			response.getWriter().write("history.go(-1);");
			response.getWriter().write("</script>");
			
			return false; //컨트롤러 실행을 중단
			
		}
		
	}

}
