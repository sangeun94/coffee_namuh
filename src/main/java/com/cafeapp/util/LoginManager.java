package com.cafeapp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component //@Service @Repository
public class LoginManager {

	private static String sessionLoginId = "loginId";
	
	//세션에 로그인 기록
	public void setSessionLogin(String userId, HttpSession session) { //session방식
		session.setAttribute(sessionLoginId, userId);
					//			"loginId", 	"th3904";
	}
	
	public void setSessionLogin(String userId, HttpServletRequest request) { //request방식으로 오버로딩
		setSessionLogin(userId, request.getSession());
		//request.getSession().setAttribute(sessionLoginId, userId);	
	}
	
	//세선에서 로그인 여부 확인
	public boolean isLogin(HttpSession session) { //현재 로그인 되어있는지?
		if(session != null && session.getAttribute(sessionLoginId) != null) { //로그인 된 경우
			return true;
		}
				
		return false;
	}
	
	public String getUserId(HttpSession session) {
		
//		session.getAttribute(sessionLoginId)  //"th3904"
//						//  "loginId"
//		session.setAttribute("loginId", userId);
		
		return (String) session.getAttribute(sessionLoginId);
	}
	
	public boolean isLogin(HttpServletRequest request) { //request로 들어온 경우
		return isLogin(request.getSession(false)); //없는걸 만들지 않도록 false를 넣어주고!	
	}
	
	//로그아웃
	public void logout(HttpSession session) {
		//session.removeAttribute(sessionLoginId); //Id값만 지우는 경우
		session.invalidate(); //로그아웃 처리 -> session에 있는 attribute값을 모두 다 지우는
	}
	
	public void logout(HttpServletRequest request) { //오버로딩
		logout(request.getSession());
	}
}
