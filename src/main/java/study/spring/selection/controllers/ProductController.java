package study.spring.selection.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.selection.model.Product;
import study.spring.selection.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	/** 상품목록 */
	@RequestMapping(value = "/Acc.do", method = RequestMethod.GET)
	public ModelAndView productList(ModelAndView mav) {
		mav.setViewName("Acc");
		mav.addObject("list", service.productList());
		return mav;
	}
	
	/** 상품상세 */
	@RequestMapping(value = "/AccDetail.do/{product_no}", method = RequestMethod.GET)
	public ModelAndView productDetail(@PathVariable("product_no") int product_no, ModelAndView mav) {
		mav.setViewName("Detail");
		mav.addObject("product", service.productDetail(product_no));
		return mav;
	}
}
