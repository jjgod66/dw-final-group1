package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.PdsRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.AttachDAO;
import kr.or.dw.service.PdsService;
import kr.or.dw.vo.AttachVO;
import kr.or.dw.vo.PdsVO;

@Controller
@RequestMapping("/pds")
public class PdsController {

	@Resource(name= "fileUploadPath")
	private String fileUploadPath;
	
	@Autowired
	private PdsService pdsService;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@RequestMapping("/main")
	public String main() {
		return "pds/main.open";
	}
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "pds/list.open";
		
		Map<String, Object> dataMap = pdsService.selectPdsList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "pds/regist.open";
		
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(PdsRegistCommand registReq, HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<AttachVO> attachList = saveFile(registReq);
		
		PdsVO pds = registReq.toPdsVO();
		pds.setAttachList(attachList);
		pds.setTitle((String)req.getAttribute("XSStitle"));
		
		pdsService.regist(pds);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('정상적으로 등록되었습니다.'); window.opener.location.href='" + req.getContextPath() + "/pds/list';");
		out.println("window.close(); </script>");
		out.close();
	}

	private List<AttachVO> saveFile(PdsRegistCommand registReq) throws Exception {
		String fileUploadPath = this.fileUploadPath;
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if (registReq.getUploadFile() != null) {
			for (MultipartFile multi : registReq.getUploadFile()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
				File target = new File(fileUploadPath, fileName);
				
				if (!target.exists()) {
					target.mkdirs();
				}
				
				multi.transferTo(target);
				
				AttachVO attach = new AttachVO();
				attach.setUploadpath(fileUploadPath);
				attach.setFilename(fileName);
				attach.setFiletype(fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase());
				
				attachList.add(attach);
			}
		}
		
		return attachList;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, int pno, String from) throws SQLException {
		String url = "pds/detail.open";
		
		if (from != null) {
			url = "pds/modify.open";
		}
		
		PdsVO pds = null;
		pds = pdsService.selectPds(pno, from);
		
		// 파일명 재정의
		List<AttachVO> attachList = pds.getAttachList();
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				String fileName = attach.getFilename().split("\\$\\$")[1];
				attach.setFilename(fileName);
			}
		}
		
		mnv.addObject("pds", pds);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/getFile")
	public ResponseEntity<byte[]> getFile(int ano) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		 
		AttachVO attach = attachDAO.selectAttachByAno(ano);
		
		String fileUploadPath = this.fileUploadPath;
		String fileName = attach.getFilename();
		
		try {
			in = new FileInputStream(fileUploadPath + File.separator + fileName);
			fileName = fileName.substring(fileName.lastIndexOf("$$") + 2);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
}
