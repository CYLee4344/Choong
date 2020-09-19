package study.spring.selection.controllers;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.User;
import study.spring.selection.service.UserService;
@Slf4j
@Controller
public class UserController {

	@Autowired
	UserService service;

	/** 회원가입 */
	@RequestMapping(value = "/UserRegister.do", method = RequestMethod.POST)
	public String register(User user) throws Exception {
		service.register(user);
		return "index";
	}

	/** 로그인 */
    @RequestMapping(value = "/UserLogin.do", method = RequestMethod.POST)
    public void login(User user, HttpSession session, HttpServletResponse response) throws Exception {

        User login = service.login(user);

        if (login != null) { // 로그인 성공
            log.debug("로그인 성공");
            session.setAttribute("user", login); // 세션에 login이란 이름으로 User객체를 저장
            response.getWriter().print(true);
        } else {
            session.setAttribute("user", null);
            response.getWriter().print(false);
        }
    }

	/** 아이디 중복체크 */
	@ResponseBody
	@RequestMapping(value = "/IdCheck.do", method = RequestMethod.POST)
	public int idCheck(User user) throws Exception {
		int result = service.idCheck(user);
		return result;
	}

	/** 로그아웃 */
	@RequestMapping(value = "/UserLogout.do", method = RequestMethod.GET )
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		session.invalidate();
		// session.removeAttribute("user");
		return "redirect:/";
	}

	/** 회원정보수정 */
	@RequestMapping(value = "/UserUpdate.do", method = RequestMethod.POST)
	public String userUpdate(User user, HttpSession session) throws Exception {

		service.userUpdate(user);
		session.invalidate();
		return "Login";
	}

	/** 회원탈퇴 */
	@RequestMapping(value = "/UserDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String userDelete(User user, HttpSession session) throws Exception {

		User user1 = (User) session.getAttribute("user");

		service.userDelete(user1);
		session.invalidate();

		return "redirect:/";
	}

	/** 탈퇴 시 비밀번호 확인 */
	@ResponseBody
	@RequestMapping(value = "/checkPW.do", method = RequestMethod.POST)
	public int checkPW(User user) throws Exception {
		int result = service.checkPW(user);
		return result;
	}

	/** 아이디 찾기 */
	@RequestMapping(value = "/FindID.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String findID(Model model, HttpServletResponse response,
	  @RequestParam(value="user_email", required=true) String user_email) {

	  // 데이터 조회에 필요한 조건값을 Beans에 저장하기
	  User user1 = new User();
	  user1.setUser_email(user_email);

	  // 조회결과를 저장할 객체 선언
	  User output = null;

	  try {
		  // 데이터 조회
		  output = service.findID(user1);
	  } catch (Exception e) {
		  e.printStackTrace();
	  }

	  // View 처리
	  model.addAttribute("output",output);
	  return "Search_ID";
	}

	/** 아이디찾기 이메일 존재여부 체크 */
	@ResponseBody
	@RequestMapping(value = "/EmailCheck.do", method = RequestMethod.POST)
	public int emailCheck(User user) throws Exception {
		int result = service.emailCheck(user);
		return result;
	}

	/** 비밀번호 찾기 회원정보 존재여부 체크 */
	@ResponseBody
	@RequestMapping(value = "/PWCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int pwCheck(User user) throws Exception {
		int result = service.pwCheck(user);
		return result;
	}

}