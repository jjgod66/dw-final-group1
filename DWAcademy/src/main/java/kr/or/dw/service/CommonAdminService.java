package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.Admin_NoteVO;

public interface CommonAdminService {

	// 쪽지를 보낼 수 있는 극장 리스트를 불러온다. 
	List<Map<String, Object>> selectThrList(String admin_cd) throws SQLException;

	// 쪽지를 보낸다.
	void sendNote(Admin_NoteVO note) throws SQLException;

	// 받은 쪽지 리스트를 불러온다.
	Map<String, Object> selectReceivedNoteList(Map<String, Object> dataMap) throws SQLException;

	// 보낸 쪽지 리스트를 불러온다.
	Map<String, Object> selectSendedNoteList(Map<String, Object> dataMap) throws SQLException;

	// 쪽지를 조회한다.
	Map<String, Object> selectNoteByNote_no(Map<String, Object> data) throws SQLException;

	// 쪽지를 지운다.
	void deleteNote(Map<String, Object> data) throws SQLException;

	// 아직 읽지않은 쪽지 수를 가져온다.
	int selectUnreadedNoteCnt(String admin_cd) throws SQLException;

//	// 해당 검색에 대한 영화 통계를 가져온다.
//	List<Map<String, Object>> selectStatisticsMovie() throws SQLException;

	// 해당 검색에 대한 영화 통계를 가져온다.
	Map<String, Object> selectStatisticsMovie(SearchCriteria cri) throws SQLException;

	// 검색창에 쓴 텍스트기반 영화 검색
	List<Map<String, Object>> selectBySearchMovieName(String searchText) throws SQLException;

	// 검색에 대한 해당 영화 통계를 가져온다.
	Map<String, Object> selectStatisticsMovieByMovieName(SearchCriteria cri) throws SQLException;
	
}
