package kr.or.dw.command;

import kr.or.dw.vo.ProductVO;
import lombok.Data;

@Data
public class ProductModifyCommand extends ProductRegistCommand {
	
	private String oldPicture;
	private String product_cd;

	@Override
	public ProductVO toParseProduct() {
		ProductVO product = super.toParseProduct();
		product.setProduct_cd(product_cd);
		return product;
	}
	
	
}
