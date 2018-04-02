package web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.CategoryService;
import service.ProductService;
import domain.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	
	/**
	 * 添加类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_addCategory.html")
	public String addCategory(HttpServletRequest request, Category category) {
		categoryService.add(category);
		return "redirect:admin_listCategory.html";
	}
	
	/**
	 * 编辑类别页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_editCategory.html")
	public ModelAndView editCategoryPage(HttpServletRequest request, int id) {
		ModelAndView view = new ModelAndView();
		Category category = categoryService.getById(id);
		view.addObject("category", category);
		view.setViewName("admin/editCategory");
		return view;
	}
	
	/**
	 * 更改类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_updateCategory.html")
	public String updateCategory(HttpServletRequest request, Category category) {
		categoryService.update(category);
		return "redirect:admin_listCategory.html";
	}
	
	/**
	 * 删除类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_deleteCategory.html")
	public String deleteCategory(HttpServletRequest request, int id) {
		productService.deleteByCid(id);
		categoryService.deleteById(id);
		return "redirect:admin_listCategory.html";
	}
}
