package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MemberVO;

@Mapper
public interface CouponDAO {

	/**
	 * 오늘 생일인사람 조회하는 메서드
	 * @return
	 */
	String[] selectBirthMem() throws SQLException;

	/**
	 * 생일인 사람한테 생일축하 쿠폰 넣어주는 메서드
	 * @param mem
	 * @throws SQLException
	 */
	void insertBirthCoupon(String mem) throws SQLException;

	/**
	 * 회원의 보유 쿠폰 조회
	 * @param cri 
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> selectAllCoupon(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

}
