package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import kr.or.dw.dao.PayDAO;
import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.ReservationVO;

public class PayServiceImpl implements PayService{

	@Autowired
	private PayDAO payDAO;
	
RestTemplate restTemplate = new RestTemplate();
	
	


	@Override
	public String getToken() {
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
		
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("imp_key", "0488517382654157");
	    map.put("imp_secret", "2KkMRgP1zhtrhqZnWWY3deZBg4pxsgJLb3VJhRGm9y3dkWvqulOdt9Vcmy4Zolgge8OkauqJJdY1MkpU");
	    
	   
	    Gson gson = new Gson();
	    String json=gson.toJson(map);
		//서버로 요청할 Body
	   
	    HttpEntity<String> entity = new HttpEntity<>(json,headers);
		return restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
	}

	@Override
	public String refundSer(String imp_uid) {
		String result = "";
		try {
			String token = this.getToken();
			if(token == null) {
				throw new Exception();
			}
			String[] tokenList = token.split("\"");
			token = tokenList[9];
			System.out.println(token);
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", token);
			
			Map<String, Object> map = new HashMap<>();
			map.put("imp_uid", imp_uid);
			
			Gson gson = new Gson();
		    String json=gson.toJson(map);
		     
			HttpEntity<Map<String, Object>> entity = new HttpEntity<>(map, headers);
			String refund = restTemplate.postForObject("http://api.iamport.kr/payments/cancel", entity, String.class);
			

			System.out.println(refund);
			result = refund;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("환불에 실패했습니다.");
			result = "F";
		}
		
		return result;
		
	}

	@Override
	public String refund(String merchant_uid) throws SQLException {
		String result = "F";
		
		String imp_uid = "";
		imp_uid = payDAO.selectImpUidByMerUid(merchant_uid);
		result = refundSer(imp_uid);
		
		if(!result.equals("F")) {
			payDAO.refundPayDetail(merchant_uid);
			if(merchant_uid.substring(0, 1).equals("M")) {
				payDAO.refundReservation(merchant_uid);
				ReservationVO res = null;
				res = payDAO.selectResCouPoint(merchant_uid);
				if(res.getMem_coupon_no() != 0) {
					int coupon_no = res.getMem_coupon_no();
					payDAO.returnCoupon(coupon_no);
				}
				if(res.getUse_point() != 0) {
					payDAO.returnPoint(merchant_uid);
				}
				
			}else {
				payDAO.refundMemBuy(merchant_uid);
				MemBuyVO memBuy = null;
				memBuy = payDAO.selectBuyPoint(merchant_uid);
				if(memBuy.getUse_point() != 0) {
					payDAO.returnPoint(merchant_uid);
				}
			}
		}
		
		
		
		return result;
	}

	@Override
	public Map<String, Object> getPayInfo(String merchant_uid) throws SQLException {
		Map<String, Object> creInfo = null;
		
		creInfo = payDAO.selectPayDetail(merchant_uid);
		
		Map<String, Object> creInfo2 = null;
		if(merchant_uid.substring(0, 1).equals("M")) {
			creInfo2 = payDAO.selectResInfo(merchant_uid);
		}else {
			creInfo2 = payDAO.selectBuyInfo(merchant_uid);
		}
		
		creInfo.put("DISCOUNT", creInfo2.get("DISCOUNT"));
		creInfo.put("PAYDATE", creInfo2.get("PAYDATE"));
		creInfo.put("GB_CANCEL", creInfo2.get("GB_CANCEL"));
		creInfo.put("PRICESUM", creInfo2.get("PRICESUM"));
		
		return creInfo;
	}

	@Override
	public String ptRefund(String merchant_uid) throws SQLException {
		String imp_uid = "";
		imp_uid = payDAO.selectPTImpUidByMerUid(merchant_uid);
		String result = "F";
		result = refundSer(imp_uid);
		if(!result.equals("F")) {
			payDAO.refundPayDetailImpUid(imp_uid);
			payDAO.deletePhotoTicket(merchant_uid);
		}
		
		return result;
	}
}
