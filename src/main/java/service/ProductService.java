package service;

import java.util.List;

import domain.Category;
import domain.Order;
import domain.Product;

public interface ProductService {

	void fillIndex(List<Category> categories);

	void fill(Category category);
	
	void fill(List<Order> orders);

	Product getById(int id);

	void update(Product product);

	int deleteByCid(int cid);

	List<Product> getByCId(int cid);

	int add(Product product);

	void deleteById(int id);

	List<Product> search(String key, int cid);
}
