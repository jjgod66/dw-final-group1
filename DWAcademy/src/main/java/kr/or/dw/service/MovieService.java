package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface MovieService {

	/**
	 * 영화예매순으로 10개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException;

}
