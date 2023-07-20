package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.TheaterVO;

public interface SysAdminService {

	/////////////////theater admin////////////////////////
	// 해당 점포리스트 불러오기
	Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void theaterRegist(TheaterVO thr) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 해당 지점 정보 수정
	void theaterModify(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void theaterDelete(String thr_name) throws SQLException;

	//////////////movie admin////////////////////////
	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

	// 영화정보 등록하기
	void registMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 등록하기
	void registMovieGenre_c(String[] genres, String movie_cd) throws SQLException;

	// 해당 영화 타입 등록하기
	void registMovieType_c(List<String> movie_types, String movie_cd) throws SQLException;

	// 해당 영화 관련 사진 등록하기
	void registMoviePic(List<String> movie_pics, String movie_cd) throws SQLException;

	// 해당 영화 예고편 등록하기
	void registMoviePre(List<String> movie_pres, String movie_cd) throws SQLException;

	// 영화 리스트 불러오기
	Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException;

	// 해당 영화 정보 불러오기
	Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 기본 정보 수정하기
	void modifyMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 수정하기
	void modifyMovieGenre_c(String[] genres, String movie_cd) throws SQLException;

	// 해당 영화 타입 수정하기
	void modifyMovieType_c(List<String> movie_types, String movie_cd) throws SQLException;
	
	// 해당 영화의 삭제할 사진 이름 불러오기
	String selectMovieDelImgByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제사진 삭제하기
	void deleteMovieImg(int pno) throws SQLException;

	// 해당 영화의 삭제할 예고편 이름 불러오기
	String selectMovieDelVideoByPno(int pno) throws SQLException;

	// 해당 영화의 선택한 삭제예고편 삭제하기
	void deleteMovieVideo(int pno) throws SQLException;

	// 해당 영화의 이미 올라간 비디오 불러오기
	List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException;

	// 새 스토어 상품 등록하기
	void registProduct(ProductVO product) throws SQLException;

	// 스토어 상품 수정하기
	void modifyProduct(ProductVO product) throws SQLException;

	// 공지사항 게시글 목록 불러오기
	Map<String, Object> selectNoticeList(SearchCriteria cri) throws SQLException;

	// 해당 공지사항 게시글 불러오기
	NoticeVO selectNoticeByNotice_no(int notice_no) throws SQLException;

	// 공지사항 등록하기
	void registNotice(NoticeVO notice) throws SQLException;

}
