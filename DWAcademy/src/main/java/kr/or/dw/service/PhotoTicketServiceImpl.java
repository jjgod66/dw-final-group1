package kr.or.dw.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.PhotoTicketDAO;

public class PhotoTicketServiceImpl implements PhotoTicketService{

	@Autowired
	private PhotoTicketDAO photoTicketDAO;
}
