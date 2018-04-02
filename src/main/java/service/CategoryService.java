package service;

import java.util.List;

import domain.Category;

public interface CategoryService {

	List<Category> list();

	Category getById(int id);

	void add(Category category);

	void update(Category category);

	void deleteById(int id);
	
}