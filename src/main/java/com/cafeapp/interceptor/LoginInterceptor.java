package com.cafeapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cafeapp.util.LoginManager;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Autowired
	LoginManager loginManager;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("preHandle");
		
		/* LoginManager 생성 전
		HttpSession session = request.getSession(false); //getter /없으면 생성하지않고 그냥 null로 처리
		//request 안에 있는 session을 가져온다. (가져오려다가 없으면? 새로 생성!)
		
		if( session == null || session.getAttribute("loginId") == null ) {
			//로그인 안했으면 다시 로그인페이지로 가라!
			response.sendRedirect("/admin/login"); //redirect:경로
			return false; // 인터셉터에서 더이상 진행하지않도록 막음 
		}
		*/
		
		if(loginManager.isLogin(request) == false) { //로그인 안되면
			response.sendRedirect("/admin/login"); //redirect:경로
			return false; // 인터셉터에서 더이상 진행하지않도록 막음 
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle");

		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion");

		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}