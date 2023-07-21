package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PointVO;
import kr.or.dw.vo.ProductVO;

@Mapper
public interface StoreDAO {

	List<ProductVO> selectProDiv(String CategoryIdx) throws SQLException;

	ProductVO selectProDetail(String product_cd) throws SQLException;

	/**
	 * 결제상세테이블에 데이터 넣는 메서드
	 * @param payDetail
	 * @throws SQLException
	 */
	void insertPayDetail(PayDetailVO payDetail) throws SQLException;

	/**
	 * 회원 결제 테이블에 데이터 넣는 메서드
	 * @param memBuy
	 * @throws SQLException
	 */
	void insertMemBuy(MemBuyVO memBuy) throws SQLException;

	/**
	 * 상품 구매 후 정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	Map<String, Object> selectBuyResult(String merchant_uid);

	/**
	 * 선물 결제 후 문자전송을 위한 데이터 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	Map<String, Object> selectGiftInfo(String merchant_uid);

	/**
	 * 상품 선물할때 회원 결제 테이블에 데이터 넣는 메서드
	 * @param payDetail
	 * @throws SQLException
	 */
	void insertPayDetailG(PayDetailVO payDetail) throws SQLException;

	/**
	 * 회원 상품 테이블에 추가하는 메서드
	 * @param param
	 */
	void insertMemPro(Map<String, String> param) throws SQLException;

	/**
	 * 회원 포인트 적립, 사용 리스트 가져오는 메서드
	 * @param mem_cd
	 * @return
	 * @throws SQLException
	 */
	List<PointVO> selectMemPointList(String mem_cd) throws SQLException;

	/**
	 * 포인트 사용 메서드
	 * @param pointVO
	 */
	void useMemPoint(PointVO pointVO) throws SQLException;

}
