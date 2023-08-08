package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.ProductVO;

public interface StoreService {

	//상품 구분별로 가져오는 메서드
	List<ProductVO> selectProDiv(String CategoryIdx) throws SQLException;

	//상품 상세정보 가져오는 메서드
	ProductVO selectProDetail(String product_cd) throws SQLException;

	/**
	 * 구매 정보 넣어주고 merchant_uid 가져오는 메서드
	 * @param payDetail
	 * @param memBuy
	 * @return
	 * @throws SQLException
	 */
	String insertMemBuyGetMUID(PayDetailVO payDetail, MemBuyVO memBuy) throws SQLException;

	/**
	 * 상품 구매 후 정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 */
	Map<String, Object> getBuyResultByMUID(String merchant_uid) throws SQLException;

	/**
	 * 상품 선물하기 정보 넣어주고 정보 가져오는 메서드
	 * @param payDetail
	 * @param memBuy
	 * @return
	 */
	Map<String, Object> insertMemGiftGetMUID(PayDetailVO payDetail, MemBuyVO memBuy) throws SQLException;

	/**
	 * 회원 포인트 잔액 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	int getPoint(String mem_cd) throws SQLException;
	
	/**
	 * 구매 결제 금액이 0원일 때 memBuy에 넣는 메서드
	 * @param memBuy
	 * @return
	 * @throws SQLException
	 */
	String insertMemBuy0GetMUID(MemBuyVO memBuy) throws SQLException;

	/**
	 * 선물 결제 금액이 0원일 때 memBuy에 넣는 메서드
	 * @param memBuy
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> insertMemgift0GetMUID(MemBuyVO memBuy) throws SQLException;

	List<ProductVO> getproductFood() throws SQLException;

}
