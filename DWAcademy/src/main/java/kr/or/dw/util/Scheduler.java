package kr.or.dw.util;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kr.or.dw.service.CouponService;
import kr.or.dw.service.PointService;

public class Scheduler {

	@Autowired
	PointService pointService;
	
//	@Scheduled(cron = "0 10 12 ? * *")
//	public void insertMoviePoint() throws SQLException {
//		pointService.insertMoviePoint();
//	}
	
	@Autowired
	private CouponService couponService;
	
//	@Scheduled(cron = "0 8 16 ? * *")
//	public void insertBirthCoupon() throws SQLException {
//		couponService.insertBirthCoupon();
//	}
	
	
}
