package kr.or.dw.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/scan")
public class ScanController {

	@RequestMapping("/reservation")
	public String reservationScan() {
		return "/barcodescan/reservationBarcodeScan";
	}
	
	@RequestMapping("/reservationImgUp")
	public ResponseEntity<String> reservationImgUp(@RequestParam("barcode") MultipartFile multi){
		ResponseEntity<String> entity = null;
		
		
		
		return entity;
		
	}
}
