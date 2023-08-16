package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MemberVO;

public interface CouponService {

	/**
	 * 생일축하쿠폰 주는 메서드
	 */
	void insertBirthCoupon() throws SQLException;

	/**
	 * 회원의 보유 쿠폰가져오기
	 * @param cri 
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> selectAllCoupon(SearchCriteria cri, String mem_cd) throws SQLException;

}
