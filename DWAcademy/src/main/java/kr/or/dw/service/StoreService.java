package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.ProductVO;

public interface StoreService {

	//상품 구분별로 가져오는 메서드
	List<ProductVO> selectProDiv(String CategoryIdx) throws SQLException;

	//상품 상세정보 가져오는 메서드
	ProductVO selectProDetail(String product_cd) throws SQLException;

}
