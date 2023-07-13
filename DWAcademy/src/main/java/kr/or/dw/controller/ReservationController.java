package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.MoviePaymentCommand;
import kr.or.dw.command.ReservationDetailCommand;
import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.service.ReservationService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;

	@RequestMapping("/moviePaymentForm")
	public ModelAndView moviePaymentForm(ModelAndView mnv, MoviePaymentCommand mpc, HttpSession session) throws SQLException{
		String url = "/booking/payment";
		
		Map<String, Object> mapData = null;
		mapData = reservationService.getPaymentScreenInfo(mpc.getScreen_cd());

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		mnv.addObject("mapData", mapData);
		mnv.addObject("moviePayment", mpc);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/cinema")
	public ModelAndView bookingCinema(ModelAndView mnv, String movie_cd) throws SQLException {
		String url = "/booking/cinema";
		
		if(movie_cd == null) {
			movie_cd = "";
		}
		
		List<Map<String, Object>> allTheaterList = null;
		allTheaterList = reservationService.getAllTheater();
		
		List<MovieVO> movieList = null;
		movieList = reservationService.getAllMovieRes();
		
		mnv.addObject("movieList", movieList);
		mnv.addObject("allTheater", allTheaterList);
		mnv.addObject("movie_cd", movie_cd);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/movie")
	public String bookingMovie() {
		String url = "/booking/movie";
		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView bookingDetail(ModelAndView mnv, String screen_cd) throws SQLException {
		String url = "/booking/detail";
		
		ReservationDetailCommand screen = null;
		screen = reservationService.getScreen(screen_cd);
		mnv.addObject("screen", screen);
		mnv.setViewName(url);
		return mnv;
	}


	@RequestMapping("/movieTheater")
	public ResponseEntity<List<Map<String, String>>> movieTheater(String movie_cd, String date){
		ResponseEntity<List<Map<String, String>>> entity = null;
		
		List<Map<String, String>> theaterList = null;
		try {
			theaterList = reservationService.getMovieTheater(movie_cd, date);
			entity = new ResponseEntity<List<Map<String,String>>>(theaterList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Map<String,String>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
	
	@RequestMapping("/theaterScreen")
	public ResponseEntity<List<ScreenSchedualCommand>> theaterScreen(String movie_cd, String date, String thr_name){
		ResponseEntity<List<ScreenSchedualCommand>> entity = null;
		
		List<ScreenSchedualCommand> screenSchedual = null;

		try {
			screenSchedual = reservationService.getScreenSchedual(movie_cd, date, thr_name);
			entity = new ResponseEntity<List<ScreenSchedualCommand>>(screenSchedual, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ScreenSchedualCommand>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/payResult")
	public ModelAndView payResult(MoviePaymentCommand mpc, ModelAndView mnv) {
		System.out.println("con");
		String url = "/booking/payResult";
		System.out.println("컨트롤러 : " + mpc);
		
		mnv.setViewName(url);
		return mnv;
	}
	
}
