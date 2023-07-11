package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
import kr.or.dw.service.ReservationService;


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;

	@RequestMapping("/moviePaymentForm")
	public ModelAndView moviePaymentForm(ModelAndView mnv, MoviePaymentCommand mpc) {
		String url = "/booking/payment";
		
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
	public String bookingDetail() {
		String url = "/booking/detail";
		return url;
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
	
	
}
