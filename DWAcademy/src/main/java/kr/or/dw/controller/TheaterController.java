package kr.or.dw.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.TheaterService;
import kr.or.dw.vo.TheaterVO;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);
	
	@Autowired
	private TheaterService theaterService;

	@RequestMapping("/main")
	public ModelAndView theaterMain(ModelAndView mnv) throws SQLException {
		String url = "/theater/main";
		
		String[] thrList = null;
		String loc = "서울";
		thrList = theaterService.getThrListByLoc(loc);
		
		mnv.addObject(thrList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/locSelect")
	public ResponseEntity<String[]> selectLoc(String thr_loc){
		ResponseEntity<String[]> entity = null;
		
		String[] thrList = null;
		try {
			thrList = theaterService.getThrListByLoc(thr_loc);
			entity = new ResponseEntity<String[]>(thrList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	
	}
	
	@RequestMapping("/theater")
	public ModelAndView theater(ModelAndView mnv, String thr_name) throws SQLException {
		String url = "/theater/theater";
		
		TheaterVO theater = null;
		theater = theaterService.getTheaterInfo(thr_name);
		
		mnv.addObject("theater", theater);
		mnv.setViewName(url);
		
		return mnv;
	}

}
