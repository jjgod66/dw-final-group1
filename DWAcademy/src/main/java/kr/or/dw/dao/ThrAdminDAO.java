package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.aop.ThrowsAdvice;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;

@Mapper
public interface ThrAdminDAO {

	//상영 영화 스크린리스트 가져오기 
	List<MovieVO> selectAllScreens() throws SQLException;
	
	List<MovieVO> selectAllScreens1() throws SQLException; 
//t상영영화 스타터 시간 쓸려고함 
	List<ScreenVO> selectAllStart() throws SQLException;
	
	//배경색 위한것 
	List<Map<String, Object>> selectAllRe() throws SQLException;
	ClickMovieInfoVO selectAllRe1(String screenCd) throws SQLException;
	
	//해당영화목록 불러 
	List<Map<String, Object>> selectSearchMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;
	
	//ddP예매율 불러 오기 
	double selectReservRatio(String movie_cd) throws SQLException;
	
	//du해당 영화 총 개수 불러
	int selectSearchMovieListCount(SearchCriteria cri) throws SQLException;
	
	//ro여옿영화 갯수 
	int getTotalReCount() throws SQLException;
	
	
	List<MovieVO> selectList(Map<String, Integer> parameterMap) throws SQLException;

	int getTotalReCount1(SearchCriteria cri) throws SQLException;

	List<Map<String, Object>> getAllMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	
	
	

}
