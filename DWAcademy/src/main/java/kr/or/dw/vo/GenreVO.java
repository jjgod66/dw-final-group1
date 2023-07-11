package kr.or.dw.vo;

import lombok.Data;

@Data
public class GenreVO {
	private String genre_cd;
	private String genre_name;
	
	public GenreVO() {}
	
	public GenreVO(String genre_cd, String genre_name) {
		super();
		this.genre_cd = genre_cd;
		this.genre_name = genre_name;
	}
	
}
