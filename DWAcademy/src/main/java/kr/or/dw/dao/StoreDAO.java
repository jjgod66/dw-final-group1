package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.ProductVO;

@Mapper
public interface StoreDAO {

	List<ProductVO> selectProDiv(String CategoryIdx) throws SQLException;

	ProductVO selectProDetail(String product_cd) throws SQLException;

}
