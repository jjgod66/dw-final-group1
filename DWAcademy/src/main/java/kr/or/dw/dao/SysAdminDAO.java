package kr.or.dw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.TheaterVO;


@Mapper
public interface SysAdminDAO {
	
	// 해당하는 극장 목록을 불러온다.
	List<TheaterVO> selectSearchTheaterList(SearchCriteria cri, RowBounds rowBounds);

	// 해당하는 극장의 총 개수를 불러온다.
	int selectSearchTheaterListCount(SearchCriteria cri);

	// 지역 리스트 불러오기
	List<String> selectLocList();

	// 새 지점 등록
	void insertTheater(TheaterVO thr);
	
	// 새 관리자 등록
	void insertAdmin(AdminVO adminVO);

}
