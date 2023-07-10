package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.MovieDAO;

public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException{
		List<Map<String, Object>> movieList = null;
		
		movieList = movieDAO.selectBoxOfficeMovie10();
		return movieList;
	}

}
