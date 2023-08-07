package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.EventVO;

public interface EventService {

	/**
	 * 영화 이벤트 4개 가져오는 메서드
	 * @return
	 */
	List<EventVO> getMovieEvent4() throws SQLException;

	/**
	 * 극장 이벤트 4개 가져오는 메서드
	 * @return
	 */
	List<EventVO> getTheaterEvent4() throws SQLException;

	/**
	 * 무대인사/ 시사회 이벤트 4개 가져오는 메서드
	 * @return
	 */
	List<EventVO> getStageEvent4() throws SQLException;

	/**
	 * 이벤트 상세보기
	 * @param event_no
	 * @return
	 */
	EventVO getEventDetail(int event_no) throws SQLException;

	/**
	 * 영화 이벤트 리스트
	 * @param cri
	 * @return
	 */
	Map<String, Object> getMovieEventList(SearchCriteria cri) throws SQLException;

	/**
	 * 극장 이벤트 리스트
	 * @param cri
	 * @return
	 */
	Map<String, Object> getTheaterEventList(SearchCriteria cri) throws SQLException;

	/**
	 * 시사회/무대인사 이벤트 리스트
	 * @param cri
	 * @return
	 */
	Map<String, Object> getStageEventList(SearchCriteria cri) throws SQLException;

	/**
	 * 지난 이벤트 가져오는 메서드
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getPastEventList(SearchCriteria cri) throws SQLException;

	/**
	 * 이벤트 당첨자 발표 게시글 
	 * @param event_no
	 * @return
	 * @throws SQLException
	 */
	EventVO getEventWinner(int event_no) throws SQLException;

	/**
	 * 전체 이벤트 중 4개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> getEvent4() throws SQLException;

	List<EventVO> getEvent2() throws SQLException;

}
