package kr.or.dw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.TheaterVO;


@Mapper
public interface SysAdminDAO {

	// 해당하는 극장 목록을 불러온다.
	List<TheaterVO> selectSearchTheaterList(SearchCriteria cri, RowBounds rowBounds);

	// 해당하는 극장의 총 개수를 불러온다.
	int selectSearchTheaterListCount(SearchCriteria cri);

}
