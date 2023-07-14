package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.or.dw.command.StoreBuyCommand;
import kr.or.dw.service.StoreService;
import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.PayDetailVO;
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
	public ModelAndView buyForm(ModelAndView mnv, String product_cd, int amount, HttpSession session) throws SQLException {
		String url = "/store/buyForm";
		ProductVO product = null;
		product = storeService.selectProDetail(product_cd);
		
		mnv.addObject("member", (MemberVO) session.getAttribute("loginUser"));
		mnv.addObject("product", product);
		mnv.addObject("amount", amount);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/giftForm")
	public ModelAndView giftForm(ModelAndView mnv, String product_cd, int amount, HttpSession session) throws SQLException {
		String url = "/store/giftForm";
		ProductVO product = null;
		product = storeService.selectProDetail(product_cd);
		
		mnv.addObject("member", (MemberVO) session.getAttribute("loginUser"));
		mnv.addObject("product", product);
		mnv.addObject("amount", amount);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("paySuccess")
	public ModelAndView paySuccess(ModelAndView mnv) {
		String url = "/store/payResult";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/buyResultRedirect")
	public String buyResultRedirect(StoreBuyCommand sbc, HttpSession session) {
		
		return "redirect:/store/buySuccess.do?merchant_uid=";
	
	}
	
	public String buyResult(StoreBuyCommand sbc, HttpSession session) {
		Gson gson = new Gson();
		PayDetailVO payDetail = gson.fromJson(sbc.getJson(), PayDetailVO.class);
		
//		MemBuyVO memBuy = 
		
	}
}
