package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
}
