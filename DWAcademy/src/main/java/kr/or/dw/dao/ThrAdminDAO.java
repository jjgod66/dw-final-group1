package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;

@Mapper
public interface ThrAdminDAO {

	//상영 영화 스크린리스트 가져오기 
	List<MovieVO> selectAllScreens() throws SQLException;
//t상영영화 스타터 시간 쓸려고함 
	List<ScreenVO> selectAllStart() throws SQLException;
	
	//배경색 위한것 
	List<Map<String, Object>> selectAllRe() throws SQLException;
	ClickMovieInfoVO selectAllRe1(String screenCd) throws SQLException;

}
