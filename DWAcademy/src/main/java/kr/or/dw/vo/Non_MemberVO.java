package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Non_MemberVO {
	private String non_mem_cd;
	private String non_mem_name;
	private String non_mem_bir;
	private String non_mem_phone;
	private String non_mem_pwd;
	private Date non_mem_bir_d;
	
	public Non_MemberVO(){}
}
