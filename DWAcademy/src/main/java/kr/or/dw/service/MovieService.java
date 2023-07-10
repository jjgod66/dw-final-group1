package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.MovieViewerCommand;


public interface MovieService {

	/**
	 * 영화예매순으로 10개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException;

	/**
	 * 영화 상세페이지 메서드
	 * @param movie_cd
	 * @return
	 */
	MovieViewerCommand getMovieView(String movie_cd) throws SQLException;

}
