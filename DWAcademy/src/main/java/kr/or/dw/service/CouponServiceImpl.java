package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

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
	public List<Map<String, Object>> selectAllCoupon(SearchCriteria cri, String mem_cd) throws SQLException {
		return couponDAO.selectAllCoupon(cri, mem_cd);
	}
}
