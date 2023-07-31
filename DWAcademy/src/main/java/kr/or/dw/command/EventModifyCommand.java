package kr.or.dw.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dw.vo.EventVO;
import lombok.Data;

@Data
public class EventModifyCommand {
 
	private int event_no;
	private String relate_cd;
	private String event_div;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate;
	private String event_title;
	private String event_content;
	private String event_pic_path;
	private String oldFileName;
	private String removeFileName;	// 예전 썸네일 이미지 이름
	private MultipartFile event_thum_path;
	
	
	public EventVO toEventVO () {
		EventVO event = new EventVO();
		event.setEvent_no(event_no);
		event.setRelate_cd(relate_cd);
		event.setEvent_div(event_div);
		event.setEnddate(enddate);
		event.setEvent_title(event_title);
		event.setEvent_content(event_content);
		event.setEvent_pic_path(event_pic_path);
		
		return event;
	}
}
