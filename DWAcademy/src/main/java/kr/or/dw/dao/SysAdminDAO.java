package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.TheaterVO;


@Mapper
public interface SysAdminDAO {
	
	// 해당하는 극장 목록을 불러온다.
	List<TheaterVO> selectSearchTheaterList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 극장의 총 개수를 불러온다.
	int selectSearchTheaterListCount(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void insertTheater(TheaterVO thr) throws SQLException;
	
	// 새 관리자 등록
	void insertAdmin(AdminVO adminVO) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 지점 관리자 아이디/패스워드 수정
	void updateAdmin(AdminVO adminVO) throws SQLException;

	// 해당 극장 지점 정보 수정
	void updateTheater(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void updateDelTheater(String thr_name) throws SQLException;

	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 상영등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

	// 영화정보 등록하기
	void insertMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 등록하기
	void insertGenre_c(Map<String, String> map) throws SQLException;

	// 해당 영화 타입 등록하기
	void insertMovieType_c(Map<String, String> map) throws SQLException;

	// 해당 영화 관련 사진 등록하기
	void insertMoviePic(Map<String, String> map) throws SQLException;
	
	// 해당 영화 예고편 등록하기
	void insertMoviePre(Map<String, String> map) throws SQLException;

	// 해당하는 영화 목록을 불러온다.
	List<Map<String, Object>> selectSearchMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 영화의 총 개수를 불러온다.
	int selectSearchMovieListCount(SearchCriteria cri) throws SQLException;

	// 해당 영화 정보 불러오기
	Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 장르 불러오기
	List<String> selectGenreByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 예매율 불러오기
	double selectReservRatio(String movie_cd) throws SQLException;

	// 해당 영화 타입 불러오기
	List<String> selectTypeByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 관련 이미지 불러오기
	List<Map<String, Object>> selectMoiveImgByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 기본 정보 수정하기
	void updateMovie(MovieVO movie) throws SQLException;
	
	// 해당 영화 기존 장르 지우기
	void deleteMovieGenre_c(String movie_cd) throws SQLException;

	// 해당 영화 기존 타입 지우기
	void deleteMovieType_c(String movie_cd) throws SQLException;
	
	// 해당 영화의 삭제할 사진 이름 불러오기
	String selectMovieDelImgByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제사진 삭제하기
	void deleteMovieImg(int pno) throws SQLException;

	// 해당 영화의 선택한 삭제사진 삭제하기
	String selectMovieDelVideoByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제예고편 삭제하기
	void deleteMovieVideo(int pno) throws SQLException;

	// 해당 영화의 이미 올라간 비디오 불러오기
	List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException;

	// 새 스토어 상품 등록하기
	void insertProduct(ProductVO product) throws SQLException;

}
