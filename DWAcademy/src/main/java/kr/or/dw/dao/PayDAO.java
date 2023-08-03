package kr.or.dw.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayDAO {

	/**
	 * merchant_uid로 imp_uid 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	String selectImpUidByMerUid(String merchant_uid) throws SQLException;

	/**
	 * payDetail 환불
	 * @param merchant_uid
	 */
	void refundPayDetail(String merchant_uid) throws SQLException;

	/**
	 * reservation환불
	 * @param merchant_uid
	 */
	void refundReservation(String merchant_uid) throws SQLException;

	/**
	 * membuy 환불
	 * @param merchant_uid
	 */
	void refundMemBuy(String merchant_uid) throws SQLException;


}
