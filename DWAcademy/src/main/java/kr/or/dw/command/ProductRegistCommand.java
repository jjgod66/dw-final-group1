package kr.or.dw.command;

import org.springframework.web.multipart.MultipartFile;

import kr.or.dw.vo.ProductVO;
import lombok.Data;

@Data
public class ProductRegistCommand {
	private String product_name;
	private String product_content;
	private String product_price;
	private String product_div;
	private String product_period;
	private String product_info;
	private MultipartFile product_pic_path;
	
	public ProductVO toParseProduct() {
		ProductVO product = new ProductVO();
		product.setProduct_name(product_name);
		product.setProduct_content(product_content);
		product.setProduct_price(Integer.parseInt(product_price));
		product.setProduct_div(product_div);
		product.setProduct_period(Integer.parseInt(product_period));
		product.setProduct_info(product_info);
		product.setProduct_pic_path(product_pic_path.getOriginalFilename());
		
		 return product;
	}
}
