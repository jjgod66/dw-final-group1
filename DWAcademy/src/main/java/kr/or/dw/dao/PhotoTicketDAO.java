package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PhotoTicketVO;

@Mapper
public interface PhotoTicketDAO {

	/**
	 * 포토티켓 만들 때 필요한 영화정보 가져오는 메서드
	 * @param merchant_uid
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> selectPTMovieInfo(String merchant_uid) throws SQLException;

	/**
	 * 포토티켓 결제 상세 등록
	 * @param payDetail
	 * @throws SQLException
	 */
	void insertPayDetailPhotoTicket(PayDetailVO payDetail) throws SQLException;

	/**
	 * 포토티켓 정보 넣기
	 * @param photoTicket
	 * @throws SQLException
	 */
	void insertPhotoTicket(PhotoTicketVO photoTicket) throws SQLException;

}
