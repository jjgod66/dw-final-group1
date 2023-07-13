package kr.or.dw.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.dw.command.MoviePaymentCommand;
import kr.or.dw.command.ReservationDetailCommand;
import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.service.ReservationService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.ReservationVO;
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
	
	@RequestMapping("/payResultRedirect")
	public String payResultRedirect(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		Map<String, Object> dataMap = payResult(mpc, session);

		return "redirect:/paySuccess.do?merchant_uid=" + dataMap.get("merchant_uid");
	}
	
	@RequestMapping("/paySuccess")
	public ModelAndView paySuccess(ModelAndView mnv, String merchant_uid) {
		String url = "/booking/payResult";
		
		mnv.addObject("mu", merchant_uid);
		mnv.setViewName(url);
		return mnv;
	}

	public Map<String, Object> payResult(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		System.out.println("con");
		String url = "/booking/payResult";
		System.out.println("컨트롤러mpc : " + mpc);
//		JSONParser parser = new JSONParser();
//		JSONObject jsonObj = (JSONObject) parser.parse(mpc.getJson());
//		System.out.println(jsonObj);
		
		Gson gson = new Gson();
		PayDetailVO payDetail = gson.fromJson(mpc.getJson(), PayDetailVO.class);
		System.out.println(payDetail);

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		List<ReservationVO> resList = new ArrayList<>();
		
		String[] seatList = mpc.getRes_seats().replace(",", "").split(" ");
		
		String mem_cat = "";
		if(mpc.getAdultSeat() > 0) {
			mem_cat += "성인 " + mpc.getAdultSeat();
			if(mpc.getTeenSeat() > 0) {
				mem_cat += ", 청소년 " + mpc.getTeenSeat();
				if(mpc.getPreferSeat() > 0) {
					mem_cat += ", 우대 " + mpc.getPreferSeat();
				}
			}else {
				if(mpc.getPreferSeat() > 0) {
					mem_cat += ", 우대 " + mpc.getPreferSeat();
				}
			}
		}else {
			if(mpc.getTeenSeat() > 0) {
				mem_cat += "청소년 " + mpc.getTeenSeat();
				if(mpc.getPreferSeat() > 0) {
					mem_cat += ", 우대 " + mpc.getPreferSeat();
				}else {
					if(mpc.getPreferSeat() > 0) {
						mem_cat += "우대 " + mpc.getPreferSeat();
					}
				}
			}
		}
		Date resDate = new Date(payDetail.getPaid_at());
		
		for(int i = 0; i < seatList.length; i++) {
			ReservationVO reservation = new ReservationVO();
			reservation.setScreen_cd(mpc.getScreen_cd());
			reservation.setMerchant_uid("M" + payDetail.getMerchant_uid());
			reservation.setMem_cd(loginUser.getMem_cd());
			reservation.setRes_seat(seatList[i]);
			reservation.setMem_cat(mem_cat);
			reservation.setResdate(resDate);
			reservation.setRes_no(payDetail.getMerchant_uid());
			resList.add(reservation);
		}
		
		Map<String, Object> mapData = null;
		mapData = reservationService.getReservationResult(resList, payDetail);
		mapData.put("mem_cat", mem_cat);
		mapData.put("res_seat", mpc.getRes_seats());

		return mapData;
	}
	
}
