package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dw.service.PayService;

@Controller
@RequestMapping("/pay")
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private PayService payService;
	
	@RequestMapping("/refund")
	public ResponseEntity<String> refund(String merchant_uid){
		ResponseEntity<String> entity = null;
		
		String result = "F";
		try {
			result = payService.refund(merchant_uid);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/creInfo")
	public ResponseEntity<Map<String, Object>> creInfo(String merchant_uid){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> creInfo = null;
		
		try {
			creInfo = payService.getPayInfo(merchant_uid);
			entity = new ResponseEntity<Map<String,Object>>(creInfo, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	
	@RequestMapping("/ptrefund")
	public ResponseEntity<String> ptrefund(String merchant_uid){
ResponseEntity<String> entity = null;
		
		String result = "F";
		try {
			result = payService.ptRefund(merchant_uid);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/buyCreInfo")
	public ResponseEntity<Map<String, Object>> buyCreInfo(String mem_product_cd){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> buyCreInfo = null;
		try {
			buyCreInfo = payService.getBuyCreInfo(mem_product_cd);
			entity = new ResponseEntity<Map<String,Object>>(buyCreInfo, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
