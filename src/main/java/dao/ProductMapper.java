package dao;

import java.util.List;
import java.util.Map;

import domain.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);
    
    List<Product> selectIndexByCid(Integer cid);
    
	List<Product> selectByCid(Integer cid);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

	int deleteByCid(int cid);

	List<Product> search(Map<String,Object> map);

}