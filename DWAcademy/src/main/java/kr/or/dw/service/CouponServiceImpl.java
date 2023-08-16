package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.CouponDAO;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MemberVO;

public class CouponServiceImpl implements CouponService{
	
	@Autowired
	private CouponDAO couponDAO;

	@Override
	public void insertBirthCoupon() throws SQLException {
		String[] memList = null;
		memList = couponDAO.selectBirthMem();
		for(String mem : memList) {
			
			couponDAO.insertBirthCoupon(mem);
		}
		
	}

	@Override
	public Map<String, Object> selectAllCoupon(SearchCriteria cri, String mem_cd) throws SQLException {
		List<Map<String, Object>> couponList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		couponList = couponDAO.selectAllCoupon(cri, rowBounds, mem_cd);
		int totalCount = couponDAO.selectAllCouponCnt(cri, mem_cd);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("totalCount", totalCount);
		dataMap.put("couponList", couponList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
}
