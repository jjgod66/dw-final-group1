package kr.or.dw.service;

import java.sql.SQLException;

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
}
