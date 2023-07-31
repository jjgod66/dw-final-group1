package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.EventVO;

@Mapper
public interface EventDAO {

	/**
	 * 영화 이벤트 최신순으로 4개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectMoiveEvent4() throws SQLException;

	/**
	 * 극장 이벤트 최신순으로 4개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectTheaterEvent4() throws SQLException;

	/**
	 * 시사회/무대인사 이벤트 최신순으로 4개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectStageEvent4() throws SQLException;

	/**
	 * 이벤트 상세보기
	 * @param event_no
	 * @return
	 * @throws SQLException
	 */
	EventVO selectEventDetail(int event_no) throws SQLException;

	/**
	 * 영화 이벤트 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 */
	List<EventVO> selectMovieEventList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 영화 이벤트 리스트 갯수
	 * @param cri
	 * @return
	 */
	int selectMovieEventListCount(SearchCriteria cri) throws SQLException;
	
	/**
	 * 극장 이벤트 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 */
	List<EventVO> selectTheaterEventList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 극장 이벤트 리스트 갯수
	 * @param cri
	 * @return
	 */
	int selectTheaterEventListCount(SearchCriteria cri) throws SQLException;

	/**
	 * 시사회/무대인사 이벤트 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 */
	List<EventVO> selectStageEventList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 시사회/무대인사 이벤트 리스트 갯수
	 * @param cri
	 * @return
	 */
	int selectStageEventListCount(SearchCriteria cri) throws SQLException;

	/**
	 * 지난이벤트 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<EventVO> selectPastEventList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 지난 이벤트 갯수
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectPastEventListCount(SearchCriteria cri) throws SQLException;

	/**
	 * 이벤트 당첨자 게시글
	 * @param event_no
	 * @return
	 * @throws SQLException
	 */
	EventVO selectEventWinner(int event_no) throws SQLException;

}
