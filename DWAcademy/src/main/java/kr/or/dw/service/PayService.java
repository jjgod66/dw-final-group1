package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

public interface PayService {

	String getToken();
	
	String refundSer(String imp_uid);

	/**
	 * 환불
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	String refund(String merchant_uid) throws SQLException;

	/**
	 * 결제 정보
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getPayInfo(String merchant_uid) throws SQLException;

	/**
	 * 포토티켓 환불
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	String ptRefund(String merchant_uid) throws SQLException;
}
