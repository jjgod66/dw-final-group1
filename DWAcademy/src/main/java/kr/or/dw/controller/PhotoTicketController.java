package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.or.dw.command.PhotoTicketPayCommand;
import kr.or.dw.service.PhotoTicketService;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PhotoTicketVO;

@Controller
@RequestMapping("/photoTicket")
public class PhotoTicketController {

	@Resource(name ="photoTicketUploadPath")
	private String photoTicketUploadPath;
	
	@Autowired
	private PhotoTicketService photoTicketService;
	

		@RequestMapping("/uploadImg")
		public ResponseEntity<String> photoFront(@RequestParam("croppedImage") MultipartFile multi) throws Exception{
			ResponseEntity<String> entity = null;
			System.out.println(multi);
			
			String result = "";
			HttpStatus status = null;
			
			if((result = savePicture(multi, "front")) == null) {
				result = "업로드를 실패했습니다.";
				status = HttpStatus.BAD_REQUEST;
			}else {
				status = HttpStatus.OK;
			}
			
			entity = new ResponseEntity<String>(result, status);
			
			
	 		return entity;
		}
		@RequestMapping("/back")
		public ResponseEntity<String> photoBack(@RequestParam("croppedImage") MultipartFile multi) throws Exception{
			ResponseEntity<String> entity = null;
			System.out.println(multi);
			
			String result = "";
			HttpStatus status = null;
			
			if((result = savePicture(multi, "back")) == null) {
				result = "업로드를 실패했습니다.";
				status = HttpStatus.BAD_REQUEST;
			}else {
				status = HttpStatus.OK;
			}
			
			entity = new ResponseEntity<String>(result, status);
			
			
			return entity;
		}
		
		/*
		 * @Resource는 @AutoWired와 같이 property injection을 위한 어노테이션이다.
		 * 차이점은 
		 * @AuthWired는 객체 타입을 보고 맵핑 된다면
		 * @Resource는 객체 name(id)를 보고 맵핑이 된다.
		 * 괄호에 객체 name을 명시하지 않으면 @AutoWired처럼 해당 레퍼런스변수의 타입과 똑같은 객체 name을 찾는다.
		 */
		
		private String savePicture(MultipartFile multi, String uploadPath) throws Exception {
			
			String fileName = null;
			
			/* 파일 유무 확인 */
			if(!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)) {
				/*파일 저장 폴더 설정	*/
				uploadPath = photoTicketUploadPath + File.separator + uploadPath;
				fileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
				File storeFile = new File(uploadPath, fileName);
				
				storeFile.mkdirs();
				
				//local HDD에 저장.
				multi.transferTo(storeFile);
			}
			
			return fileName;
		}
	
		@RequestMapping("/edit")
		public ModelAndView photoTicketMain(ModelAndView mnv, String merchant_uid) throws SQLException {
			String url = "/booking/photoTicket";
			
			Map<String, Object> dataMap = null;
			
			dataMap = photoTicketService.getMovieInfo(merchant_uid);
			
			
			
			mnv.addObject("dataMap", dataMap);
			mnv.setViewName(url);
			return mnv;
		}
		
		@RequestMapping("/getQR")
		public ResponseEntity<byte[]> getPicture(String merchant_uid) throws IOException  {
			
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;
			String imgPath = "";
			imgPath =  "C:/DWAcademyFiles/QR/reservation";
			
			try {
				in = new FileInputStream(new File(imgPath, merchant_uid + ".png"));
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
			} finally {
				in.close();
			}
			return entity;
		}
		
		@RequestMapping("/pay")
		public void photoTicketPay(HttpSession session, PhotoTicketPayCommand ptc, HttpServletResponse res, HttpServletRequest req) throws Exception {
			
			Gson gson = new Gson();
			PayDetailVO payDetail = gson.fromJson(ptc.getJson(), PayDetailVO.class);
			
			PhotoTicketVO photoTicket = new PhotoTicketVO();
			photoTicket.setBack_path(ptc.getBack_path());
			photoTicket.setFront_path(ptc.getFront_path());
			photoTicket.setMerchant_uid(ptc.getMerchant_uid());
			
			photoTicketService.payPhotoTicket(payDetail, photoTicket);
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("location.href='" + req.getContextPath() + "/member/bookinglist.do';");
			out.println("</script>");
			out.flush();
			out.close();
		}
}
