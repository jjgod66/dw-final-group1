package kr.or.dw.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.TheaterService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.NoticeVO;
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
		List<Map<String, Object>> noticeList = null;
		noticeList = theaterService.getThrNotice();
		
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("thrList", thrList);
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
		
		List<NoticeVO> noticeList = null;
		noticeList = theaterService.getThisThrNotice(thr_name);
		
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("theater", theater);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/screenSchedule")
	public ModelAndView screenSchedule(ModelAndView mnv, String thr_name) throws SQLException {
		String url = "/theater/screenSchedule";
		
		TheaterVO theater = null;
		theater = theaterService.getTheaterInfo(thr_name);
		
		List<List<List<Map<String,Object>>>> allScreenList = null;
		allScreenList = theaterService.getAllScreenList(thr_name, new Date());
		
		System.out.println(allScreenList);
		
		mnv.addObject("allScreenList", allScreenList);
		mnv.addObject("theater", theater);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/scheduleDay")
	public ResponseEntity<List<List<List<Map<String,Object>>>>> scheduleDay(String thr_name, String date) throws ParseException{
		ResponseEntity<List<List<List<Map<String,Object>>>>> entity = null;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        Date dDate = formatter.parse(date);
        
        List<List<List<Map<String,Object>>>> allScreenList = null;
		try {
			allScreenList = theaterService.getAllScreenList(thr_name, dDate);
			entity = new ResponseEntity<List<List<List<Map<String,Object>>>>>(allScreenList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<List<List<Map<String,Object>>>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	
	
	@RequestMapping("/likeThr")
	public ResponseEntity<String> clickLikeThr(String thr_name, HttpSession session){
		String mem_cd = ((MemberVO) session.getAttribute("loginUser")).getMem_cd();
		
		ResponseEntity<String> entity = null;
		
		String result = "";
		try {
			result = theaterService.clickLikeThr(thr_name, mem_cd);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/likeThrYN")
	public ResponseEntity<String> likeThrYN(String thr_name, HttpSession session){
		ResponseEntity<String> entity = null;
		String mem_cd = ((MemberVO) session.getAttribute("loginUser")).getMem_cd();
		String result = "N";
		
		int cnt = 0;
		try {
			cnt = theaterService.likeThrYN(thr_name, mem_cd);
			if(cnt > 0) {
				result = "Y";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		
		return entity;
	}

}
