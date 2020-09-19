
package study.spring.selection.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.User;
import study.spring.selection.service.UserService;

@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService service;

	// 페이지 요청 정보 저장
	/*
	 * private void saveDestination(HttpServletRequest request) { String uri =
	 * request.getRequestURI(); String query = request.getQueryString(); if (query
	 * == null || query.equals("null")) { query = ""; } else { query = "?" + query;
	 * }
	 * 
	 * if (request.getMethod().equals("GET")) { log.debug("destination : + " + (uri
	 * + query)); request.getSession().setAttribute("destination", uri + query); } }
	 */

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");

		if (obj == null) {
			log.debug("로그인이 안된 상태입니다.");

			/*
			 * Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); if
			 * (loginCookie != null) { // String sessionId = loginCookie.getValue(); }
			 * 
			 * User user = service.checkLoginBefore(loginCookie.getValue());
			 * 
			 * if (user != null) { session.setAttribute("user", user); // return true; }
			 * 
			 * }
			 */
			response.sendRedirect("/selection/Login.do");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("AppInterceptor.postHandle 실행됨");
		super.postHandle(request, response, handler, modelAndView);
	}

}
