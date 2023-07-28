package kr.or.dw.util;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kr.or.dw.service.CouponService;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.PointService;
import kr.or.dw.service.SysAdminService;

public class Scheduler {

	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;
	
	@Autowired
	PointService pointService;
	
	//상영 다음날 해당 영화 예매한 회원들한테 포인트 적립해주는 스케줄러
//	@Scheduled(cron = "0 0 0 ? * *")
//	public void insertMoviePoint() throws SQLException {
//		pointService.insertMoviePoint();
//	}
	
	@Autowired
	private CouponService couponService;
	
	//해당일에 생일인 회원에게 생일축하 쿠폰 넣어주는 스케줄러
//	@Scheduled(cron = "0 0 0 ? * *")
//	public void insertBirthCoupon() throws SQLException {
//		couponService.insertBirthCoupon();
//	}
	
	@Autowired
	private MemberService memberService;
	
	//매달 1일 전달에 예매를 10번이상 한 회원 VIP로 업그레이드 헤주는 스케줄러
//	@Scheduled(cron = "0 0 0 1 ? *")
//	public void updateMemgrade() throws SQLException {
//		memberService.updateMemgrade();
//	}
	
	//로그인 한 지 1년 지난 회원 휴면계정으로 전환시키는 스케줄러
//	@Scheduled(cron = "0 0 0 ? * *")
//	public void memSleep() throws SQLException {
//		memberService.sleepMem();
//	}
	
//	@Scheduled(cron = "0 0 4 ? * *")
//	public void removeTempImg() throws IOException {
//		File directory = new File(eventPicUploadPath + File.separator + "temp");
//		FileUtils.cleanDirectory(directory);
//	}

//	@Scheduled(cron = "0 0 4 ? * *")
//	public void unbanMember() throws SQLException {
//		memberService.unbanMember();
//	}
}
