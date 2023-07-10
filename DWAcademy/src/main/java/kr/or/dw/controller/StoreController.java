package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.StoreService;
import kr.or.dw.vo.ProductVO;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService storeService;

	/*
	 * 스토어 뷰어 컨트롤러 
	 */
	@RequestMapping("/index")
	public ModelAndView storeIndex(ModelAndView mnv, String CategoryIdx) throws SQLException {
		String url = "/store/index";
		
		List<ProductVO> productList = null;
		productList = storeService.selectProDiv(CategoryIdx);
		
		mnv.addObject("productList", productList);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/detail")
	public ModelAndView storeDetail(ModelAndView mnv, String product_cd) throws SQLException {
		String url = "/store/detail";
		
		ProductVO product = null;
		product = storeService.selectProDetail(product_cd);
		
		mnv.addObject("product", product);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/buyForm")
	public ModelAndView buyForm(ModelAndView mnv, String product_cd, int amount) {
		String url = "/store/buyForm";
		
		
		return mnv;
	}
}
