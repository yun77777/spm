package com.mall.common;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mall.login.serviceImpl.loginMapper;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired
	private loginMapper loginMapper;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	    HttpSession httpSession = request.getSession();
	    ModelMap modelMap = modelAndView.getModelMap();
	    Object userVO =  modelMap.get("ID");
	    Object k_userInfo =  modelMap.get("k_userInfo");
	    Object n_userInfo =  modelMap.get("n_userInfo");
	    
	    System.err.println("userVOOOOOOO:"+userVO);
	    System.err.println("k_userInfo:"+modelMap.get("k_userInfo"));
	    System.err.println("n_userInfo:"+modelMap.get("n_userInfo"));
	    if (userVO != null) {
	        logger.info("new login success");
	        httpSession.setAttribute(LOGIN, userVO);
	        httpSession.setAttribute("k_userInfo", k_userInfo);
	        httpSession.setAttribute("n_userInfo", n_userInfo);
	        
	        System.err.println("session:"+userVO);
	        Map<String, Object> member=loginMapper.selectMember(userVO.toString());
//	        member.put("k_userInfo", k_userInfo);
//	        member.put("n_userInfo", n_userInfo);
	        System.err.println("member:"+member);
	        httpSession.setAttribute("member", member);
	        
	        
	        //response.sendRedirect("/");

	        if (request.getParameter("useCookie") != null) {
	            logger.info("remember me...");
	            // ????????? ?????? ?????? ??? ?????? ??????
	            Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
	            loginCookie.setPath("/main.do");
//	            loginCookie.setPath("/");
	            loginCookie.setMaxAge(60*60*24*7);
	            // ??????
	            response.addCookie(loginCookie);
	        }
	        
	        if(n_userInfo!=null & member==null) {
				//response.sendRedirect("/main.do");
	        	return;
	        }else {
	        	Object destination = httpSession.getAttribute("destination");
	        	String cPath=request.getContextPath();
				response.sendRedirect(destination != null ? (String) destination : cPath+"/main.do");
				return ;
	        }
	        
//	        response.sendRedirect(destination != null ? (String) destination : "/");
	    }

	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession httpSession = request.getSession();
		// ????????? ????????? ?????? ??????
		if (httpSession.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}

		return true;
	}
}