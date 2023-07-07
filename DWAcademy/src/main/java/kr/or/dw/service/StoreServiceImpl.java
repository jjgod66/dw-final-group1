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
	public List<ProductVO> selectProDiv(String CategoryIdx) throws SQLException {
		List<ProductVO> productList = null;
		
		productList = storeDAO.selectProDiv(CategoryIdx);
		
		return productList;
	}

	@Override
	public ProductVO selectProDetail(String product_cd) throws SQLException {
		ProductVO product = null;
		product = storeDAO.selectProDetail(product_cd);
		
		return product;
	}

}
