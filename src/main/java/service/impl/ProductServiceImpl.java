package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ProductService;
import dao.ProductMapper;
import domain.Category;
import domain.Order;
import domain.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public Product getById(int id) {
		return productMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<Product> getByCId(int cid) {
		return productMapper.selectByCid(cid);
	}
	
	@Override
	public void fillIndex(List<Category> categories) {
		for (Category c:categories){
			List<Product> ps = productMapper.selectIndexByCid(c.getId());
	        c.setProducts(ps);
        }
	}

	@Override
	public void fill(Category category) {
		List<Product> ps = getByCId(category.getId());
        category.setProducts(ps);
	}
	
	@Override
	public void fill(List<Order> orders) {
		for (Order o:orders){
			Product p = getById(o.getPid());
	        o.setProduct(p);
        }
	}

	@Override
	public void update(Product product) {
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public int deleteByCid(int cid) {
		return productMapper.deleteByCid(cid);
	}

	@Override
	public int add(Product product) {
		return productMapper.insertSelective(product);
	}

	@Override
	public void deleteById(int id) {
		productMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Product> search(String key, int cid) {
		Map<String, Object> map = new HashMap<>();
		map.put("key", key);
		if(cid<=0) {
			return productMapper.search(map);
		} else {
			map.put("cid", cid);
			return productMapper.search(map);
		}
	}
}