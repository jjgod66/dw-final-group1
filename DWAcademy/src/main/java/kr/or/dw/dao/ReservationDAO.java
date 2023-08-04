package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.Non_MemberVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PointVO;
import kr.or.dw.vo.ReservationVO;
import kr.or.dw.vo.ScreenVO;

@Mapper
public interface ReservationDAO {

	/**
	 * 모든 영화관정보를 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectAllTheater() throws SQLException;

	/**
	 * 영화를 상영하는 지점 리스트를 가져오는 메서드
	 * @param movie_cd
	 * @param date 
	 * @return
	 */
	List<Map<String, String>> selectMovieTheater(Map<String, String> data) throws SQLException;

	/**
	 * 영화코드, 날짜, 지점에 따른 상영 시간표 가져오는 메서드
	 * @param data
	 * @return
	 */
	List<Map<String, Object>> selectScreenSchedual(Map<String, Object> data) throws SQLException;

	/**
	 * 상영영화가 얼마나 예매되었는지 숫자를 가져오는 메서드
	 * @param screen_cd
	 * @return
	 * @throws SQLException
	 */
	int buySeatCount(String screen_cd) throws SQLException;

	/**
	 * 상영영화 정보를 가져오는 메서드
	 * @param screen_cd
	 * @return
	 */
	Map<String, Object> selectScreen(String screen_cd) throws SQLException;

	/**
	 * 상영중인 영화의 리스트를 가져오는 메서드
	 * @return
	 */
	List<MovieVO> selectAllMovieRes() throws SQLException;

	/**
	 * 예매된 좌석 리스트 가져오는 메서드
	 * @param screen_cd
	 * @return
	 */
	List<String> selectBuySeatList(String screen_cd);

	/**
	 * 예매할 영화 정보를 가져오는 메서드
	 * @param screen_cd
	 * @return
	 */
	Map<String, Object> selectPaymentScreenInfo(String screen_cd);

	/**
	 * 예매정보 넣는 메서드
	 * @param res
	 * @throws SQLException
	 */
	void insertRes(ReservationVO res) throws SQLException;

	/**
	 * 예매 후 결제 상세테이블 넣는 메서드
	 * @param payDetail
	 * @throws SQLException
	 */
	void insertPayDetail(PayDetailVO payDetail) throws SQLException;

	/**
	 * merchant_uid로 예매정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	List<ReservationVO> selectReservationByMUID(String merchant_uid) throws SQLException;


	/**
	 * 결제 상세정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	PayDetailVO selectPayDetailByMUID(String merchant_uid) throws SQLException;

	/**
	 * 회원 쿠폰 리스트 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<CouponVO> selectCouponList(String mem_cd) throws SQLException;

	/**
	 * 쿠폰사용하는 메서드
	 * @param mem_coupon_no
	 */
	void useMemCoupon(int mem_coupon_no) throws SQLException;

	/**
	 * 총 결제 금액이 0원일때 처리해주는 메서드
	 * @param res
	 * @throws SQLException
	 */
	void insertPay0Res(ReservationVO res) throws SQLException;

	/**
	 * 회원 포인트 적립, 사용 내역 리스트 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<PointVO> selectMemPointList(String mem_cd) throws SQLException;

	/**
	 * 영화예매시 포인트 사용하는 메서드
	 * @param point
	 */
	void useMemPoint(PointVO point) throws SQLException;

	/**
	 * 회원 선호극장 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<String> selectMemLikeThr(String mem_cd) throws SQLException;

	/**
	 * 예매 후 보낼 문자에 필요한 정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	List<Map<String, Object>> selectResSMSInfo(String merchant_uid) throws SQLException;

	/**
	 * 비회원 추가
	 * @param non_mem
	 * @throws SQLException
	 */
	void insertNonMem(Non_MemberVO non_mem) throws SQLException;

	/**
	 * 비회원 예매 후 문자 보낼 때 필용한 정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectNonMemResSMSInfo(String merchant_uid) throws SQLException;

}
