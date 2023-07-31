package kr.or.dw.service;

import java.sql.SQLException;

import kr.or.dw.vo.CouponVO;

public interface CouponService {

	/**
	 * 생일축하쿠폰 주는 메서드
	 */
	void insertBirthCoupon() throws SQLException;

	/**
	 * 회원의 보유 쿠폰가져오기
	 * @param mem_cd
	 * @return
	 */
	CouponVO selectCoupon(String mem_cd);

}
