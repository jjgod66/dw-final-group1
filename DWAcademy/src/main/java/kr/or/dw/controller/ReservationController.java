package kr.or.dw.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.or.dw.command.MoviePaymentCommand;
import kr.or.dw.command.ReservationDetailCommand;
import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.service.ReservationService;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.Non_MemberVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.ReservationVO;
import kr.or.dw.vo.ScreenVO;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeException;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;


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

		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		List<CouponVO> couponList = null;
		couponList = reservationService.getCouponList(mem_cd);
		
		int point = 0;
		point = reservationService.getPoint(mem_cd);
		
		mnv.addObject("point", point);
		mnv.addObject("couponList", couponList);
		mnv.addObject("mapData", mapData);
		mnv.addObject("moviePayment", mpc);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/cinema")
	public ModelAndView bookingCinema(ModelAndView mnv, String movie_cd, HttpSession session) throws SQLException {
		String url = "/booking/cinema";
		
		if(movie_cd == null) {
			movie_cd = "";
		}
		
		List<Map<String, Object>> allTheaterList = null;
		allTheaterList = reservationService.getAllTheater();
		
		List<MovieVO> movieList = null;
		movieList = reservationService.getAllMovieRes();
		
		List<String> likeThrList = null;
		
		if(session.getAttribute("loginUser") != null) {
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			String mem_cd = (String) member.get("CD");
			likeThrList = reservationService.getMemLikeThr(mem_cd);
		}
		
		mnv.addObject("likeThrList", likeThrList);
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
	public ModelAndView bookingDetail(ModelAndView mnv, String screen_cd, Non_MemberVO non_mem, HttpServletResponse res) throws SQLException {
		String url = "/booking/detail";
		System.out.println(non_mem);
		
		if(non_mem.getNon_mem_name() != null) {
			Cookie cookie = new Cookie("non_mem", non_mem.getNon_mem_name()
												+"/"+ non_mem.getNon_mem_bir()
												+"/"+ non_mem.getNon_mem_phone()
												+"/"+ non_mem.getNon_mem_pwd());
			cookie.setMaxAge(60 * 60);
			res.addCookie(cookie);
		} 
		
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
	
	@RequestMapping("/pay0ResultRedirect")
	public String pay0ResultRedirect(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		String merchant_uid = mpc.getMerchant_uid();
		
		merchant_uid = pay0result(mpc, session);
		
		return "redirect:/reservation/paySuccess.do?merchant_uid=" + merchant_uid;
	}
	
	public String pay0result(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		List<ReservationVO> resList = new ArrayList<>();
		
		String[] seatList = mpc.getRes_seats().replace(",", "").split(" ");
		List<String> catList = new ArrayList<>();
		for(int i = 0; i < mpc.getAdultSeat(); i++) {
			catList.add("성인");
		}
		for(int i = 0; i < mpc.getTeenSeat(); i++) {
			catList.add("청소년");
		}
		for(int i = 0; i < mpc.getPreferSeat(); i++) {
			catList.add("우대");
		}

		for(int i = 0; i < seatList.length; i++) {
			ReservationVO reservation = new ReservationVO();
			reservation.setScreen_cd(mpc.getScreen_cd());
			reservation.setMerchant_uid("M" + mpc.getMerchant_uid());
			reservation.setMem_cd(mem_cd);
			reservation.setRes_seat(seatList[i]);
			reservation.setMem_cat(catList.get(i));
			reservation.setRes_no(mpc.getMerchant_uid());
			reservation.setPricesum(mpc.getPricesum());
			reservation.setDiscount(mpc.getDiscount());
			reservation.setMem_coupon_no(mpc.getMem_coupon_no());
			reservation.setUse_point(mpc.getUse_point());
			resList.add(reservation);
			
		}
		
		String merchant_uid = reservationService.pay0InsertRes(resList);
		
		return merchant_uid;
	}
	
	@RequestMapping("/payResultRedirect")
	public String payResultRedirect(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		Map<String, Object> dataMap = payResult(mpc, session);
		String merchant_uid = (String) dataMap.get("merchant_uid");
		Map<String, String> smsInfo = reservationService.getResSMSInfo(merchant_uid);
		
		SmsController s = new SmsController();
		s.reservationSMS(smsInfo);
		QRcreate(merchant_uid);
		return "redirect:/reservation/paySuccess.do?merchant_uid=" + merchant_uid;
	}
	
	@RequestMapping("/paySuccess")
	public ModelAndView paySuccess(ModelAndView mnv, String merchant_uid) throws Exception {
		String url = "/booking/payResult";
		
		Map<String, Object> mapData = null;
		mapData = reservationService.getReservationResult(merchant_uid);

//		barbecuecod(merchant_uid);
		mnv.addObject("merchant_uid", merchant_uid);
		mnv.addObject("mapData", mapData);
		mnv.setViewName(url);
		return mnv;
	}

	public Map<String, Object> payResult(MoviePaymentCommand mpc, HttpSession session) throws Exception {
		
		Gson gson = new Gson();
		PayDetailVO payDetail = gson.fromJson(mpc.getJson(), PayDetailVO.class);
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		List<ReservationVO> resList = new ArrayList<>();
		
		String[] seatList = mpc.getRes_seats().replace(",", "").split(" ");
		
		List<String> catList = new ArrayList<>();
		for(int i = 0; i < mpc.getAdultSeat(); i++) {
			catList.add("성인");
		}
		for(int i = 0; i < mpc.getTeenSeat(); i++) {
			catList.add("청소년");
		}
		for(int i = 0; i < mpc.getPreferSeat(); i++) {
			catList.add("우대");
		}
		

		
		for(int i = 0; i < seatList.length; i++) {
			ReservationVO reservation = new ReservationVO();
			reservation.setScreen_cd(mpc.getScreen_cd());
			reservation.setMerchant_uid("M" + payDetail.getMerchant_uid());
			reservation.setMem_cd(mem_cd);
			reservation.setRes_seat(seatList[i]);
			reservation.setMem_cat(catList.get(i));
			reservation.setRes_no(payDetail.getMerchant_uid());
			reservation.setPricesum(mpc.getPricesum());
			reservation.setDiscount(mpc.getDiscount());
			reservation.setMem_coupon_no(mpc.getMem_coupon_no());
			reservation.setUse_point(mpc.getUse_point());
			resList.add(reservation);
		}
		
		Map<String, Object> mapData = null;
		mapData = reservationService.getReservationResult(resList, payDetail);
		mapData.put("res_seat", mpc.getRes_seats());

		return mapData;
	}
	
	public void barbecuecod(String merchant_uid) throws Exception {
		Barcode barcode = BarcodeFactory.createCode128(merchant_uid);
        File file = new File("C:/DWAcademyFiles/barcode/reservation/" + merchant_uid + ".png");
        
        BarcodeImageHandler.savePNG(barcode, file);
	}
	
	public void QRcreate(String merchant_uid) {
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix;
		try {
			bitMatrix = qrCodeWriter.encode(merchant_uid, BarcodeFormat.QR_CODE, 200, 200);
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix);
			String fileName = merchant_uid + ".png";
			File file = new File("C:/DWAcademyFiles/QR/reservation/" + fileName);
			file.mkdirs();
			ImageIO.write(bufferedImage, "png", file);
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}
	
}
