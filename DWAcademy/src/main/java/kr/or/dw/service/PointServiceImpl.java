package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.PointDAO;

public class PointServiceImpl implements PointService{

	@Autowired
	private PointDAO pointDAO;

	@Override
	public void insertMoviePoint() throws SQLException{
		List<Map<String, Object>> pointInList = null;
		pointInList = pointDAO.selectpointInList();
		System.out.println(pointInList);
		
		for(Map<String, Object> pointIn : pointInList) {
			pointDAO.insertMoviePoint(pointIn);
		}
	}
}
