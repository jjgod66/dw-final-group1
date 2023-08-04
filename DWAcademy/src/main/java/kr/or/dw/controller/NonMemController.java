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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.NonMemService;
import kr.or.dw.service.PayService;
import kr.or.dw.vo.Non_MemberVO;

@Controller
@RequestMapping("/nonMem")
public class NonMemController {

	@Autowired
	private NonMemService nonMemService;
	
	@RequestMapping("/nonMemLoginChk")
	public ResponseEntity<String> loginChk(Non_MemberVO non_mem){
		ResponseEntity<String> entity = null;
		
		String result = "N";
		try {
			result = nonMemService.getNonMemExist(non_mem);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(ModelAndView mnv, Non_MemberVO non_mem, SearchCriteria cri) throws SQLException {
		String url = "/non_member/bookinglist";
		cri.setPerPageNum("5");
		
		System.out.println("non_mem" + non_mem);
		Map<String, Object> dataMap = nonMemService.getNonMemResList(non_mem, cri);
		
		dataMap.put("non_mem", non_mem);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}

}
