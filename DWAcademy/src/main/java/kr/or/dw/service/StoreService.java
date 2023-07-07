package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.ProductVO;

public interface StoreService {

	List<ProductVO> selectProDiv(String categoryIdx) throws SQLException;

}
