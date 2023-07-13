package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.SysAdminDAO;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.GenreVO;
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
			System.out.println("[[[[[[" + map.keySet().toString());
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

}
