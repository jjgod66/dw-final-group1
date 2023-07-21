package kr.or.dw.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.CouponDAO;

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
}
