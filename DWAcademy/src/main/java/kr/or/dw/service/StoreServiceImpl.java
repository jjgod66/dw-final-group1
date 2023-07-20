package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.StoreDAO;
import kr.or.dw.vo.MemBuyVO;
import kr.or.dw.vo.PayDetailVO;
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

	@Override
	public String insertMemBuyGetMUID(PayDetailVO payDetail, MemBuyVO memBuy) throws SQLException {

		storeDAO.insertPayDetail(payDetail);
		memBuy.setMerchant_uid(payDetail.getMerchant_uid());
		
		storeDAO.insertMemBuy(memBuy);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_cd", memBuy.getMem_cd());
		param.put("product_cd",memBuy.getProduct_cd());
		
		storeDAO.insertMemPro(param);
		
		return payDetail.getMerchant_uid();
	}

	@Override
	public Map<String, Object> getBuyResultByMUID(String merchant_uid) throws SQLException {
		Map<String, Object> mapData = null;
		mapData = storeDAO.selectBuyResult(merchant_uid);
		
		return mapData;
	}

	@Override
	public Map<String, Object> insertMemGiftGetMUID(PayDetailVO payDetail, MemBuyVO memBuy) throws SQLException {
		
		storeDAO.insertPayDetailG(payDetail);
		memBuy.setMerchant_uid(payDetail.getMerchant_uid());
		
		storeDAO.insertMemBuy(memBuy);
		
		Map<String, Object> mapData = null;
		mapData = storeDAO.selectGiftInfo(payDetail.getMerchant_uid());
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_cd", memBuy.getMem_cd());
		param.put("product_cd",memBuy.getProduct_cd());
		
		storeDAO.insertMemPro(param);
		
		return mapData;
	}

}
