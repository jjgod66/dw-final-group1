package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.SysAdminDAO;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.TheaterVO;

public class SysAdminServiceImpl implements SysAdminService {

	@Autowired
	private SysAdminDAO sysAdminDAO;
	
	@Override
	public Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException {
		
		List<TheaterVO> theaterList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		theaterList = sysAdminDAO.selectSearchTheaterList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchTheaterListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("theaterList", theaterList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<String> selectLocList() throws SQLException {
		List<String> locList = null;
		
		locList = sysAdminDAO.selectLocList();
		
		return locList;
	}

	@Override
	public void theaterRegist(TheaterVO thr) throws SQLException {
		AdminVO adminVO = new AdminVO();
		adminVO.setAdmin_id(thr.getAdmin_id());
		adminVO.setAdmin_pwd(thr.getAdmin_pwd());
		adminVO.setThr_name(thr.getThr_name());
		System.out.println("NEW ADMIN : " + adminVO);
		sysAdminDAO.insertAdmin(adminVO);
		thr.setAdmin_cd(adminVO.getAdmin_cd());
		sysAdminDAO.insertTheater(thr);
	}

	@Override
	public TheaterVO selectTheaterByName(String thr_name) throws SQLException {
		TheaterVO thr = null;
		
		thr = sysAdminDAO.selectTheaterByName(thr_name);
		
		return thr;
	}

	@Override
	public void theaterModify(TheaterVO thr) throws SQLException {
		AdminVO adminVO = new AdminVO();
		adminVO.setAdmin_id(thr.getAdmin_id());
		adminVO.setAdmin_pwd(thr.getAdmin_pwd());
		adminVO.setThr_name(thr.getThr_name());
		System.out.println(thr);
		System.out.println(adminVO);
		sysAdminDAO.updateAdmin(adminVO);
		sysAdminDAO.updateTheater(thr);
	}

	@Override
	public void theaterDelete(String thr_name) throws SQLException {
		sysAdminDAO.updateDelTheater(thr_name);
	}

	@Override
	public List<GenreVO> selectGenreList() throws SQLException {
		List<GenreVO> genreList = null;
		
		genreList = sysAdminDAO.selectGenreList();
		
		return genreList;
	}

	@Override
	public List<String> selectGradeList() throws SQLException {
		List<String> gradeList = null;
		
		gradeList = sysAdminDAO.selectGradeList();
		
		return gradeList;
	}

	@Override
	public void registMovie(MovieVO movie) throws SQLException {
		sysAdminDAO.insertMovie(movie);
	}

	@Override
	public void registMovieGenre_c(String[] genres, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String genre : genres) {
			map.put("genre", genre);
			sysAdminDAO.insertGenre_c(map);
		}
	}

	@Override
	public void registMovieType_c(List<String> movie_types, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String movie_type : movie_types) {
			map.put("movie_type_cd", movie_type);
			sysAdminDAO.insertMovieType_c(map);
		}
	}

	@Override
	public void registMoviePic(List<String> movie_pics, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String pic : movie_pics) {
			map.put("movie_pic_path", pic);
			sysAdminDAO.insertMoviePic(map);
		}
	}

	@Override
	public void registMoviePre(List<String> movie_pres, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String pre : movie_pres) {
			map.put("movie_pre_path", pre);
			sysAdminDAO.insertMoviePre(map);
		}
		
	}

	@Override
	public Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException {
		List<Map<String, Object>> movieList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		movieList = sysAdminDAO.selectSearchMovieList(cri, rowBounds);
		
		for (Map<String, Object> movie : movieList) {
			String movie_cd = (String)movie.get("MOVIE_CD");
			double reserveRatio = sysAdminDAO.selectReservRatio(movie_cd);
			movie.put("reserveRatio", reserveRatio);
		}
		int totalCount = sysAdminDAO.selectSearchMovieListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("movieList", movieList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException {
		//영화 기본정보
		Map<String, Object> movie = sysAdminDAO.selectMovieByMovie_cd(movie_cd);
		//영화 장르
		List<String> movieGenreList = sysAdminDAO.selectGenreByMovie_cd(movie_cd);
		movie.put("movieGenreList", movieGenreList);
		//영화 타입
		List<String> movieTypeListBefore = sysAdminDAO.selectTypeByMovie_cd(movie_cd);
		Set<String> set = new HashSet<>();
		for (String movieType : movieTypeListBefore) {
			set.add(movieType.substring(0, 2));
			set.add(movieType.substring(2));
		}
		List<String> movieTypeListAfter = new ArrayList<String>(set);
		movie.put("movieTypeList", movieTypeListAfter);
		//영화 관련 사진
		List<Map<String, Object>> movieImgList = sysAdminDAO.selectMoiveImgByMovie_cd(movie_cd);
		movie.put("movieImgList", movieImgList);
		return movie;
	}

	@Override
	public void modifyMovie(MovieVO movie) throws SQLException {
		sysAdminDAO.updateMovie(movie);
	}

	@Override
	public void modifyMovieGenre_c(String[] genres, String movie_cd) throws SQLException {
		sysAdminDAO.deleteMovieGenre_c(movie_cd);
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String genre : genres) {
			map.put("genre", genre);
			sysAdminDAO.insertGenre_c(map);
		}
	}

	@Override
	public void modifyMovieType_c(List<String> movie_types, String movie_cd) throws SQLException {
		sysAdminDAO.deleteMovieType_c(movie_cd);
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String movie_type : movie_types) {
			map.put("movie_type_cd", movie_type);
			sysAdminDAO.insertMovieType_c(map);
		}
	}

	@Override
	public String selectMovieDelImgByPno(int pno) throws SQLException {
		
		return sysAdminDAO.selectMovieDelImgByPno(pno);
	}

	@Override
	public void deleteMovieImg(int pno) throws SQLException {
		sysAdminDAO.deleteMovieImg(pno);
	}

	@Override
	public String selectMovieDelVideoByPno(int pno) throws SQLException {
		return sysAdminDAO.selectMovieDelVideoByPno(pno);
	}

	@Override
	public void deleteMovieVideo(int pno) throws SQLException {
		sysAdminDAO.deleteMovieVideo(pno);
	}

	@Override
	public List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException {
		List<Map<String, Object>> selectMoiveVideoByMovie_cd = null;
		
		selectMoiveVideoByMovie_cd = sysAdminDAO.selectMoiveVideoByMovie_cd(movie_cd);
		
		return selectMoiveVideoByMovie_cd;
	}

}
