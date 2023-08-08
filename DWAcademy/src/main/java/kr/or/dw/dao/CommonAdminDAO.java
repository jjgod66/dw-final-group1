package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.Admin_NoteVO;

@Mapper
public interface CommonAdminDAO {

	// 쪽지를 보낼 수 있는 극장 리스트를 불러온다.
	List<Map<String, Object>> selectThrList(String admin_cd) throws SQLException;

	// 쪽지를 보낸다.
	void insertNote(Admin_NoteVO note) throws SQLException;

	// 받은 쪽지 리스트를 불러온다.
	List<Map<String, Object>> selectReceivedNoteList(Map<String, Object> dataMap) throws SQLException;

	// 받은 쪽지 리스트 총 개수를 불러온다.
	int selectReceivedNoteListCount(String admin_cd) throws SQLException;

	// 보낸 쪽지 리스트를 불러온다.
	List<Map<String, Object>> selectSendedNoteList(Map<String, Object> dataMap) throws SQLException;
	
	// 보낸 쪽지 리스트 총 개수를 불러온다.
	int selectSendedNoteListCount(String string) throws SQLException;

	// 쪽지를 조회한다.
	Map<String, Object> selectNoteByNote_no(Map<String, Object> data) throws SQLException;

	// 쪽지를 지운다.
	void deleteNote(Map<String, Object> data) throws SQLException;

	// 열람했다고 체크
	void updateGb_read(Map<String, Object> data) throws SQLException;

	// 아직 읽지않은 쪽지 수를 가져온다.
	int selectUnreadedNoteCnt(String admin_cd) throws SQLException;

	// 해당 검색에 대한 영화 통계를 가져온다.
	List<Map<String, Object>> selectStatisticsMovie() throws SQLException;

	List<Map<String, Object>> selectStatisticsMovieList(SearchCriteria cri) throws SQLException;

	int selectStatisticsMovieListCount(SearchCriteria cri) throws SQLException;

	
}
