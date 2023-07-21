package kr.or.dw.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CouponDAO {

	/**
	 * 오늘 생일인사람 조회하는 메서드
	 * @return
	 */
	String[] selectBirthMem() throws SQLException;

	/**
	 * 생일인 사람한테 생일축하 쿠폰 넣어주는 메서드
	 * @param mem
	 * @throws SQLException
	 */
	void insertBirthCoupon(String mem) throws SQLException;

}
