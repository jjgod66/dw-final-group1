package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.ReservationVO;

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

	/**
	 * 결제 정보 payDetail
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> selectPayDetail(String merchant_uid) throws SQLException;

	/**
	 * 예매 결제 정보
	 * @param merchant_uid
	 * @return
	 */
	Map<String, Object> selectResInfo(String merchant_uid) throws SQLException;

	/**
	 * 구매 결제 정보
	 * @param merchant_uid
	 * @return
	 */
	Map<String, Object> selectBuyInfo(String merchant_uid) throws SQLException;

	/**
	 * 예매할 때 사용한 쿠폰, 포인트 정보
	 * @param merchant_uid
	 * @return
	 */
	ReservationVO selectResCouPoint(String merchant_uid) throws SQLException;

	/**
	 * 결제할 때 사용한 포인트 정보
	 * @param merchant_uid
	 * @return
	 */
	MemBuyVO selectBuyPoint(String merchant_uid) throws SQLException;

	/**
	 * 환불할 때 쿠폰 돌려주기
	 * @param coupon_no
	 */
	void returnCoupon(int coupon_no) throws SQLException;

	/**
	 * 환불할 때 포인트 돌려주기
	 * @param merchant_uid
	 */
	void returnPoint(String merchant_uid) throws SQLException;

	/**
	 * 예매코드로 해당 예매의 포토티켓 결제 imp_uid 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	String selectPTImpUidByMerUid(String merchant_uid) throws SQLException;

	/**
	 * imp_uid로 환불
	 * @param imp_uid
	 * @throws SQLException
	 */
	void refundPayDetailImpUid(String imp_uid) throws SQLException;

	/**
	 * 포토티켓 삭제
	 * @param merchant_uid
	 * @throws SQLException
	 */
	void deletePhotoTicket(String merchant_uid) throws SQLException;


}
