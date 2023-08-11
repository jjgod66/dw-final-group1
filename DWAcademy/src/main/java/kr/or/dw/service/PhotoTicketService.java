package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PhotoTicketVO;

public interface PhotoTicketService {

	/**
	 * 포토티켓 만들 때 필요한 영화 정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getMovieInfo(String merchant_uid) throws SQLException;

	/**
	 * 포토티켓 결제
	 * @param payDetail
	 * @param photoTicket
	 * @throws SQLException
	 */
	void payPhotoTicket(PayDetailVO payDetail, PhotoTicketVO photoTicket) throws SQLException;

	/**
	 * 포토티켓 미리보기 할 때 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	PhotoTicketVO getPhotoTicketMyMerUID(String merchant_uid) throws SQLException;

	/**
	 * 출력완료로 전환
	 * @param pt_cd
	 * @throws SQLException
	 */
	void updateGbPrint(String pt_cd) throws SQLException;

	/**
	 * 이미 출력한 포토티켓인지 확인하는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	String getGbPrintYN(String merchant_uid) throws SQLException;

}
