package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.or.dw.command.GiftSMSCommand;
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
		if(CategoryIdx == null) {
			CategoryIdx = "1";
		}
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
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		int point = 0;
		point = storeService.getPoint(mem_cd);
		
		mnv.addObject("point", point);
		mnv.addObject("member", member);
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
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		int point = 0;
		point = storeService.getPoint(mem_cd);
		
		mnv.addObject("point", point);
		mnv.addObject("member", member);
		mnv.addObject("product", product);
		mnv.addObject("amount", amount);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("buySuccess")
	public ModelAndView buySuccess(ModelAndView mnv, String merchant_uid) throws SQLException {
		String url = "/store/buyResult";
		
		Map<String, Object> mapData = null;
		mapData = storeService.getBuyResultByMUID(merchant_uid);
		
		mnv.addObject("mapData", mapData);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/buyResultRedirect")
	public String buyResultRedirect(StoreBuyCommand sbc, HttpSession session, HttpServletRequest req) throws SQLException {
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		String merchant_uid = buyResult(sbc, mem_cd);

		return "redirect:/store/buySuccess.do?merchant_uid=" + merchant_uid;
	
	}
	
	public String buyResult(StoreBuyCommand sbc, String mem_cd) throws SQLException {
		Gson gson = new Gson();
		PayDetailVO payDetail = gson.fromJson(sbc.getJson(), PayDetailVO.class);
		
		MemBuyVO memBuy = new MemBuyVO();
		memBuy.setAmount(sbc.getAmount());
		memBuy.setMem_cd(mem_cd);
		memBuy.setPricesum(sbc.getPricesum());
		memBuy.setMerchant_uid(payDetail.getMerchant_uid());
		memBuy.setProduct_cd(sbc.getProduct_cd());
		memBuy.setDiscount(sbc.getDiscount());
		memBuy.setUse_point(sbc.getUse_point());
		String merchant_uid = null;
		merchant_uid = storeService.insertMemBuyGetMUID(payDetail, memBuy);
		return merchant_uid;
		
		
	}
	
	@RequestMapping("/buy0ResultRedirect")
	public String buy0ResultRedirect(StoreBuyCommand sbc, HttpSession session, HttpServletRequest req) throws SQLException{
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		String merchant_uid = buy0Result(sbc, mem_cd);
		
		return "redirect:/store/buySuccess.do?merchant_uid=" + merchant_uid;
	}
	
	public String buy0Result(StoreBuyCommand sbc, String mem_cd) throws SQLException{
		
		MemBuyVO memBuy = new MemBuyVO();
		memBuy.setAmount(sbc.getAmount());
		memBuy.setMem_cd(mem_cd);
		memBuy.setPricesum(sbc.getPricesum());
		memBuy.setMerchant_uid(sbc.getMerchant_uid());
		memBuy.setProduct_cd(sbc.getProduct_cd());
		memBuy.setDiscount(sbc.getDiscount());
		memBuy.setUse_point(sbc.getUse_point());
		String merchant_uid = null;
		
		merchant_uid = storeService.insertMemBuy0GetMUID(memBuy);
		
		return merchant_uid;
	}
	
	@RequestMapping("/gift0ResultRedirect")
	public ModelAndView gift0ResultRedirect(ModelAndView mnv, StoreBuyCommand sbc, HttpSession session) throws SQLException{
		String url = "/store/giftSMS";
		Map<String, Object> dataMap = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		dataMap = gift0Result(sbc, mem_cd);
		
		GiftSMSCommand gsc = new GiftSMSCommand();
		gsc.setMem_name(((MemberVO) session.getAttribute("loginUser")).getMem_name());
		gsc.setMerchant_uid((String) dataMap.get("MERCHANT_UID"));
		gsc.setProduct_name((String) dataMap.get("PRODUCT_NAME"));
		gsc.setProduct_period(Integer.parseInt(String.valueOf(dataMap.get("PRODUCT_PERIOD"))));
		gsc.setToname(sbc.getToname());
		gsc.setTophone(sbc.getTophone());
		
		mnv.addObject("giftInfo", gsc);
		mnv.setViewName(url);
		return mnv;
	}
	
	public Map<String, Object> gift0Result(StoreBuyCommand sbc, String mem_cd) throws SQLException{
		
		MemBuyVO memBuy = new MemBuyVO();
		memBuy.setAmount(sbc.getAmount());
		memBuy.setMem_cd(mem_cd);
		memBuy.setPricesum(sbc.getPricesum());
		memBuy.setMerchant_uid(sbc.getMerchant_uid());
		memBuy.setProduct_cd(sbc.getProduct_cd());
		memBuy.setDiscount(sbc.getDiscount());
		memBuy.setUse_point(sbc.getUse_point());
		
		Map<String, Object> dataMap = null;
		
		
		dataMap = storeService.insertMemgift0GetMUID(memBuy);
		
		return dataMap;
	}
	
	@RequestMapping("/giftResult")
	public ModelAndView giftResult(StoreBuyCommand sbc, HttpSession session, ModelAndView mnv) throws SQLException {
		System.out.println("con1");
		String url = "/store/giftSMS";
		Map<String, Object> dataMap = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		dataMap = giftResultMap(sbc, mem_cd);
		System.out.println("con2");

		GiftSMSCommand gsc = new GiftSMSCommand();
		gsc.setMem_name((String)((Map<String, Object>) session.getAttribute("loginUser")).get("mem_name"));
		gsc.setMerchant_uid((String) dataMap.get("MERCHANT_UID"));
		gsc.setProduct_name((String) dataMap.get("PRODUCT_NAME"));
		gsc.setProduct_period(Integer.parseInt(String.valueOf(dataMap.get("PRODUCT_PERIOD"))));
		gsc.setToname(sbc.getToname());
		gsc.setTophone(sbc.getTophone());

		mnv.addObject("giftInfo", gsc);
		mnv.setViewName(url);
		return mnv;
	
	}
	
	public Map<String, Object> giftResultMap(StoreBuyCommand sbc, String mem_cd) throws SQLException {
		Gson gson = new Gson();
		PayDetailVO payDetail = gson.fromJson(sbc.getJson(), PayDetailVO.class);
		
		MemBuyVO memBuy = new MemBuyVO();
		memBuy.setAmount(sbc.getAmount());
		memBuy.setMem_cd(mem_cd);
		memBuy.setPricesum(sbc.getPricesum());
		memBuy.setMerchant_uid(payDetail.getMerchant_uid());
		memBuy.setProduct_cd(sbc.getProduct_cd());
		memBuy.setDiscount(sbc.getDiscount());
		memBuy.setUse_point(sbc.getUse_point());
		Map<String, Object> dataMap = null;
		dataMap = storeService.insertMemGiftGetMUID(payDetail, memBuy);
		return dataMap;
		
		
	}
	
	@RequestMapping("/giftSuccess")
	public String giftSuccess(String merchant_uid, HttpServletRequest req) throws SQLException {

		return "redirect:/store/buySuccess.do?merchant_uid=" + merchant_uid;
	}
}
