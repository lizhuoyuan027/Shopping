package test;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import service.CategoryService;
import domain.Category;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class CategoryServiceTest {
	
	@Resource
	private CategoryService categoryService;
	
	@Test
	public void testGetByName() {
		Category category = categoryService.getById(1);
		Assert.assertNotNull(category);
	}
}
