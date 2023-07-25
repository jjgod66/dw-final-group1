package kr.or.dw.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dw.service.PhotoTicketService;

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
	
}
