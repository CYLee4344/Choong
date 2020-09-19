package study.spring.selection.controllers;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.selection.model.User;
import study.spring.selection.service.UserService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {

	@RequestMapping(value = "/")
	public String home() {

		return "index";
	}

	@RequestMapping(value = "/index.do")
	public String index() {

		return "index";
	}

	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public String Login(@ModelAttribute("user") User user) {

		return "Login";
	}

	@RequestMapping(value = "/ShoppingCart.do")
	public String ShoppingCart() {

		return "ShoppingCart";
	}

	@RequestMapping(value = "/SignUp.do")
	public String signUp() {

		return "SignUp";
	}


	@RequestMapping(value = "/Detail.do")
	public String Detail() {

		return "Detail";
	}

	@RequestMapping(value = "/Payment.do")
	public String Payment() {

		return "Payment";
	}

	@RequestMapping(value = "/Update_Info.do")
	public String update_info() {

		return "Update_Info";
	}

	@RequestMapping(value = "/Find_ID.do")
	public String Find_Id() {

		return "Find_ID";
	}

	@RequestMapping(value = "/Search_ID.do")
	public String Search_ID() {

		return "Search_ID";
	}

	@RequestMapping(value = "/FindByEmail.do")
	public String FindByEmail() {

		return "FindByEmail";
	}

	@RequestMapping(value = "/Delivery.do")
	public String Delivery() {

		return "Delivery";
	}


	@RequestMapping(value = "/MyPage.do")
	public String MyPage() {

		return "MyPage";
	}

	@RequestMapping(value = "/Check_PW.do")
	public String Check_PW() {

		return "Check_PW";
	}

	@RequestMapping(value = "/MyHeart.do")
	public String MyHeart() {

		return "MyHeart";
	}

	@RequestMapping(value = "/ready.do")
	public String ready() {

		return "ready";
	}



	/** 카테고리 바 시작 */

	@RequestMapping(value = "/Best.do")
	public String Best() {

		return "Best";
	}

	@RequestMapping(value = "/New.do")
	public String New() {

		return "New";
	}

	@RequestMapping(value = "/Recommend.do")
	public String Reccomend() {

		return "Recommend";
	}

	@RequestMapping(value = "/Top.do")
	public String Top() {

		return "Top";
	}

	@RequestMapping(value = "/Dress.do")
	public String Dress() {

		return "Dress";
	}

	@RequestMapping(value = "/Pants.do")
	public String Pants() {

		return "Pants";
	}

	@RequestMapping(value = "/Outer.do")
	public String Outer() {

		return "Outer";
	}

	@RequestMapping(value = "/Acc.do")
	public String Acc() {

		return "Acc";
	}

	@RequestMapping(value = "/Announcement.do")
	public String Announcement() {

		return "Announcement";
	}


	/** 카테고리 바 끝 */







	/** footer 시작 */
	@RequestMapping(value = "/CustomerService.do")
	public String CustomerService() {

		return "CustomerService";
	}

	@RequestMapping(value = "/Store_Info.do")
	public String Store_Info() {

		return "Store_Info";
	}

	@RequestMapping(value = "/Staff.do")
	public String Staff() {

		return "Staff";
	}

	@RequestMapping(value = "/Coupon.do")
	public String Coupon() {

		return "Coupon";
	}

	/** footer 끝 */




}
