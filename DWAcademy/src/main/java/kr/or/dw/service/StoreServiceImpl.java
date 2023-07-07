package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.StoreDAO;
import kr.or.dw.vo.ProductVO;

public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public List<ProductVO> selectProDiv(String categoryIdx) throws SQLException {
		List<ProductVO> productList = null;
		
		productList = storeDAO.selectProDiv(categoryIdx);
		
		return productList;
	}

}
