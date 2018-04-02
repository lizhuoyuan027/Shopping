package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CategoryService;
import dao.CategoryMapper;
import domain.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> list() {
		return categoryMapper.selectAll();
	}

	@Override
	public Category getById(int id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	@Override
	public void add(Category category) {
		categoryMapper.insertSelective(category);
	}

	@Override
	public void update(Category category) {
		categoryMapper.updateByPrimaryKeySelective(category);
	}

	@Override
	public void deleteById(int id) {
		categoryMapper.deleteByPrimaryKey(id);
	}
	
}