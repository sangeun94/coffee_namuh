package com.cafeapp.controller.user;

import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class SessionManager {

    public static final String SESSION_COOKIE_NAME = "mySessionId";
    private Map<String, Object> sessionStore = new ConcurrentHashMap<>();
 // 세션 만료 시간 (3분으로 설정)
    private static final long SESSION_EXPIRATION_TIME = 3 * 60 * 1000; // 3분 (밀리초 단위)
    
    
    public void createSession(Object value, HttpServletResponse response) {
        // 세션 생성
        String sessionId = UUID.randomUUID().toString();
        sessionStore.put(sessionId, value);

     // 쿠키 생성 후 저장 (세션 만료 시간 설정)
        Cookie cookie = new Cookie(SESSION_COOKIE_NAME, sessionId);
        cookie.setMaxAge((int) (SESSION_EXPIRATION_TIME / 1000)); // 세션 만료 시간을 초 단위로 설정
        response.addCookie(cookie);
    }

    public Object getSession(HttpServletRequest request) {
        Cookie cookie = findCookie(request, SESSION_COOKIE_NAME);
        if (cookie == null) {
            return null;
        }
        return sessionStore.get(cookie.getValue());
    }

    public void expire(HttpServletRequest request) {
        Cookie cookie = findCookie(request, SESSION_COOKIE_NAME);
        if (cookie != null) {
            sessionStore.remove(cookie.getValue());
        }
    }

    public Cookie findCookie(HttpServletRequest request, String cookieName) {
        if (request.getCookies() == null) {
            return null;
        }

        return Arrays.stream(request.getCookies())
                .filter(c -> c.getName().equals(cookieName))
                .findAny()
                .orElse(null);
    }
    
    
}
