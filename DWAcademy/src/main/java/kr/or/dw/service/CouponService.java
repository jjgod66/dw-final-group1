package kr.or.dw.service;

import java.sql.SQLException;

public interface CouponService {

	/**
	 * 생일축하쿠폰 주는 메서드
	 */
	void insertBirthCoupon() throws SQLException;

}
