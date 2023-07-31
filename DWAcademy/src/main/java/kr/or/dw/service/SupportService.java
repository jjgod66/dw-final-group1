package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.FaqVO;

public interface SupportService {

	/**
	 * 자주묻는질문 목록
	 * @param cri
	 * @return
	 */
	Map<String, Object> getFaQList(SearchCriteria cri) throws SQLException;

}
